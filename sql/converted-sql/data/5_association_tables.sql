-- SQLINES DEMO *** ====================================
-- SQLINES DEMO *** s (Many-to-Many Relationships)
-- SQLINES DEMO *** ion_tables.sql
-- SQLINES DEMO *** ====================================

-- SQLINES DEMO *** ta (if any)
-- TRUNCATE TABLE board_game_category CASCADE;
-- TRUNCATE TABLE board_game_mechanic CASCADE;
-- TRUNCATE TABLE user_game_release CASCADE;
-- TRUNCATE TABLE play_participant CASCADE;
-- TRUNCATE TABLE award_board_game CASCADE;

-- SQLINES DEMO *** ====================================
-- BO... SQLINES DEMO ***
-- SQLINES DEMO *** ====================================
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
INSERT INTO main.board_game_category (board_game_id, category_id) VALUES
-- SQLINES DEMO *** y, Family
(1, 1),
(1, 4),

-- SQLINES DEMO *** trategy, Family
(2, 1),
(2, 4),

-- SQLINES DEMO *** Family, Economic
(3, 1),
(3, 4),
(3, 5),

-- SQLINES DEMO *** y, Cooperative, Family
(4, 1),
(4, 3),
(4, 4),

-- SQLINES DEMO *** bstract, Family
(5, 1),
(5, 7),
(5, 4),

-- SQLINES DEMO *** gy, Economic
(6, 1),
(6, 5),

-- SQLINES DEMO *** tegy, Family
(7, 1),
(7, 4),

-- SQLINES DEMO *** y, Economic, Family
(8, 1),
(8, 5),
(8, 4),

-- SQLINES DEMO ***  Deduction
(9, 2),
(9, 8),

-- SQLINES DEMO *** y, Economic
(10, 1),
(10, 5),

-- SQLINES DEMO *** y, Economic
(11, 1),
(11, 5),

-- SQLINES DEMO *** : Strategy, Economic
(12, 1),
(12, 5),

-- SQLINES DEMO ***  Economic, Adventure
(13, 1),
(13, 5),
(13, 6),

-- SQLINES DEMO *** : Strategy, Economic
(14, 1),
(14, 5),

-- SQLINES DEMO *** egy, Cooperative, Adventure
(15, 1),
(15, 3),
(15, 6);

-- SQLINES DEMO *** ====================================
-- BO... SQLINES DEMO ***
-- SQLINES DEMO *** ====================================
INSERT INTO main.board_game_mechanic (board_game_id, mechanic_id) VALUES
-- SQLINES DEMO *** nagement, Set Collection, Engine Building
(1, 8),
(1, 6),
(1, 10),

-- SQLINES DEMO *** et Collection, Hand Management
(2, 6),
(2, 8),

-- SQLINES DEMO *** ng, Resource Management, Trading
(3, 5),
(3, 7),

-- SQLINES DEMO *** nagement, Set Collection, Cooperative Action Selection
(4, 8),
(4, 6),

-- SQLINES DEMO *** ent, Drafting, Set Collection
(5, 4),
(5, 9),
(5, 6),

-- SQLINES DEMO *** ng, Hand Management, Set Collection, Engine Building
(6, 9),
(6, 8),
(6, 6),
(6, 10),

-- SQLINES DEMO ***  Placement, Area Control
(7, 4),
(7, 3),

-- SQLINES DEMO *** lection, Hand Management, Engine Building
(8, 6),
(8, 8),
(8, 10),

-- SQLINES DEMO *** ion, Team-Based
(9, 8),

-- SQLINES DEMO *** ilding, Hand Management
(10, 1),
(10, 8),

-- SQLINES DEMO *** Placement, Resource Management, Drafting
(11, 2),
(11, 7),
(11, 9),

-- SQLINES DEMO *** : Resource Management, Area Control, Hand Management
(12, 7),
(12, 3),
(12, 8),

-- SQLINES DEMO *** rol, Engine Building, Resource Management
(13, 3),
(13, 10),
(13, 7),

-- SQLINES DEMO *** : Hand Management, Drafting, Engine Building, Resource Management
(14, 8),
(14, 9),
(14, 10),
(14, 7),

-- SQLINES DEMO *** Management, Deck Building, Scenario-Based
(15, 8),
(15, 1);

