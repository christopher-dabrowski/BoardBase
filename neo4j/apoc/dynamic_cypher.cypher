MATCH (h:House)
WITH h.name AS houseName
LIMIT 5
CALL
  apoc.cypher.run(
    'MATCH (p:Person)-[:ALLIED_WITH]->(h:House {name: $house})
     RETURN h.name AS house, COUNT(p) AS members',
    {house: houseName}
  )
  YIELD value
RETURN value.house, value.members
ORDER BY value.members DESC;
