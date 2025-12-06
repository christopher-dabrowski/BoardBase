use('mtg');

db.allPrices.createIndex({ cardUuid: 1 }, { unique: true });

db.cardTypes.createIndex({ name: 1 });

db.deckList.createIndex({ code: 1 });
db.deckList.createIndex({ releaseDate: -1 });
db.deckList.createIndex({ name: 1 });

db.decks.createIndex({ code: 1 }, { unique: true });
db.decks.createIndex({ name: 1 });
db.decks.createIndex({ releaseDate: -1 });
db.decks.createIndex({ "mainBoard.name": 1 });

db.keywords.createIndex({ type: 1, values: 1 }, { unique: true });

db.setList.createIndex({ code: 1 }, { unique: true });
db.decks.createIndex({ releaseDate: -1 });
db.decks.createIndex({ block: 1, releaseDate: -1 });
db.decks.createIndex({ name: 1 });

db.sets.createIndex({ code: 1 }, { unique: true });
db.sets.createIndex({ releaseDate: -1 });
db.sets.createIndex({ name: 1 });

db.standard.createIndex({ code: 1 });
db.standard.createIndex({ block: 1, "cards.colors": 1, "cards.manaValue": 1 });
db.standard.createIndex({ "cards.name": 1 });

db.standardAtomic.createIndex({ name: 1 });
db.standardAtomic.createIndex({ "sides.colors": 1 }, { "sides.manaValue": 1 });
db.standardAtomic.createIndex({ "sides.0.colors": 1 }, { "sides.0.manaValue": 1 });
db.standardAtomic.createIndex({ "sides.type": 1 });
db.standardAtomic.createIndex({ "sides.legalities.$**": 1 });
