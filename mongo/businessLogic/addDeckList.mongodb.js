const deckTypes = {
  WordlChampionshipDeck: 'World Championship Deck',
  MTGOThemeDeck: 'MTGO Theme Deck',
  BoxSet: 'Box Set',
  ProTourDeck: 'Pro Tour Deck',
  SampleDeck: 'Sample Deck',
  ChallengerDeck: 'Challenger Deck',
  SpellslingerStarterKit: 'Spellslinger Starter Kit',
  Jumpstart: 'Jumpstart',
  HistoricBrawlPreconDeck: 'Historic Brawl Precon Deck',
  PremiumDeck: 'Premium Deck',
  ClashPack: 'Clash Pack',
  MTGODuelDeck: 'MTGO Duel Deck',
  CommanderDeck: 'Commander Deck',
  ModernEventDeck: 'Modern Event Deck',
  IntroPack: 'Intro Pack',
  MTGOCommanderDeck: 'MTGO Commander Deck',
  DemoDeck: 'Demo Deck',
  PlanechaseDeck: 'Planechase Deck',
  Halfdeck: 'Halfdeck',
  WelcomeDeck: 'Welcome Deck'
}

/**
 * @function toCamelCase
 * @param {string} str
 * @returns {string}
 */
const toCamelCase = (str) => str
  .toLowerCase()
  .replace(/[^a-zA-Z0-9]+(.)/g, (_, chr) => chr.toUpperCase())
  .replace(/^[A-Z]/, (chr) => chr.toLowerCase());

/**
 * @function addDeckList
 * @param {string} code
 * @param {string} name
 * @param {Date} releaseDate
 * @param {string} deckType
 * @returns {void}
 */
const addDeckList = (code, name, releaseDate, deckType) => {
  const allowedTypes = Object.values(deckTypes);
  if (!allowedTypes.includes(deckType)) {
    throw new Error(`Invalid deck type: ${deckType}`);
  }

  const fileName = `${toCamelCase(name)}_${code}`;

  const result = db.deckList.insertOne({
    code: code,
    fileName: fileName,
    name: name,
    releaseDate: releaseDate,
    type: deckType
  });

  if (result.acknowledged) {
    console.log(`Successfully added deck "${name}" (${code}) with type "${deckType}"`);
    console.log(`Generated fileName: ${fileName}`);
    console.log(`Inserted document ID: ${result.insertedId}`);
  } else {
    console.error(`Failed to insert deck "${name}"`);
  }
}

use('mtg');
addDeckList('WPE', 'Politechniczne starcie', new Date('2025-12-05'), deckTypes.CommanderDeck);
