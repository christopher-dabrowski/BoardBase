-- =====================================================
-- Association Tables (Many-to-Many Relationships)
-- File: 05_association_tables.sql
-- =====================================================

-- Clear existing data (if any)
TRUNCATE TABLE board_game_category CASCADE;
TRUNCATE TABLE board_game_mechanic CASCADE;
TRUNCATE TABLE user_game_release CASCADE;
TRUNCATE TABLE play_participant CASCADE;
TRUNCATE TABLE award_board_game CASCADE;

-- =====================================================
-- BOARD_GAME_CATEGORY
-- =====================================================
INSERT INTO board_game_category (board_game_id, category_id) VALUES
-- Wingspan: Strategy, Family
(1, 1),
(1, 4),

-- Ticket to Ride: Strategy, Family
(2, 1),
(2, 4),

-- Catan: Strategy, Family, Economic
(3, 1),
(3, 4),
(3, 5),

-- Pandemic: Strategy, Cooperative, Family
(4, 1),
(4, 3),
(4, 4),

-- Azul: Strategy, Abstract, Family
(5, 1),
(5, 7),
(5, 4),

-- 7 Wonders: Strategy, Economic
(6, 1),
(6, 5),

-- Carcassonne: Strategy, Family
(7, 1),
(7, 4),

-- Splendor: Strategy, Economic, Family
(8, 1),
(8, 5),
(8, 4),

-- Codenames: Party, Deduction
(9, 2),
(9, 8),

-- Dominion: Strategy, Economic
(10, 1),
(10, 5),

-- Agricola: Strategy, Economic
(11, 1),
(11, 5),

-- Brass: Birmingham: Strategy, Economic
(12, 1),
(12, 5),

-- Scythe: Strategy, Economic, Adventure
(13, 1),
(13, 5),
(13, 6),

-- Terraforming Mars: Strategy, Economic
(14, 1),
(14, 5),

-- Gloomhaven: Strategy, Cooperative, Adventure
(15, 1),
(15, 3),
(15, 6);

-- =====================================================
-- BOARD_GAME_MECHANIC
-- =====================================================
INSERT INTO board_game_mechanic (board_game_id, mechanic_id) VALUES
-- Wingspan: Hand Management, Set Collection, Engine Building
(1, 8),
(1, 6),
(1, 10),

-- Ticket to Ride: Set Collection, Hand Management
(2, 6),
(2, 8),

-- Catan: Dice Rolling, Resource Management, Trading
(3, 5),
(3, 7),

-- Pandemic: Hand Management, Set Collection, Cooperative Action Selection
(4, 8),
(4, 6),

-- Azul: Tile Placement, Drafting, Set Collection
(5, 4),
(5, 9),
(5, 6),

-- 7 Wonders: Drafting, Hand Management, Set Collection, Engine Building
(6, 9),
(6, 8),
(6, 6),
(6, 10),

-- Carcassonne: Tile Placement, Area Control
(7, 4),
(7, 3),

-- Splendor: Set Collection, Hand Management, Engine Building
(8, 6),
(8, 8),
(8, 10),

-- Codenames: Deduction, Team-Based
(9, 8),

-- Dominion: Deck Building, Hand Management
(10, 1),
(10, 8),

-- Agricola: Worker Placement, Resource Management, Drafting
(11, 2),
(11, 7),
(11, 9),

-- Brass: Birmingham: Resource Management, Area Control, Hand Management
(12, 7),
(12, 3),
(12, 8),

-- Scythe: Area Control, Engine Building, Resource Management
(13, 3),
(13, 10),
(13, 7),

-- Terraforming Mars: Hand Management, Drafting, Engine Building, Resource Management
(14, 8),
(14, 9),
(14, 10),
(14, 7),

-- Gloomhaven: Hand Management, Deck Building, Scenario-Based
(15, 8),
(15, 1);

-- =====================================================
-- USER_GAME_RELEASE
-- =====================================================
INSERT INTO user_game_release (user_id, game_release_id, acquired_at) VALUES
-- User 1 (board_master_42) - large collection
(1, 1, '2019-02-15 14:00:00'),  -- Wingspan English
(1, 4, '2010-05-20 16:30:00'),  -- Ticket to Ride English
(1, 9, '2005-08-10 12:00:00'),  -- Catan English
(1, 14, '2018-01-15 15:45:00'), -- Azul English
(1, 20, '2008-06-20 17:00:00'), -- Carcassonne English
(1, 28, '2009-03-10 14:30:00'), -- Dominion English
(1, 32, '2018-08-15 16:00:00'), -- Brass: Birmingham
(1, 33, '2017-01-20 18:15:00'), -- Scythe English
(1, 35, '2017-02-25 19:30:00'), -- Terraforming Mars English

