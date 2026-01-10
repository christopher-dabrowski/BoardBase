LOAD CSV WITH HEADERS FROM 'file:///battles_spatial.csv' AS row
MATCH (b:Battle {name: row.name})
SET
  b.location =
    point({latitude: toFloat(row.latitude), longitude: toFloat(row.longitude)});
