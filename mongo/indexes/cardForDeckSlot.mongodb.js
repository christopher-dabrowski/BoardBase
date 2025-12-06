use('mtg');

// db.standardAtomic.hideIndex("sides.0.colors_1");
db.standardAtomic.unhideIndex("sides.0.colors_1");
db.standardAtomic
  .explain("executionStats")
  .find({
    "sides.0.colors": ["U"],
    "sides.0.manaValue": { $lte: 2 }
  });