-- User 2 (strategy_queen) - experienced player
(2, 1, '2019-04-01 15:00:00'),  -- Wingspan English
(2, 11, '2010-01-10 13:45:00'), -- Pandemic English
(2, 16, '2011-01-15 16:00:00'), -- 7 Wonders English
(2, 22, '2015-01-05 17:30:00'), -- Splendor English
(2, 30, '2008-01-20 14:15:00'), -- Agricola German
(2, 37, '2017-08-10 19:00:00'), -- Gloomhaven English

-- User 3 (dice_roller_89)
(3, 8, '2012-06-15 15:30:00'),  -- Catan German
(3, 25, '2016-01-20 16:45:00'), -- Codenames English
(3, 28, '2011-09-10 18:00:00'), -- Dominion English
(3, 35, '2018-05-15 20:15:00'), -- Terraforming Mars English

-- User 4 (casual_gamer)
(4, 4, '2015-07-10 14:00:00'),  -- Ticket to Ride English
(4, 9, '2016-08-20 15:30:00'),  -- Catan English
(4, 11, '2014-05-15 17:00:00'), -- Pandemic English
(4, 19, '2010-03-25 16:00:00'), -- Carcassonne German

-- User 5 (meeple_collector) - big collector
(5, 1, '2019-05-10 13:00:00'),  -- Wingspan English
(5, 14, '2018-04-20 14:30:00'), -- Azul English
(5, 22, '2016-02-15 16:00:00'), -- Splendor English
(5, 30, '2010-05-20 17:45:00'), -- Agricola German
(5, 33, '2018-01-10 19:00:00'), -- Scythe English
(5, 37, '2018-09-05 20:30:00'), -- Gloomhaven English

-- User 6 (euro_enthusiast)
(6, 2, '2019-03-10 15:15:00'),  -- Wingspan German
(6, 12, '2013-04-20 16:30:00'), -- Pandemic Polish
(6, 17, '2011-03-15 18:00:00'), -- 7 Wonders German
(6, 32, '2019-01-05 19:45:00'), -- Brass: Birmingham
(6, 35, '2019-01-25 21:00:00'), -- Terraforming Mars English

-- User 7 (game_night_host)
(7, 4, '2018-02-15 14:45:00'),  -- Ticket to Ride English
(7, 9, '2016-04-20 16:00:00'),  -- Catan English
(7, 19, '2015-06-10 17:30:00'), -- Carcassonne German
(7, 25, '2017-11-15 19:00:00'), -- Codenames English

-- User 8 (tabletop_wizard)
(8, 1, '2020-01-10 15:30:00'),  -- Wingspan English
(8, 14, '2019-01-15 17:00:00'), -- Azul English
(8, 22, '2017-06-20 18:30:00'), -- Splendor English

-- User 9 (card_shark_99)
(9, 25, '2016-02-05 14:00:00'), -- Codenames English
(9, 28, '2015-03-20 15:45:00'), -- Dominion English
(9, 33, '2019-11-01 17:15:00'), -- Scythe English

-- User 10 (family_fun_time)
(10, 4, '2019-10-20 13:30:00'), -- Ticket to Ride English
(10, 14, '2020-06-15 15:00:00'), -- Azul English
(10, 19, '2019-11-25 16:45:00'), -- Carcassonne German
(10, 25, '2018-07-10 18:15:00'), -- Codenames English

-- User 11 (dungeon_delver)
(11, 11, '2020-03-15 14:30:00'), -- Pandemic English
(11, 33, '2019-10-20 16:00:00'), -- Scythe English
(11, 37, '2019-12-10 17:45:00'), -- Gloomhaven English

-- User 12 (puzzle_master)
(12, 14, '2019-09-05 15:15:00'), -- Azul English
(12, 19, '2019-07-20 16:45:00'), -- Carcassonne German
(12, 22, '2019-08-30 18:00:00'); -- Splendor English

-- =====================================================
-- PLAY_PARTICIPANT
-- =====================================================
INSERT INTO play_participant (play_id, user_id) VALUES
-- Play 1: Wingspan at User 1's home
(1, 1),
(1, 5),
(1, 6),
(1, 8),

-- Play 2: Ticket to Ride family night
(2, 10),
(2, 4),
(2, 7),

-- Play 3: Codenames party night
(3, 7),
(3, 3),
(3, 9),
(3, 10),
(3, 4),
(3, 12),

-- Play 4: Pandemic co-op
(4, 2),
(4, 4),
(4, 6),
(4, 11),

-- Play 5: Azul evening
(5, 1),
(5, 8),
(5, 12),

-- Play 6: Catan classic
(6, 3),
(6, 7),
(6, 9),
(6, 5),

-- Play 7: 7 Wonders tournament
(7, 2),
(7, 6),
(7, 9),
(7, 3),
(7, 11),
(7, 1),

-- Play 8: Splendor lunch
(8, 2),
(8, 5),
(8, 8),
(8, 12),

-- Play 9: Carcassonne cafe
(9, 4),
(9, 7),
(9, 10),
(9, 12),

-- Play 10: Wingspan full group
(10, 1),
(10, 6),
(10, 8),
(10, 5),
(10, 2),

-- Play 11: Dominion
(11, 1),
(11, 9),
(11, 3),

