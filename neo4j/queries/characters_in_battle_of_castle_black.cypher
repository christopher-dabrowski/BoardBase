WITH 'Battle of Castle Black' AS battleName
MATCH (p:Person)-[r:COMMANDED_ATTACK_IN]->(b:Battle {name: battleName})
RETURN p.name AS person, 'King' AS role, 'Attacker' AS side, b.name AS battle
  UNION
WITH 'Battle of Castle Black' AS battleName
MATCH (p:Person)-[r:COMMANDED_DEFENSE_IN]->(b:Battle {name: battleName})
RETURN p.name AS person, 'King' AS role, 'Defender' AS side, b.name AS battle
  UNION
WITH 'Battle of Castle Black' AS battleName
MATCH (p:Person)-[:COMMANDED_ATTACK_IN]->(b:Battle {name: battleName})
RETURN
  p.name AS person,
  'Commander' AS role,
  'Attacker' AS side,
  b.name AS battle
  UNION
WITH 'Battle of Castle Black' AS battleName
MATCH (p:Person)-[:COMMANDED_DEFENSE_IN]->(b:Battle {name: battleName})
RETURN
  p.name AS person,
  'Commander' AS role,
  'Defender' AS side,
  b.name AS battle
ORDER BY side, role, person
