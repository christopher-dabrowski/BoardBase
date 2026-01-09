MATCH (person:Person)
CALL
  apoc.path.subgraphNodes(
    person,
    {relationshipFilter: "PARENT_OF>", minLevel: 1}
  )
  YIELD node AS descendant
WITH person, count(DISTINCT descendant) AS descendantCount
WHERE descendantCount > 0
RETURN
  person.name AS ancestor,
  person.id AS ancestorId,
  descendantCount AS totalDescendants
ORDER BY descendantCount DESC, ancestor
LIMIT 50;
