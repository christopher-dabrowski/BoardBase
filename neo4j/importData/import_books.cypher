WITH 'file:///api-of-fire-and-ice/books.json' AS url
CALL apoc.load.jsonArray(url) YIELD value
WITH apoc.convert.toMap(value) AS data
WITH apoc.map.clean(data, [], ['', [''], [], null]) AS data
WITH
  apoc.map.fromPairs(
    [
      k IN keys(data)
      | [toLower(substring(k, 0, 1)) + substring(k, 1, size(k)), data[k]]
    ]) AS data
MERGE (b:Book {id: data.id})
SET
  b.name = data.name,
  b.isbn = data.isbn,
  b.numberOfPages = data.numberOfPages,
  b.publisher = data.publisher,
  b.mediaType = data.mediaType,
  b.country = data.country,
  b.releaseDate =
    CASE
      WHEN data.releaseDate IS NULL THEN null
      ELSE datetime(replace(data.releaseDate, ' ', 'T'))
    END
CALL (b, data) {
  WITH b, data
  UNWIND coalesce(data.authors, []) AS authorName
  MERGE (a:Author {name: authorName})
  MERGE (a)-[:WROTE]->(b)
  RETURN count(*) AS wroteCount
}
WITH b, data
CALL {
  WITH b, data
  WITH b, data.precededById AS prevId
  WHERE prevId IS NOT NULL
  MERGE (prev:Book {id: prevId})
  MERGE (b)-[:FOLLOWS]->(prev)
  RETURN count(*) AS followsCount
}
WITH b, data
CALL (b, data) {
  WITH b, data
  WITH b, data.followedBy AS nextId
  WHERE nextId IS NOT NULL
  MERGE (next:Book {id: nextId})
  MERGE (b)-[:PRECEDES]->(next)
  RETURN count(*) AS precedesCount
}
RETURN b.id, b.name;