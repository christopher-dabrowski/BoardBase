use('mtg');

db.decks.updateMany(
  {},
  [
    {
      $set: { releaseDate: { $dateFromString: { dateString: "$releaseDate" } } }
    }
  ]
)
