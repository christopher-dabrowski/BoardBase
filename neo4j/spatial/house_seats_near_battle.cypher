WITH 'Battle of Castle Black' AS battleName
MATCH (b:Battle {name: battleName}), (s:Seat)
WHERE b.location IS NOT NULL AND s.location IS NOT NULL
OPTIONAL MATCH (s)-[:SEAT_OF]->(h:House)
OPTIONAL MATCH (h)-[attack:ATTACKED_IN]->(b)
OPTIONAL MATCH (h)-[defend:DEFENDED_IN]->(b)
WITH b, s, h, point.distance(b.location, s.location) AS distance, attack, defend
ORDER BY distance ASC
LIMIT 3
RETURN
  s.name AS seat,
  h.name AS house,
  distance,
  CASE
    WHEN attack IS NOT NULL THEN 'Attacker'
    WHEN defend IS NOT NULL THEN 'Defender'
    ELSE 'Not involved'
  END AS involvement,
  b.name AS battle,
  b.location AS battleLocation,
  s.location AS seatLocation;
