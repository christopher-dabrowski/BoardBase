CALL gds.graph.drop('articulationPointsGraph')

MATCH (source)-[r]->(target)
RETURN
  gds.graph.project(
    'articulationPointsGraph',
    source,
    target,
    {},
    {undirectedRelationshipTypes: ['*']}
  );

CALL gds.articulationPoints.stream('articulationPointsGraph') YIELD nodeId
WITH gds.util.asNode(nodeId) AS node
RETURN
  node.name AS articulationPointName,
  labels(node) AS nodeLabels,
  COUNT { (node)--() } AS degree
ORDER BY degree DESC;

CALL gds.articulationPoints.stream('articulationPointsGraph') YIELD nodeId
WITH gds.util.asNode(nodeId) AS node
WITH labels(node) AS nodeType, node
RETURN nodeType, count(*) AS articulationPointCount
ORDER BY articulationPointCount DESC;
