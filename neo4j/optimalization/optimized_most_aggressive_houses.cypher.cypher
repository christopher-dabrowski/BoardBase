MATCH (h:House)
OPTIONAL MATCH (h)-[:BRANCH_OF*]->(mainHouse:House)
WHERE NOT exists((mainHouse)-[:BRANCH_OF]->())
WITH h, coalesce(mainHouse, h) AS main
MERGE (h)-[:MAIN_HOUSE]->(main);

MATCH (h:House)-[r:ATTACKED_IN]->(b:Battle)
OPTIONAL MATCH (h)-[:MAIN_HOUSE]->(mainHouse:House)
WITH coalesce(mainHouse, h) AS mainHouse, r, b
WITH
  mainHouse,
  count(b) AS totalAttacks,
  sum(
    CASE
      WHEN r.won = true THEN 1
      ELSE 0
    END) AS attacksWon,
  sum(
    CASE
      WHEN r.won = false THEN 1
      ELSE 0
    END) AS attacksLost
WITH
  mainHouse,
  totalAttacks,
  attacksWon,
  attacksLost,
  round(toFloat(attacksWon) / totalAttacks * 100, 2) AS winRate
RETURN
  mainHouse.name AS house,
  totalAttacks,
  attacksWon,
  attacksLost,
  winRate + '%' AS attackWinRate
ORDER BY totalAttacks DESC, winRate DESC
LIMIT 10;
