CREATE FULLTEXT INDEX personNameFullText IF NOT EXISTS
FOR (p:Person)
ON EACH [p.name]
OPTIONS {indexConfig: {`fulltext.eventually_consistent`: true}};

SHOW FULLTEXT INDEXES;

CALL
  db.index.fulltext.queryNodes(
    "personNameFullText",
    "Arja Stark"
  )
  YIELD node, score
RETURN node.name, score
