WITH
  point({latitude: 50, longitude: -6}) AS northRegionLowerLeft, // my general assumption
  point({latitude: 60, longitude: 3}) AS northRegionUpperRight
MATCH (b:Battle)
WHERE
  b.location IS NOT NULL AND
  point.withinBBox(b.location, northRegionLowerLeft, northRegionUpperRight)
RETURN b.name, b.year, b.location.latitude AS lat, b.location.longitude AS lon
ORDER BY b.year;
