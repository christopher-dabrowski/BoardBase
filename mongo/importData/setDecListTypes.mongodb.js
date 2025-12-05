use('mtg');

db.deckList.updateMany(
  {},
  [
    {
      $set: { releaseDate: { $dateFromString: { dateString: "$releaseDate" } } }
    }
  ]
)
