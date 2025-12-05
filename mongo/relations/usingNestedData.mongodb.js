use('mtg');

const set = "Edge of Eternities";

db.sets.aggregate([
  { $match: { name: set } },
  { $unwind: "$cards" },
  { $unwind: "$cards.keywords" },
  {
    $group: {
      _id: "$cards.keywords",
      count: { $sum: 1 }
    }
  },
  { $sort: { count: -1 } },
  // { $limit: 3 },
]);