-- SQLINES DEMO *** ====================================
-- US... SQLINES DEMO ***
-- SQLINES DEMO *** ====================================
INSERT INTO main.user_game_release (user_id, game_release_id, acquired_at) VALUES
-- SQLINES DEMO *** ter_42) - large collection
(1, 1, '2019-02-15 14:00:00'),  -- Wi... SQLINES DEMO ***
(1, 4, '2010-05-20 16:30:00'),  -- SQLINES DEMO *** glish
(1, 9, '2005-08-10 12:00:00'),  -- Ca... SQLINES DEMO ***
(1, 14, '2018-01-15 15:45:00'), -- Az... SQLINES DEMO ***
(1, 20, '2008-06-20 17:00:00'), -- Ca... SQLINES DEMO ***
(1, 28, '2009-03-10 14:30:00'), -- Do... SQLINES DEMO ***
(1, 32, '2018-08-15 16:00:00'), -- Br... SQLINES DEMO ***
(1, 33, '2017-01-20 18:15:00'), -- Sc... SQLINES DEMO ***
(1, 35, '2017-02-25 19:30:00'), -- SQLINES DEMO ***  English

-- SQLINES DEMO *** queen) - experienced player
(2, 1, '2019-04-01 15:00:00'),  -- Wi... SQLINES DEMO ***
(2, 11, '2010-01-10 13:45:00'), -- Pa... SQLINES DEMO ***
(2, 16, '2011-01-15 16:00:00'), -- 7 ... SQLINES DEMO ***
(2, 22, '2015-01-05 17:30:00'), -- Sp... SQLINES DEMO ***
(2, 30, '2008-01-20 14:15:00'), -- Ag... SQLINES DEMO ***
(2, 37, '2017-08-10 19:00:00'), -- Gl... SQLINES DEMO ***

-- SQLINES DEMO *** er_89)
(3, 8, '2012-06-15 15:30:00'),  -- Ca... SQLINES DEMO ***
(3, 25, '2016-01-20 16:45:00'), -- Co... SQLINES DEMO ***
(3, 28, '2011-09-10 18:00:00'), -- Do... SQLINES DEMO ***
(3, 35, '2018-05-15 20:15:00'), -- SQLINES DEMO ***  English

-- SQLINES DEMO *** mer)
(4, 4, '2015-07-10 14:00:00'),  -- SQLINES DEMO *** glish
(4, 9, '2016-08-20 15:30:00'),  -- Ca... SQLINES DEMO ***
(4, 11, '2014-05-15 17:00:00'), -- Pa... SQLINES DEMO ***
(4, 19, '2010-03-25 16:00:00'), -- Ca... SQLINES DEMO ***

-- SQLINES DEMO *** llector) - big collector
(5, 1, '2019-05-10 13:00:00'),  -- Wi... SQLINES DEMO ***
(5, 14, '2018-04-20 14:30:00'), -- Az... SQLINES DEMO ***
(5, 22, '2016-02-15 16:00:00'), -- Sp... SQLINES DEMO ***
(5, 30, '2010-05-20 17:45:00'), -- Ag... SQLINES DEMO ***
(5, 33, '2018-01-10 19:00:00'), -- Sc... SQLINES DEMO ***
(5, 37, '2018-09-05 20:30:00'), -- Gl... SQLINES DEMO ***

-- SQLINES DEMO *** usiast)
(6, 2, '2019-03-10 15:15:00'),  -- Wi... SQLINES DEMO ***
(6, 12, '2013-04-20 16:30:00'), -- Pa... SQLINES DEMO ***
(6, 17, '2011-03-15 18:00:00'), -- 7 ... SQLINES DEMO ***
(6, 32, '2019-01-05 19:45:00'), -- Br... SQLINES DEMO ***
(6, 35, '2019-01-25 21:00:00'), -- SQLINES DEMO ***  English

-- SQLINES DEMO *** t_host)
(7, 4, '2018-02-15 14:45:00'),  -- SQLINES DEMO *** glish
(7, 9, '2016-04-20 16:00:00'),  -- Ca... SQLINES DEMO ***
(7, 19, '2015-06-10 17:30:00'), -- Ca... SQLINES DEMO ***
(7, 25, '2017-11-15 19:00:00'), -- Co... SQLINES DEMO ***

