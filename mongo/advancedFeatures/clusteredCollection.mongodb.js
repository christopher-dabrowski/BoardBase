use("mtg");

db.allPrices.drop();

db.createCollection(
  "allPrices",
  { clusteredIndex: { "key": { _id: 1 }, "unique": true, "name": "cardUuid clustered key" } }
)
