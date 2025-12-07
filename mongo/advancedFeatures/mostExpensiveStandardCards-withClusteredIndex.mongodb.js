use('mtg');

db.standard
  .explain("executionStats")
  .aggregate([
    { $unwind: '$cards' },
    { $limit: 100 },
    {
      $project: {
        _id: 0,
        cardUuid: '$cards.uuid',
        cardName: '$cards.name',
        rarity: '$cards.rarity',
        type: '$cards.type',
        setCode: '$setCode'
      }
    },
    {
      $lookup: {
        from: 'allPrices',
        localField: 'cardUuid',
        foreignField: '_id',
        as: 'priceData'
      }
    },
    { $unwind: { path: '$priceData', preserveNullAndEmptyArrays: true } },

    {
      $addFields: {
        cardMarketPrice: {
          $arrayElemAt: [
            { $map: { input: { $objectToArray: '$priceData.prices.paper.cardmarket.retail.normal' }, in: '$$this.v' } },
            0
          ]
        },
        cardMarketCurrency: "$priceData.prices.paper.cardmarket.currency"
      }
    },

    { $sort: { cardMarketPrice: -1 } },
    { $limit: 10 },
    {
      $project: {
        cardUuid: 1,
        cardName: 1,
        setCode: 1,
        rarity: 1,
        type: 1,
        cardMarketPrice: { $concat: [{ $toString: "$cardMarketPrice" }, " ", "$cardMarketCurrency"] },
      }
    }
  ]);

