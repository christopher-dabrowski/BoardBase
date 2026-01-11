CALL gds.graph.project('disconnectedComponentsGraph', '*', '*');

CALL gds.wcc.stream('disconnectedComponentsGraph') YIELD nodeId, componentId
WITH gds.util.asNode(nodeId) AS node, componentId
RETURN
  componentId,
  count(node) AS nodesInComponent,
  collect(DISTINCT labels(node)) AS nodeTypes,
  collect(node.name)[0..5] AS sampleNodes
ORDER BY nodesInComponent DESC;

CALL gds.wcc.stream('disconnectedComponentsGraph') YIELD nodeId, componentId
WITH componentId, gds.util.asNode(nodeId) AS node
WITH
  componentId,
  collect(DISTINCT labels(node)) AS nodeTypes,
  count(node) AS componentSize
RETURN
  nodeTypes,
  count(componentId) AS componentCount,
  avg(componentSize) AS avgSize,
  stDev(componentSize) AS stdDev,
  min(componentSize) AS minSize,
  max(componentSize) AS maxSize
ORDER BY componentCount DESC;
