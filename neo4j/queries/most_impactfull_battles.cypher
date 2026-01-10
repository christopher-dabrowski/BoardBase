MATCH (b:Battle)
OPTIONAL MATCH (attackingHouse:House)-[:ATTACKED_IN]->(b)
OPTIONAL MATCH (defendingHouse:House)-[:DEFENDED_IN]->(b)
OPTIONAL MATCH (attackCommander:Person)-[:COMMANDED_ATTACK_IN]->(b)
OPTIONAL MATCH (defenseCommander:Person)-[:COMMANDED_DEFENSE_IN]->(b)
OPTIONAL MATCH (r:Region)<-[:TOOK_PLACE_IN]-(b)

WITH
  b,
  count(DISTINCT attackingHouse) AS attackingHouses,
  count(DISTINCT defendingHouse) AS defendingHouses,
  count(DISTINCT attackCommander) AS attackCommanders,
  count(DISTINCT defenseCommander) AS defenseCommanders,
  r.name AS region

WITH
  b,
  attackingHouses + defendingHouses AS totalHouses,
  attackCommanders + defenseCommanders AS totalCommanders,
  region

WITH
  b.name AS battleName,
  b.year AS year,
  region,
  b.battleType AS battleType,
  b.majorDeath AS hadMajorDeath,
  b.majorCapture AS hadMajorCapture,
  coalesce(b.attackerSize, 0) + coalesce(b.defenderSize, 0) AS totalArmySize,
  totalHouses,
  totalCommanders,
  (CASE
      WHEN b.majorDeath THEN 20
      ELSE 0
    END) +
  (CASE
      WHEN b.majorCapture THEN 10
      ELSE 0
    END) +
  (totalHouses * 2) +
  (totalCommanders * 1) +
  (coalesce(b.attackerSize, 0) + coalesce(b.defenderSize, 0)) / 1000.0 AS impactScore
ORDER BY impactScore DESC, year ASC
LIMIT 10

RETURN
  battleName,
  year,
  region,
  battleType,
  hadMajorDeath,
  hadMajorCapture,
  totalArmySize,
  totalHouses,
  totalCommanders,
  round(impactScore * 100) / 100 AS impactScore;
