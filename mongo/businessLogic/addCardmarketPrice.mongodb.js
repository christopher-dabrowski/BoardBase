/**
 * @function addCardmarketPrice
 * @param {string} cardName
 * @param {number} normalPrice
 * @param {number} [foilPrice]
 * @param {string} [currency='EUR']
 */
const addCardmarketPrice = (cardName, normalPrice, foilPrice = null, currency = 'EUR') => {

  const card = db.standard.findOne(
    { 'cards.name': cardName },
    { 'cards.$': 1 }
  );

  if (!card?.cards?.length)
    throw new Error(`Card "${cardName}" not found in standard collection`);

  const cardUuid = card.cards[0].uuid;
  if (!cardUuid)
    throw new Error(`Card "${cardName}" does not have a valid UUID`);

  const currentDate = new Date().toISOString().split('T')[0];

  const updateFields = {
    [`prices.paper.cardmarket.retail.normal.${currentDate}`]: normalPrice,
    'prices.paper.cardmarket.currency': currency
  };

  if (foilPrice !== null) {
    updateFields[`prices.paper.cardmarket.retail.foil.${currentDate}`] = foilPrice;
  }

  const result = db.allPrices.updateOne(
    { cardUuid: cardUuid },
    {
      $set: updateFields,
      $setOnInsert: { cardUuid: cardUuid }
    },
    { upsert: true }
  );

  if (result.upsertedCount > 0) {
    console.log(`Successfully added new price document for "${cardName}" (${cardUuid}) with Cardmarket price on ${currentDate}`);
  } else if (result.modifiedCount > 0) {
    console.log(`Successfully updated Cardmarket price for "${cardName}" (${cardUuid}) on ${currentDate}`);
  } else {
    console.warn(`Price for "${cardName}" on ${currentDate} was already set to the same value`);
  }
};

use('mtg');
addCardmarketPrice('Collector\'s Cage', 3.66, 5.22);

