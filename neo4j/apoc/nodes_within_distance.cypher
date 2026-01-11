MATCH (p:Person {name: 'Jon Snow'})
CALL apoc.path.subgraphNodes(p, {maxLevel: 3}) YIELD node
RETURN DISTINCT node.name
LIMIT 20;
