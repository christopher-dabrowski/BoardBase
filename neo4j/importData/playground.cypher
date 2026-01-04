// File to test Cypher queries for data import
//
// Accessing hosted file
WITH
  'https://raw.githubusercontent.com/apache/spark/refs/heads/master/examples/src/main/resources/people.json' AS url
CALL apoc.load.json(url) YIELD value AS person
RETURN person;

WITH 'file:///api-of-fire-and-ice/books.json' AS url
CALL apoc.load.jsonArray(url) YIELD value AS book
RETURN book;

WITH 'file:///api-of-fire-and-ice/houses.json' AS url
CALL apoc.load.jsonArray(url) YIELD value AS house
RETURN house;

WITH 'file:///api-of-fire-and-ice/characters.json' AS url
CALL apoc.load.jsonArray(url) YIELD value AS character
RETURN character;