-- SQLINES DEMO *** wizard)
(8, 1, '2020-01-10 15:30:00'),  -- Wi... SQLINES DEMO ***
(8, 14, '2019-01-15 17:00:00'), -- Az... SQLINES DEMO ***
(8, 22, '2017-06-20 18:30:00'), -- Sp... SQLINES DEMO ***

-- SQLINES DEMO *** k_99)
(9, 25, '2016-02-05 14:00:00'), -- Co... SQLINES DEMO ***
(9, 28, '2015-03-20 15:45:00'), -- Do... SQLINES DEMO ***
(9, 33, '2019-11-01 17:15:00'), -- Sc... SQLINES DEMO ***

-- SQLINES DEMO *** un_time)
(10, 4, '2019-10-20 13:30:00'), -- SQLINES DEMO *** glish
(10, 14, '2020-06-15 15:00:00'), -- Az... SQLINES DEMO ***
(10, 19, '2019-11-25 16:45:00'), -- Ca... SQLINES DEMO ***
(10, 25, '2018-07-10 18:15:00'), -- Co... SQLINES DEMO ***

-- SQLINES DEMO *** delver)
(11, 11, '2020-03-15 14:30:00'), -- Pa... SQLINES DEMO ***
(11, 33, '2019-10-20 16:00:00'), -- Sc... SQLINES DEMO ***
(11, 37, '2019-12-10 17:45:00'), -- Gl... SQLINES DEMO ***

-- SQLINES DEMO *** aster)
(12, 14, '2019-09-05 15:15:00'), -- Az... SQLINES DEMO ***
(12, 19, '2019-07-20 16:45:00'), -- Ca... SQLINES DEMO ***
(12, 22, '2019-08-30 18:00:00'); -- Sp... SQLINES DEMO ***

-- SQLINES DEMO *** ====================================
-- PL... SQLINES DEMO ***
-- SQLINES DEMO *** ====================================
INSERT INTO main.play_participant (play_id, user_id) VALUES
-- SQLINES DEMO *** at User 1's home
(1, 1),
(1, 5),
(1, 6),
(1, 8),

-- SQLINES DEMO ***  Ride family night
(2, 10),
(2, 4),
(2, 7),

-- SQLINES DEMO ***  party night
(3, 7),
(3, 3),
(3, 9),
(3, 10),
(3, 4),
(3, 12),

-- SQLINES DEMO *** co-op
(4, 2),
(4, 4),
(4, 6),
(4, 11),

-- SQLINES DEMO *** ing
(5, 1),
(5, 8),
(5, 12),

-- SQLINES DEMO *** ssic
(6, 3),
(6, 7),
(6, 9),
(6, 5),

-- SQLINES DEMO ***  tournament
(7, 2),
(7, 6),
(7, 9),
(7, 3),
(7, 11),
(7, 1),

-- SQLINES DEMO *** lunch
(8, 2),
(8, 5),
(8, 8),
(8, 12),

-- SQLINES DEMO *** ne cafe
(9, 4),
(9, 7),
(9, 10),
(9, 12),

-- SQLINES DEMO ***  full group
(10, 1),
(10, 6),
(10, 8),
(10, 5),
(10, 2),

-- Pl... SQLINES DEMO ***
(11, 1),
(11, 9),
(11, 3),

-- SQLINES DEMO *** o Ride intro
(12, 7),
(12, 10),
(12, 4),
(12, 12),

-- SQLINES DEMO *** pic
(13, 2),
(13, 5),
(13, 9),
(13, 11),

-- SQLINES DEMO ***  victory
(14, 2),
(14, 4),
(14, 11),

-- SQLINES DEMO ***  strategic
(15, 6),
(15, 5),
(15, 2),
(15, 11),

-- SQLINES DEMO *** ming Mars marathon
(16, 3),
(16, 1),
(16, 6),

-- Pl... SQLINES DEMO ***
(17, 5),
(17, 6),

-- SQLINES DEMO *** s game night
(18, 7),
(18, 9),
(18, 10),
(18, 3),
(18, 4),
(18, 12),

-- SQLINES DEMO *** rmingham close
(19, 1),
(19, 2),
(19, 6),

-- SQLINES DEMO *** nne expansions
(20, 7),
(20, 4),
(20, 10),
(20, 1),
(20, 12),

-- SQLINES DEMO *** s full count
(21, 2),
(21, 9),
(21, 3),
(21, 6),
(21, 11),
(21, 7),
(21, 1),

