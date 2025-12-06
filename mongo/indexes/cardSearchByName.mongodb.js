use('mtg');

db.standardAtomic.hideIndex("name_1");
// db.standardAtomic.unhideIndex("name_1");
db.standardAtomic
  .explain("executionStats")
  .find({ name: { $regex: /^Kaito/ } });

