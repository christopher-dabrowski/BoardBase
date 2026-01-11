MATCH (source)-[r]->(target)
RETURN
  gds.graph.project(
    'bridgeDetection',
    source,
    target,
    {},
    {undirectedRelationshipTypes: ['*']}
  );

CALL gds.bridges.stream('bridgeDetection') YIELD from, to, remainingSizes
// WHERE ALL(size IN remainingSizes WHERE size > 5)
UNWIND remainingSizes AS remainingSize
WITH from, to, remainingSizes, min(remainingSize) AS minSize
ORDER BY minSize DESC
RETURN
  gds.util.asNode(from).name AS fromName,
  gds.util.asNode(to).name AS toName,
  remainingSizes,
  minSize