-- SQLINES DEMO ***  birds
(22, 1),
(22, 8),
(22, 5),
(22, 6),

-- SQLINES DEMO *** en campaign
(23, 2),
(23, 5),
(23, 11),

-- SQLINES DEMO ***  cafe
(24, 12),
(24, 8),
(24, 10),

-- SQLINES DEMO *** eat
(25, 7),
(25, 9),
(25, 3),
(25, 5),

-- SQLINES DEMO *** o Ride family
(26, 10),
(26, 4),
(26, 7),
(26, 12),
(26, 8),

-- SQLINES DEMO ***  lost
(27, 1),
(27, 4),
(27, 2),
(27, 11),

-- SQLINES DEMO ***  expansion
(28, 1),
(28, 3),
(28, 9),
(28, 7),

-- SQLINES DEMO *** s teams
(29, 7),
(29, 3),
(29, 9),
(29, 10),
(29, 4),
(29, 12),
(29, 8),
(29, 11),

-- Pl... SQLINES DEMO ***
(30, 8),
(30, 6),
(30, 1),
(30, 5),

-- SQLINES DEMO *** usviet
(31, 5),
(31, 9),
(31, 11),
(31, 2),
(31, 13),

-- SQLINES DEMO *** nne city
(32, 1),
(32, 10),
(32, 7),

-- SQLINES DEMO ***  starved
(33, 2),
(33, 6),
(33, 11),

-- SQLINES DEMO *** s science
(34, 2),
(34, 3),
(34, 6),
(34, 9),
(34, 7),

-- SQLINES DEMO ***  feeders
(35, 1),
(35, 6),
(35, 8),
(35, 5),
(35, 2),

-- SQLINES DEMO *** ming Mars ecologist
(36, 6),
(36, 3),
(36, 9),

-- SQLINES DEMO ***  dinner
(37, 5),
(37, 8),

-- SQLINES DEMO *** nal
(38, 2),
(38, 1),
(38, 6),
(38, 9),

-- SQLINES DEMO *** en scenario
(39, 2),
(39, 5),
(39, 11),
(39, 7),

-- SQLINES DEMO *** o Ride Europe
(40, 10),
(40, 4),
(40, 7),
(40, 8),

-- SQLINES DEMO ***  medic
(41, 2),
(41, 4),
(41, 11),

-- SQLINES DEMO *** ngest road
(42, 3),
(42, 7),
(42, 9),
(42, 5),

-- SQLINES DEMO *** s pictures
(43, 7),
(43, 9),
(43, 10),
(43, 4),
(43, 3),
(43, 12),

-- SQLINES DEMO *** fect wall
(44, 1),
(44, 5),
(44, 8);

-- SQLINES DEMO *** ====================================
-- AW... SQLINES DEMO ***
-- SQLINES DEMO *** ====================================
INSERT INTO main.award_board_game (award_id, board_game_id, received_place) VALUES
-- SQLINES DEMO *** 2019
(1, 1, 1),  -- Wi... SQLINES DEMO ***

-- SQLINES DEMO *** ahres 2020
(2, 13, 2), -- Sc... SQLINES DEMO ***

-- SQLINES DEMO *** Board Game 2021
(3, 15, 1), -- Gl... SQLINES DEMO ***
(3, 12, 2), -- SQLINES DEMO ***  runner-up

-- As... SQLINES DEMO ***
(4, 14, 1), -- SQLINES DEMO ***  winner

-- SQLINES DEMO *** er 2017
(5, 5, 1),  -- Az... SQLINES DEMO ***
(5, 9, 1),  -- SQLINES DEMO *** (multiple winners possible)

-- SQLINES DEMO *** t Family Game 2022
(6, 2, 1),  -- SQLINES DEMO *** nner

-- Ad... SQLINES DEMO ***
(1, 9, 2),  -- SQLINES DEMO ***  nominee
(2, 12, 3), -- SQLINES DEMO ***  - Kennerspiel nominee
(3, 1, 3),  -- SQLINES DEMO ***  Geek nominee
(4, 6, 2),  -- SQLINES DEMO *** Or runner-up
(5, 8, 1),  -- SQLINES DEMO *** Select winner
(6, 7, 2);  -- SQLINES DEMO *** Games Expo runner-up
