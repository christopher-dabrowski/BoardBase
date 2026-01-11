MATCH (s:Seat)-[:SEAT_OF]->(h:House), (b:Battle)
WHERE s.location IS NOT NULL AND b.location IS NOT NULL
WITH s, h, b, point.distance(s.location, b.location) AS distance
WHERE distance < 100_000
RETURN
  s.name AS seat,
  h.name AS house,
  count(b) AS battlesNearby,
  round(avg(distance), 2) AS averageDistance,
  round(min(distance), 2) AS closestBattle
ORDER BY battlesNearby DESC
LIMIT 10;
