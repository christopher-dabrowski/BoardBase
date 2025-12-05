use('mtg');

db.sets.updateMany(
  {},
  [
    {
      $set: { releaseDate: { $dateFromString: { dateString: "$releaseDate" } } }
    }
  ]
)
