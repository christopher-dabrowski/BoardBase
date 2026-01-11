WITH 'Ayja Stark' AS search_name
MATCH (p:Person)
WITH p, apoc.text.jaroWinklerDistance(p.name, search_name) AS similarity
RETURN p.name, similarity
ORDER BY similarity ASC
LIMIT 5;
