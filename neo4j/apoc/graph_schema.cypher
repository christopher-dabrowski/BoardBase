CALL apoc.meta.graph() YIELD nodes, relationships
RETURN nodes, relationships;

CALL
  apoc.meta.stats(
  )
  YIELD labelCount, relTypeCount, propertyKeyCount, nodeCount, relCount
RETURN labelCount, relTypeCount, propertyKeyCount, nodeCount, relCount;