-- Play 12: Ticket to Ride intro
(12, 7),
(12, 10),
(12, 4),
(12, 12),

-- Play 13: Scythe epic
(13, 2),
(13, 5),
(13, 9),
(13, 11),

-- Play 14: Pandemic victory
(14, 2),
(14, 4),
(14, 11),

-- Play 15: Agricola strategic
(15, 6),
(15, 5),
(15, 2),
(15, 11),

-- Play 16: Terraforming Mars marathon
(16, 3),
(16, 1),
(16, 6),

-- Play 17: Azul quick
(17, 5),
(17, 6),

-- Play 18: Codenames game night
(18, 7),
(18, 9),
(18, 10),
(18, 3),
(18, 4),
(18, 12),

-- Play 19: Brass Birmingham close
(19, 1),
(19, 2),
(19, 6),

-- Play 20: Carcassonne expansions
(20, 7),
(20, 4),
(20, 10),
(20, 1),
(20, 12),

-- Play 21: 7 Wonders full count
(21, 2),
(21, 9),
(21, 3),
(21, 6),
(21, 11),
(21, 7),
(21, 1),

-- Play 22: Wingspan birds
(22, 1),
(22, 8),
(22, 5),
(22, 6),

-- Play 23: Gloomhaven campaign
(23, 2),
(23, 5),
(23, 11),

-- Play 24: Splendor cafe
(24, 12),
(24, 8),
(24, 10),

-- Play 25: Catan wheat
(25, 7),
(25, 9),
(25, 3),
(25, 5),

-- Play 26: Ticket to Ride family
(26, 10),
(26, 4),
(26, 7),
(26, 12),
(26, 8),

-- Play 27: Pandemic lost
(27, 1),
(27, 4),
(27, 2),
(27, 11),

-- Play 28: Dominion expansion
(28, 1),
(28, 3),
(28, 9),
(28, 7),

-- Play 29: Codenames teams
(29, 7),
(29, 3),
(29, 9),
(29, 10),
(29, 4),
(29, 12),
(29, 8),
(29, 11),

-- Play 30: Azul tiles
(30, 8),
(30, 6),
(30, 1),
(30, 5),

-- Play 31: Scythe Rusviet
(31, 5),
(31, 9),
(31, 11),
(31, 2),
(31, 13),

-- Play 32: Carcassonne city
(32, 1),
(32, 10),
(32, 7),

-- Play 33: Agricola starved
(33, 2),
(33, 6),
(33, 11),

-- Play 34: 7 Wonders science
(34, 2),
(34, 3),
(34, 6),
(34, 9),
(34, 7),

-- Play 35: Wingspan feeders
(35, 1),
(35, 6),
(35, 8),
(35, 5),
(35, 2),

-- Play 36: Terraforming Mars ecologist
(36, 6),
(36, 3),
(36, 9),

-- Play 37: Splendor dinner
(37, 5),
(37, 8),

-- Play 38: Brass canal
(38, 2),
(38, 1),
(38, 6),
(38, 9),

-- Play 39: Gloomhaven scenario
(39, 2),
(39, 5),
(39, 11),
(39, 7),

-- Play 40: Ticket to Ride Europe
(40, 10),
(40, 4),
(40, 7),
(40, 8),

-- Play 41: Pandemic medic
(41, 2),
(41, 4),
(41, 11),

-- Play 42: Catan longest road
(42, 3),
(42, 7),
(42, 9),
(42, 5),

-- Play 43: Codenames pictures
(43, 7),
(43, 9),
(43, 10),
(43, 4),
(43, 3),
(43, 12),

-- Play 44: Azul perfect wall
(44, 1),
(44, 5),
(44, 8);

-- =====================================================
-- AWARD_BOARD_GAME
-- =====================================================
INSERT INTO award_board_game (award_id, board_game_id, received_place) VALUES
-- Spiel des Jahres 2019
(1, 1, 1),  -- Wingspan winner

-- Kennerspiel des Jahres 2020
(2, 13, 2), -- Scythe runner-up

-- Golden Geek Best Board Game 2021
(3, 15, 1), -- Gloomhaven winner
(3, 12, 2), -- Brass: Birmingham runner-up

-- As d'Or Expert 2018
(4, 14, 1), -- Terraforming Mars winner

-- Mensa Select Winner 2017
(5, 5, 1),  -- Azul winner
(5, 9, 1),  -- Codenames winner (multiple winners possible)

-- UK Games Expo Best Family Game 2022
(6, 2, 1),  -- Ticket to Ride winner

-- Additional awards
(1, 9, 2),  -- Codenames - Spiel nominee
(2, 12, 3), -- Brass: Birmingham - Kennerspiel nominee
(3, 1, 3),  -- Wingspan - Golden Geek nominee
(4, 6, 2),  -- 7 Wonders - As d'Or runner-up
(5, 8, 1),  -- Splendor - Mensa Select winner
(6, 7, 2);  -- Carcassonne - UK Games Expo runner-up
