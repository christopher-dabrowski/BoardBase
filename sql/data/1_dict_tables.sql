-- =====================================================
-- Dictionary Tables (No Dependencies)
-- File: 01_dictionary_tables.sql
-- =====================================================

-- Clear existing data (if any)
TRUNCATE TABLE category CASCADE;
ALTER SEQUENCE category_category_id_seq RESTART WITH 1;
TRUNCATE TABLE mechanic CASCADE;
ALTER SEQUENCE mechanic_mechanic_id_seq RESTART WITH 1;
TRUNCATE TABLE publisher CASCADE;
ALTER SEQUENCE publisher_publisher_id_seq RESTART WITH 1;
TRUNCATE TABLE award CASCADE;
ALTER SEQUENCE award_award_id_seq RESTART WITH 1;

-- =====================================================
-- CATEGORY
-- =====================================================
INSERT INTO category (name, description) VALUES
('Strategy', 'Games that emphasize strategic thinking, planning, and decision-making to achieve victory.'),
('Party', 'Social games designed for larger groups, focusing on fun and interaction rather than complex strategy.'),
('Cooperative', 'Games where players work together towards a common goal rather than competing against each other.'),
('Family', 'Accessible games suitable for players of various ages, with straightforward rules and moderate complexity.'),
('Economic', 'Games centered around resource management, trade, and economic simulation.'),
('Adventure', 'Games featuring exploration, narrative elements, and thematic journeys.'),
('Abstract', 'Games with minimal theme, focusing on pure mechanical gameplay and strategic depth.'),
('Deduction', 'Games involving logic, investigation, and uncovering hidden information through reasoning.');

-- =====================================================
-- MECHANIC
-- =====================================================
INSERT INTO mechanic (name, description) VALUES
('Deck Building', 'Players construct and optimize their personal deck of cards throughout the game.'),
('Worker Placement', 'Players place limited worker pieces on board spaces to take actions.'),
('Area Control', 'Players compete to dominate regions of the game board for points or resources.'),
('Tile Placement', 'Players place tiles to build the game board and score points based on placement.'),
('Dice Rolling', 'Players roll dice to determine outcomes, introducing chance into the game.'),
('Set Collection', 'Players gather specific combinations of items or cards to score points.'),
('Resource Management', 'Players collect, trade, and spend various resources to achieve objectives.'),
('Hand Management', 'Players optimize the cards in their hand to maximize their strategic options.'),
('Drafting', 'Players select cards or components from a common pool, often passing selections around.'),
('Engine Building', 'Players create systems that generate increasing benefits as the game progresses.');

-- =====================================================
-- PUBLISHER
-- =====================================================
INSERT INTO publisher (name, website_url, description) VALUES
('Stonemaier Games', 'https://stonemaiergames.com', 'Known for beautifully produced games like Wingspan and Scythe, focusing on elegant mechanics and stunning artwork.'),
('Days of Wonder', 'https://www.daysofwonder.com', 'Publisher of family-friendly classics including Ticket to Ride and Small World.'),
('Czech Games Edition', 'https://czechgames.com', 'European publisher known for innovative designs like Codenames and Through the Ages.'),
('Fantasy Flight Games', 'https://www.fantasyflightgames.com', 'Major publisher specializing in thematic games, producing titles across many popular franchises.'),
('KOSMOS', 'https://www.kosmos.de', 'German publisher with a long history, known for Catan and EXIT series games.'),
('Z-Man Games', 'https://www.zmangames.com', 'Publisher of critically acclaimed games including Pandemic and Carcassonne.');

-- =====================================================
-- AWARD
-- =====================================================
INSERT INTO award (name, awarding_body, description, awarded_date, category) VALUES
('Spiel des Jahres 2019', 'Spiel des Jahres Jury', 'The most prestigious German board game award, recognizing excellence in family-friendly game design.', '2019-07-22', 'Game of the Year'),
('Kennerspiel des Jahres 2020', 'Spiel des Jahres Jury', 'Award for more complex games aimed at experienced players.', '2020-07-20', 'Connoisseur Game of the Year'),
('Golden Geek Best Board Game 2021', 'BoardGameGeek Community', 'Community-voted award recognizing the best overall board game of the year.', '2022-01-15', 'Best Board Game'),
('As d''Or Expert 2018', 'Festival International des Jeux', 'French board game award for expert-level games.', '2018-02-25', 'Expert Game'),
('Mensa Select Winner 2017', 'American Mensa', 'Award given to games that are original, challenging, and well-designed.', '2017-04-28', 'Mensa Select'),
('UK Games Expo Best Family Game 2022', 'UK Games Expo', 'Recognizes the best family-friendly game released in the UK market.', '2022-06-03', 'Family Game');
