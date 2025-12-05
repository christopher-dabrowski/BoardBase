const deckName = "World Shaper";

use("mtg");

db.decks.aggregate([
  {
    $match: {
      name: deckName
    }
  },
  {
    $unwind: "$mainBoard"
  },
  {
    $group: {
      _id: "$mainBoard.manaValue",
      cardCount: { $sum: "$mainBoard.count" }
    }
  },
  {
    $sort: { _id: 1 }
  },
  {
    $project: {
      _id: 0,
      manaValue: "$_id",
      cardCount: 1
    }
  }
]);
