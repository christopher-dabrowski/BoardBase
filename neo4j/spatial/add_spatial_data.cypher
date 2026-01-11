LOAD CSV WITH HEADERS FROM 'file:///battles_spatial.csv' AS row
MATCH (b:Battle {name: row.name})
SET
  b.location =
    point({latitude: toFloat(row.latitude), longitude: toFloat(row.longitude)});

LOAD CSV WITH HEADERS FROM 'file:///seat_spatial.csv' AS row
WITH row
WHERE
  row.latitude IS NOT NULL AND
  row.longitude IS NOT NULL AND
  row.latitude <> '' AND
  row.longitude <> ''
MATCH (s:Seat {name: row.name})
SET
  s.location =
    point({latitude: toFloat(row.latitude), longitude: toFloat(row.longitude)});
