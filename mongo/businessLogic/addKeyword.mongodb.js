const keywordTypes = {
  abilityWords: 'abilityWords',
  keywordActions: 'keywordActions',
  keywordAbilities: 'keywordAbilities',
}

/**
 * @function addKeyword
 * @param {string} keyword
 * @param {keyof typeof keywordTypes} type
 * @returns {void}
 */
const addKeyword = (keyword, type) => {
  if (!keywordTypes[type]) {
    throw new Error(`Invalid keyword type: ${type}`);
  }

  const result = db.keywords.updateOne(
    { type: type },
    {
      $addToSet: {
        values: keyword
      }
    },
    { upsert: true }
  );

  if (result.modifiedCount > 0) {
    console.log(`Successfully added keyword "${keyword}" to ${type}`);
  } else if (result.upsertedCount > 0) {
    console.log(`Created new ${type} document with keyword "${keyword}"`);
  } else {
    console.warn(`Keyword "${keyword}" already exists in ${type}`);
  }
}

use('mtg');

addKeyword('Flying', 'keywordAbilities');
