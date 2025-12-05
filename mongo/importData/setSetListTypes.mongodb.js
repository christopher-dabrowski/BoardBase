use('mtg');

db.setList.updateMany(
  {},
  [
    {
      $set: { releaseDate: { $dateFromString: { dateString: "$releaseDate" } } }
    }
  ]
)
