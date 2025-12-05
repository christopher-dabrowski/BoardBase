use('mtg');

db.standard.updateMany(
  {},
  [
    {
      $set: { releaseDate: { $dateFromString: { dateString: "$releaseDate" } } }
    }
  ]
)
