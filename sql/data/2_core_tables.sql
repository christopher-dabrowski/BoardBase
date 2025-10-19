-- =====================================================
-- Core Independent Tables
-- File: 02_core_tables.sql
-- =====================================================

-- Clear existing data (if any)
TRUNCATE TABLE app_user CASCADE;
ALTER SEQUENCE app_user_user_id_seq RESTART WITH 1;
TRUNCATE TABLE board_game CASCADE;
ALTER SEQUENCE board_game_board_game_id_seq RESTART WITH 1;

-- =====================================================
-- APP_USER
-- =====================================================
-- Note: password_hash uses dummy sha256 hashes of user name
-- In production, these would be actual hashed passwords
INSERT INTO app_user (username, email, password_hash, is_admin) VALUES
('board_master_42', 'john.smith@email.com', decode('c7efcc761308f04f872b7400986e9eb7c71180859819dd2e983b6e3c0ce9c2b6', 'hex'), TRUE),
('strategy_queen', 'sarah.jones@gamemail.com', decode('c6394d283ba67f5811f971ef3799122047fc71deb0931ecfb5b34ee57b024dd8', 'hex'), TRUE),
('dice_roller_89', 'mike.wilson@boardgames.net', decode('7338283d63f1f26463a72df1808b3da02d98736b81b17ba453021ddd5ae34e5f', 'hex'), FALSE),
('casual_gamer', 'emily.brown@email.com', decode('ff08a36644ef963ed029b60283a76cd67149ec703d988fc41da050cbd6311dd0', 'hex'), FALSE),
('meeple_collector', 'david.garcia@games.org', decode('cb881fa4ffa613f615f6467b20eb03ccedf770a94618bc3a5191f48afd1a38e6', 'hex'), FALSE),
('euro_enthusiast', 'anna.kowalski@email.pl', decode('ad800670530eb48dc1591707d925082383319c167539d24d8b938794f6da168f', 'hex'), FALSE),
('game_night_host', 'chris.martinez@email.com', decode('8f92cafcc0de9f0a7a7227e1884f1224432d7884bb4a53130221e320c550fc6c', 'hex'), FALSE),
('tabletop_wizard', 'lisa.anderson@gameworld.com', decode('196e089b13b8e872d298458dd2828df2387a7127de23c115b9e5351d2f8f7ffd', 'hex'), FALSE),
('card_shark_99', 'tom.taylor@email.com', decode('14cd0379ac22847b7ccf5368d758e7868ca6cf37244454af378c08424ac15e57', 'hex'), FALSE),
('family_fun_time', 'jennifer.lee@familygames.com', decode('1f5b68659096997094cfb44ede797a439ecb5f4386aef4b4e09c0d1706d2b266', 'hex'), FALSE),
('dungeon_delver', 'mark.thompson@adventures.net', decode('2e3d580414198fd4101b51598167ef06f9c78ebcd8fb4ddfbb91f06fe68aeb16', 'hex'), FALSE),
('puzzle_master', 'rachel.white@email.com', decode('f356c1f3e54e6acaecf63e669da03361c1fd6052c6f1f07b182881d65fc961a2', 'hex'), FALSE),
('board_game_enthusiast', 'james.bond@email.com', decode('6f98f67314753708f898012930c8032c9fcf1d12b7d5844978653edaf7c45707', 'hex'), FALSE);

-- =====================================================
-- BOARD_GAME
-- =====================================================
INSERT INTO board_game (name, description, designer, declared_minimal_player_count, declared_maximum_player_count, declared_minimal_age) VALUES
('Wingspan', 'A competitive, medium-weight, card-driven engine-building board game where players are bird enthusiasts collecting birds to create the best wildlife preserve.', 'Elizabeth Hargrave', 1, 5, 10),
('Ticket to Ride', 'A cross-country train adventure where players collect cards of various types of train cars to claim railway routes connecting cities throughout North America.', 'Alan R. Moon', 2, 5, 8),
('Catan', 'Players try to be the dominant force on the island of Catan by building settlements, cities, and roads. On each turn dice are rolled to determine what resources the island produces.', 'Klaus Teuber', 3, 4, 10),
('Pandemic', 'As members of an elite disease control team, players must work together to treat disease hotspots while researching cures for each of four plagues before they overwhelm the world.', 'Matt Leacock', 2, 4, 8),
('Azul', 'Players take turns drafting colored tiles from suppliers to their player board. Later in the round, players score points based on how they have placed their tiles.', 'Michael Kiesling', 2, 4, 8),
('7 Wonders', 'Players lead one of the seven great cities of the ancient world, gathering resources, developing commercial routes, and affirming their military supremacy over three ages.', 'Antoine Bauza', 2, 7, 10),
('Carcassonne', 'Players draw and place tiles to build cities, roads, farms, and cloisters. They score points by placing meeples on these features strategically.', 'Klaus-Jürgen Wrede', 2, 5, 7),
('Splendor', 'As a Renaissance merchant, players acquire gem mines, transportation, and shops to build prestige and attract nobles to their gem empire.', 'Marc André', 2, 4, 10),
('Codenames', 'Two teams compete to contact all of their agents first. Spymasters give one-word clues that can point to multiple words on the board.', 'Vlaada Chvátil', 2, 8, 14),
('Dominion', 'Players are monarchs attempting to expand their kingdoms by acquiring resources and territory. The game popularized the deck-building mechanic.', 'Donald X. Vaccarino', 2, 4, 13),
('Agricola', 'Players are farmers cultivating their land, building pastures, and extending their homes. The goal is to create the most prosperous farm.', 'Uwe Rosenberg', 1, 4, 12),
('Brass: Birmingham', 'An economic strategy game set in Birmingham during the Industrial Revolution, where players build networks of canals and rails, establish industries, and trade goods.', 'Martin Wallace', 2, 4, 14),
('Scythe', 'Set in an alternate-history 1920s, players control factions vying for power in Eastern Europa through exploration, resource gathering, and conquest.', 'Jamey Stegmaier', 1, 5, 14),
('Terraforming Mars', 'Corporations work together to terraform Mars by raising temperature, creating ocean areas, and establishing green areas while competing for victory points.', 'Jacob Fryxelius', 1, 5, 12),
('Gloomhaven', 'A game of Euro-inspired tactical combat in a persistent world of shifting motives where players take on the role of wandering adventurers.', 'Isaac Childres', 1, 4, 14);
