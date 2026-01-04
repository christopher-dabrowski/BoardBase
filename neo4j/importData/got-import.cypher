// Base file is from the GitHub repository: https://github.com/neo4j-examples/game-of-thrones/blob/master/got-import.cypher
// I've updated the base file and modified it to fit my project needs.
CREATE CONSTRAINT unique_person_id
FOR (p:Person)
REQUIRE p.id IS UNIQUE;

CREATE CONSTRAINT unique_house_id
FOR (h:House)
REQUIRE h.id IS UNIQUE;

CREATE INDEX person_name_index
FOR (p:Person)
ON (p.name);

CREATE INDEX house_name_index
FOR (h:House)
ON (h.name);

CREATE INDEX seat_name_index
FOR (s:Seat)
ON (s.name);

CREATE INDEX region_name_index
FOR (r:Region)
ON (r.name);

WITH 'file:///api-of-fire-and-ice/characters.json' AS url
// WITH 'file:///api-of-fire-and-ice/characters-small.json' AS url
CALL apoc.load.jsonArray(url) YIELD value
WITH apoc.convert.toMap(value) AS data
WITH apoc.map.clean(data, [], ['', [''], [], null]) AS data
WITH
  apoc.map.fromPairs(
    [
      k IN keys(data)
      | [toLower(substring(k, 0, 1)) + substring(k, 1, size(k)), data[k]]
    ]) AS data
MERGE (p:Person {id: data.id})
SET
  p +=
    apoc.map.clean(
      data,
      ['allegiances', 'father', 'spouse', 'mother'],
      ['', [''], [], null]
    ),
  p.name = coalesce(p.name, head(p.aliases))
FOREACH (id IN data.allegiances |
  MERGE (h:House {id: id})
  MERGE (p)-[:ALLIED_WITH]->(h)
)
FOREACH (id IN
CASE
  WHEN data.father IS NOT NULL THEN [data.father]
  ELSE []
END |
  MERGE (o:Person {id: id})
  MERGE (o)-[:PARENT_OF {type: 'father'}]->(p)
)
FOREACH (id IN
CASE
  WHEN data.mother IS NULL THEN []
  ELSE [data.mother]
END |
  MERGE (o:Person {id: id})
  MERGE (o)-[:PARENT_OF {type: 'mother'}]->(p)
)
FOREACH (id IN
CASE
  WHEN data.spouse IS NULL THEN []
  ELSE [data.spouse]
END |
  MERGE (o:Person {id: id})
  MERGE (o)-[:SPOUSE]-(p)
)
RETURN p.id, p.name;

WITH 'file:///api-of-fire-and-ice/houses.json' AS url
CALL apoc.load.jsonArray(url) YIELD value
WITH apoc.convert.toMap(value) AS data
WITH apoc.map.clean(data, [], ['', [''], [], null]) AS data
WITH
  apoc.map.fromPairs(
    [
      k IN keys(data)
      | [toLower(substring(k, 0, 1)) + substring(k, 1, size(k)), data[k]]
    ]) AS data
MERGE (h:House {id: data.id})
SET
  h +=
    apoc.map.clean(
      data,
      [
        'overlord',
        'swornMembers',
        'currentLord',
        'heir',
        'founder',
        'cadetBranches'
      ],
      ['', [''], [], null]
    )
FOREACH (id IN data.swornMembers |
  MERGE (o:Person {id: id})
  MERGE (o)-[:ALLIED_WITH]->(h)
)
FOREACH (s IN data.seats |
  MERGE (seat:Seat {name: s})
  MERGE (seat)-[:SEAT_OF]->(h)
)
FOREACH (id IN data.cadetBranches |
  MERGE (b:House {id: id})
  MERGE (b)-[:BRANCH_OF]->(h)
)
FOREACH (id IN
CASE
  WHEN data.overlord IS NOT NULL THEN [data.overlord]
  ELSE []
END |
  MERGE (o:House {id: id})
  MERGE (h)-[:SWORN_TO]->(o)
)
FOREACH (id IN
CASE
  WHEN data.currentLord IS NOT NULL THEN [data.currentLord]
  ELSE []
END |
  MERGE (o:Person {id: id})
  MERGE (h)-[:LED_BY]->(o)
)
FOREACH (id IN
CASE
  WHEN data.founder IS NOT NULL THEN [data.founder]
  ELSE []
END |
  MERGE (o:Person {id: id})
  MERGE (h)-[:FOUNDED_BY]->(o)
)
FOREACH (id IN
CASE
  WHEN data.heir IS NOT NULL THEN [data.heir]
  ELSE []
END |
  MERGE (o:Person {id: id})
  MERGE (o)-[:HEIR_TO]->(h)
)
FOREACH (r IN
CASE
  WHEN data.region IS NOT NULL THEN [data.region]
  ELSE []
END |
  MERGE (o:Region {name: r})
  MERGE (h)-[:IN_REGION]->(o)
)
RETURN h.id, h.name;
