-- SQLINES DEMO *** ====================================
-- SQLINES DEMO *** ndent Tables
-- SQLINES DEMO *** evel_dependencies.sql
-- SQLINES DEMO *** ====================================

-- SQLINES DEMO *** ta (if any)
TRUNCATE TABLE price CASCADE;
ALTER SEQUENCE price_price_id_seq RESTART -- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
 WITH 1;
TRUNCATE TABLE rating CASCADE;
ALTER SEQUENCE rating_rating_id_seq RESTART WITH 1;
TRUNCATE TABLE review CASCADE;
ALTER SEQUENCE review_review_id_seq RESTART WITH 1;
TRUNCATE TABLE play CASCADE;
ALTER SEQUENCE play_play_id_seq RESTART WITH 1;
TRUNCATE TABLE game_wish CASCADE;
ALTER SEQUENCE game_wish_game_wish_id_seq RESTART WITH 1;

-- SQLINES DEMO *** ====================================
-- PR... SQLINES DEMO ***
-- SQLINES DEMO *** ====================================
INSERT INTO price (game_release_id, amount, currency, start_date, end_date) VALUES
-- Wi... SQLINES DEMO ***
(1, 55.00, 'USD', '2019-01-25', '2020-12-31'),
(1, 60.00, 'USD', '2021-01-01', '2022-12-31'),
(1, 65.00, 'USD', '2023-01-01', NULL),
(2, 49.99, 'EUR', '2019-03-15', NULL),
(3, 189.99, 'PLN', '2019-06-10', NULL),

-- SQLINES DEMO *** ices
(4, 39.99, 'USD', '2004-10-02', '2015-12-31'),
(4, 44.99, 'USD', '2016-01-01', NULL),
(5, 39.99, 'EUR', '2005-03-20', NULL),
(7, 169.99, 'PLN', '2012-09-01', NULL),

-- Ca... SQLINES DEMO ***
(8, 29.99, 'EUR', '1995-09-01', '2010-12-31'),
(8, 34.99, 'EUR', '2011-01-01', NULL),
(9, 35.00, 'USD', '1996-03-15', '2015-12-31'),
(9, 42.00, 'USD', '2016-01-01', NULL),
(10, 159.99, 'PLN', '2010-08-20', NULL),

-- Pa... SQLINES DEMO ***
(11, 32.99, 'USD', '2008-01-01', '2020-12-31'),
(11, 39.99, 'USD', '2021-01-01', NULL),
(12, 149.99, 'PLN', '2013-05-10', NULL),
(13, 34.99, 'EUR', '2009-03-15', NULL),

-- Az... SQLINES DEMO ***
(14, 35.00, 'USD', '2017-10-01', NULL),
(15, 32.99, 'EUR', '2017-10-01', NULL),

-- 7 ... SQLINES DEMO ***
(16, 44.99, 'USD', '2010-12-01', NULL),
(17, 42.99, 'EUR', '2011-02-15', NULL),
(18, 179.99, 'PLN', '2012-06-20', NULL),

-- Ca... SQLINES DEMO ***
(19, 24.99, 'EUR', '2000-01-01', '2010-12-31'),
(19, 29.99, 'EUR', '2011-01-01', NULL),
(20, 29.99, 'USD', '2001-06-15', NULL),
(21, 119.99, 'PLN', '2008-09-10', NULL),

-- Sp... SQLINES DEMO ***
(22, 39.99, 'USD', '2014-04-01', NULL),
(23, 36.99, 'EUR', '2014-08-15', NULL),
(24, 159.99, 'PLN', '2015-03-20', NULL),

-- Co... SQLINES DEMO ***
(25, 19.99, 'USD', '2015-08-01', NULL),
(26, 18.99, 'EUR', '2015-10-15', NULL),
(27, 89.99, 'PLN', '2016-03-01', NULL),

-- Do... SQLINES DEMO ***
(28, 44.99, 'USD', '2008-10-10', '2018-12-31'),
(28, 49.99, 'USD', '2019-01-01', NULL),
(29, 42.99, 'EUR', '2009-02-20', NULL),

-- Ag... SQLINES DEMO ***
(30, 54.99, 'EUR', '2007-10-01', NULL),
(31, 59.99, 'USD', '2008-09-15', NULL),

-- SQLINES DEMO ***  prices
(32, 79.99, 'USD', '2018-07-01', NULL),

-- Sc... SQLINES DEMO ***
(33, 79.99, 'USD', '2016-08-03', '2020-12-31'),
(33, 89.99, 'USD', '2021-01-01', NULL),
(34, 74.99, 'EUR', '2017-03-10', NULL),

-- SQLINES DEMO ***  prices
(35, 69.99, 'USD', '2016-10-01', NULL),
(36, 64.99, 'EUR', '2017-05-15', NULL),

-- Gl... SQLINES DEMO ***
(37, 140.00, 'USD', '2017-07-01', '2019-12-31'),
(37, 149.99, 'USD', '2020-01-01', NULL);

-- SQLINES DEMO *** ====================================
-- RA... SQLINES DEMO ***
-- SQLINES DEMO *** ====================================
INSERT INTO rating (board_game_id, user_id, enjoyment, minimal_player_count, maximum_player_count, best_player_count, minimal_age, complexity, rated_at) VALUES
-- Wi... SQLINES DEMO ***
(1, 1, 9, 1, 5, 3, 10, 3, '2019-03-15 14:30:00'),
(1, 2, 8, 2, 5, 4, 12, 2, '2019-04-20 10:15:00'),
(1, 5, 10, 1, 5, 2, 10, 3, '2019-05-12 18:45:00'),
(1, 6, 8, 2, 5, 3, 10, 2, '2019-06-08 20:00:00'),
(1, 8, 9, 1, 5, 4, 10, 3, '2020-01-15 16:20:00'),

-- SQLINES DEMO *** tings
(2, 1, 7, 2, 5, 4, 8, 2, '2010-06-15 12:00:00'),
(2, 4, 8, 2, 5, 3, 8, 1, '2015-08-22 14:30:00'),
(2, 7, 7, 2, 5, 4, 8, 2, '2018-03-10 19:00:00'),
(2, 10, 9, 2, 5, 5, 8, 1, '2019-11-05 11:45:00'),

-- Ca... SQLINES DEMO ***
(3, 1, 7, 3, 4, 4, 10, 2, '2005-05-20 15:30:00'),
(3, 3, 6, 3, 4, 4, 10, 2, '2012-07-14 13:20:00'),
(3, 4, 8, 3, 4, 4, 10, 2, '2016-09-03 17:45:00'),
(3, 9, 7, 3, 4, 4, 10, 2, '2020-02-18 20:15:00'),

-- Pa... SQLINES DEMO ***
(4, 2, 9, 2, 4, 4, 8, 2, '2010-01-15 16:30:00'),
(4, 4, 8, 2, 4, 3, 8, 3, '2014-06-20 14:00:00'),
(4, 6, 10, 2, 4, 4, 10, 2, '2017-03-12 19:45:00'),
(4, 7, 8, 2, 4, 4, 8, 2, '2019-08-25 21:00:00'),
(4, 11, 9, 2, 4, 3, 8, 3, '2020-04-10 12:30:00'),

-- Az... SQLINES DEMO ***
(5, 1, 8, 2, 4, 2, 8, 2, '2018-02-10 13:15:00'),
(5, 5, 9, 2, 4, 3, 8, 1, '2018-05-15 15:45:00'),
(5, 8, 7, 2, 4, 2, 8, 2, '2019-01-20 18:00:00'),
(5, 10, 8, 2, 4, 2, 8, 2, '2020-07-08 16:30:00'),

-- 7 ... SQLINES DEMO ***
(6, 2, 8, 3, 7, 5, 10, 3, '2011-03-15 14:20:00'),
(6, 3, 7, 2, 7, 4, 12, 3, '2013-06-20 16:45:00'),
(6, 6, 9, 3, 7, 6, 10, 2, '2015-09-10 19:30:00'),
(6, 9, 8, 3, 7, 5, 10, 3, '2018-11-22 21:15:00'),

-- Ca... SQLINES DEMO ***
(7, 1, 7, 2, 5, 3, 7, 2, '2008-04-12 15:00:00'),
(7, 4, 8, 2, 5, 4, 7, 1, '2012-08-18 13:30:00'),
(7, 7, 7, 2, 5, 3, 7, 2, '2016-05-25 17:45:00'),
(7, 10, 8, 2, 5, 3, 8, 2, '2019-12-10 19:00:00'),

-- Sp... SQLINES DEMO ***
(8, 2, 8, 2, 4, 3, 10, 2, '2015-01-20 14:15:00'),
(8, 5, 9, 2, 4, 2, 10, 2, '2016-03-15 16:30:00'),
(8, 8, 7, 2, 4, 3, 10, 2, '2017-07-22 18:45:00'),
(8, 12, 8, 2, 4, 2, 10, 2, '2019-09-14 20:00:00'),

-- Co... SQLINES DEMO ***
(9, 3, 8, 4, 8, 6, 14, 1, '2016-02-10 15:45:00'),
(9, 4, 9, 4, 8, 8, 14, 1, '2016-09-20 19:30:00'),
(9, 7, 8, 4, 8, 6, 12, 1, '2017-12-05 21:00:00'),
(9, 10, 9, 4, 8, 8, 14, 1, '2018-08-18 14:15:00'),

-- Do... SQLINES DEMO ***
(10, 1, 8, 2, 4, 3, 13, 3, '2009-05-15 16:00:00'),
(10, 3, 7, 2, 4, 2, 13, 3, '2011-11-20 18:30:00'),
(10, 9, 9, 2, 4, 3, 13, 2, '2015-04-10 20:15:00'),

-- Ag... SQLINES DEMO ***
(11, 2, 8, 1, 4, 3, 12, 4, '2008-12-10 15:30:00'),
(11, 5, 9, 1, 4, 2, 12, 4, '2010-06-15 17:45:00'),
(11, 6, 7, 2, 4, 3, 14, 4, '2013-09-20 19:00:00'),

-- SQLINES DEMO ***  ratings
(12, 1, 10, 2, 4, 4, 14, 4, '2019-01-15 14:00:00'),
(12, 2, 9, 2, 4, 3, 14, 5, '2019-03-22 16:30:00'),
(12, 6, 9, 2, 4, 4, 14, 4, '2019-08-10 18:45:00'),

-- Sc... SQLINES DEMO ***
(13, 1, 9, 1, 5, 4, 14, 3, '2017-02-10 15:15:00'),
(13, 2, 8, 2, 5, 3, 14, 3, '2017-05-18 17:30:00'),
(13, 5, 10, 1, 5, 5, 14, 3, '2018-01-25 19:45:00'),
(13, 11, 9, 2, 5, 4, 14, 3, '2019-11-08 21:00:00'),

-- SQLINES DEMO ***  ratings
(14, 1, 9, 1, 5, 3, 12, 3, '2017-03-15 14:45:00'),
(14, 3, 8, 2, 5, 4, 12, 4, '2018-06-20 16:00:00'),
(14, 6, 10, 1, 5, 3, 12, 3, '2019-02-10 18:15:00'),
(14, 9, 8, 2, 5, 4, 14, 4, '2020-05-15 20:30:00'),

-- Gl... SQLINES DEMO ***
(15, 2, 10, 1, 4, 3, 14, 4, '2018-03-10 15:00:00'),
(15, 5, 9, 2, 4, 4, 14, 4, '2018-09-15 17:15:00'),
(15, 11, 10, 1, 4, 2, 14, 5, '2019-12-20 19:30:00');

-- SQLINES DEMO *** ====================================
-- RE... SQLINES DEMO ***
-- SQLINES DEMO *** ====================================
INSERT INTO review (board_game_id, user_id, review_text, hours_spent_playing, reviewed_at) VALUES
(1, 1, 'Wingspan is an absolute masterpiece! The bird theme is beautifully integrated with the engine-building mechanics. Each turn feels meaningful, and the variety of birds ensures no two games are the same. The production quality is outstanding with gorgeous artwork. My only minor complaint is that it can be a bit multiplayer solitaire at times, but the gameplay is so engaging that I don''t mind. Highly recommended for anyone who enjoys medium-weight Euro games.', 45, '2019-03-20 15:00:00'),

(1, 5, 'As a nature enthusiast and board gamer, Wingspan hits all the right notes. The educational aspect of learning about different bird species adds depth to the experience. The card combos are satisfying to pull off, and the egg-laying mechanism is clever. Games flow smoothly once everyone knows the rules. Perfect for relaxed game nights with friends who appreciate thoughtful strategy without being overly competitive.', 60, '2019-06-15 18:30:00'),

(2, 4, 'Ticket to Ride is the perfect gateway game. Simple enough to teach to non-gamers, yet strategic enough to keep experienced players engaged. The tension of watching your routes get blocked is real! We''ve introduced dozens of friends to modern board gaming with this title. The various map expansions add great replay value. A true classic that deserves its place in every collection.', 80, '2015-08-25 14:15:00'),

(3, 3, 'Catan was my introduction to modern board games, and while I''ve played hundreds of games since, it still holds a special place. The trading mechanic creates great player interaction, and the dice rolling keeps things exciting. However, the randomness can be frustrating, especially with the robber. Still a solid game for casual play, though I''ve moved on to more complex titles.', 120, '2012-07-20 16:45:00'),

(4, 2, 'Pandemic is the gold standard for cooperative games. The escalating tension as epidemics strike is perfectly balanced. Every decision matters, and the teamwork required makes for memorable experiences. We''ve played through multiple campaigns and it never gets old. The various roles add asymmetry and replayability. If you can only own one co-op game, make it this one.', 95, '2010-02-10 19:00:00'),

(4, 11, 'Absolutely love Pandemic! As someone who enjoys collaborative experiences over competitive ones, this game is perfect. The difficulty can be adjusted to match your group''s skill level, and the sense of accomplishment when you win is incredible. The theme has become even more relevant recently. Highly strategic without being overwhelming for newer players.', 40, '2020-04-15 20:30:00'),

(5, 5, 'Azul is pure elegance. The tile-drafting mechanism is simple yet creates deep strategic choices. The physical components are satisfyingly tactile, and the abstract nature makes it accessible to everyone. Games are quick enough for multiple plays in one sitting. It''s become our go-to game for introducing people to modern board gaming. Beautiful, engaging, and perfectly balanced.', 35, '2018-05-20 17:15:00'),

(6, 6, 'Seven Wonders is a brilliant civilization-building game that plays quickly despite supporting up to 7 players. The card drafting creates interesting decisions every turn. I appreciate how it scales well at different player counts. The iconography takes a game or two to learn, but then everything flows smoothly. The expansions add even more depth. A staple of game nights for years now.', 70, '2015-09-15 21:00:00'),

(7, 4, 'Carcassonne is wonderfully simple yet strategically satisfying. Placing tiles and meeples to build the medieval landscape is relaxing and engaging. It''s our family''s favorite game - easy enough for kids to grasp but with enough depth to keep adults interested. The numerous expansions provide variety, though the base game is excellent on its own. A timeless classic.', 65, '2012-08-25 15:30:00'),

(8, 5, 'Splendor is my favorite filler game. The chip-collecting and card-buying mechanism creates a satisfying engine that builds throughout the game. It''s easy to teach but has surprising depth in timing your purchases and blocking opponents. Games are quick, making it perfect for lunch breaks or as a warm-up. The components feel premium, and the Renaissance theme works well.', 50, '2016-03-20 18:45:00'),

(9, 7, 'Codenames is party game perfection! The word association gameplay creates hilarious moments and showcases how differently people think. It scales wonderfully for large groups and plays quickly enough for multiple rounds. Both giving and receiving clues is equally fun. This has replaced traditional party games at our gatherings. Easy to learn, impossible to master, and always entertaining.', 55, '2017-12-10 22:00:00'),

(10, 9, 'Dominion revolutionized deck-building, and it''s still one of the best. The kingdom card variety ensures incredible replayability - every game feels fresh. Building an efficient deck is deeply satisfying, and turns play quickly once everyone is familiar with the cards. The expansions add tremendous depth. While other deck-builders have emerged, Dominion remains the benchmark.', 85, '2015-04-15 19:30:00'),

(11, 5, 'Agricola is a punishing but rewarding experience. Every action matters, and there''s never enough time to do everything you want. The occupations and improvements add variability and strategy. It can be stressful - you''re constantly scrambling to feed your family - but that tension makes victories feel earned. Not for casual gamers, but perfect for those who enjoy optimization puzzles.', 75, '2010-06-20 20:15:00'),

(12, 1, 'Brass: Birmingham is a masterclass in economic game design. The network-building combined with the card-based action selection creates fascinating decisions. The two-era structure keeps the game dynamic. Every playthrough tells a different industrial revolution story. Yes, it''s complex and takes time to learn, but the depth is incredible. This is peak Euro gaming - absolutely brilliant!', 65, '2019-01-20 16:00:00'),

(13, 5, 'Scythe delivers a unique blend of area control, engine building, and asymmetric factions. The alternate-history theme is immersive, and the artwork is stunning. I love how combat is relatively rare but impactful when it happens. The various paths to victory ensure different strategies are viable. Solo mode is also excellent. One of my all-time favorites!', 90, '2018-02-01 21:30:00'),

(14, 6, 'Terraforming Mars is an epic engine-building experience with incredible thematic integration. Playing cards to transform Mars feels meaningful, and the variety of corporations and cards ensures no two games are alike. Games are long but engaging throughout. The production quality could be better, but the gameplay more than compensates. A must-have for space and engine-building enthusiasts.', 110, '2019-02-15 19:45:00'),

(15, 2, 'Gloomhaven is a campaign-driven masterpiece. The tactical combat is challenging and rewarding, character progression feels meaningful, and the branching story creates investment. Yes, setup is involved and games are long, but the experience is unmatched. The legacy elements keep you coming back. This is more of a gaming lifestyle than a single game - and I love every minute of it!', 180, '2018-03-15 17:00:00'),

(15, 11, 'As someone who loves fantasy adventures, Gloomhaven is a dream come true. The character classes are unique and evolving your character is incredibly satisfying. The scenario design is clever, requiring tactical thinking and planning. Playing through the campaign with a dedicated group has been one of my best gaming experiences. Fair warning: this requires serious commitment, but it''s absolutely worth it.', 145, '2019-12-25 20:00:00');

-- SQLINES DEMO *** ====================================
-- PL... SQLINES DEMO ***
-- SQLINES DEMO *** ====================================
INSERT INTO play (board_game_id, location_id, winner_user_id, play_date, player_count, duration_in_minutes, note) VALUES
-- Re... SQLINES DEMO ***
(1, 1, 5, '2024-10-15', 4, 75, 'Great game with the European expansion. Close scores all around!'),
(2, 8, 10, '2024-10-12', 5, 65, 'Family game night - kids loved it!'),
(9, 3, NULL, '2024-10-10', 8, 45, 'Party night with friends. Lots of laughter!'),
(4, 2, NULL, '2024-10-08', 4, 90, 'Barely won on the last turn. Intense!'),
(5, 1, 8, '2024-10-05', 3, 40, 'Quick evening game. Azul never disappoints.'),
(3, 7, 3, '2024-10-03', 4, 85, 'Classic Catan with lots of trading'),
(6, 4, 6, '2024-09-28', 6, 50, 'Tournament practice game'),
(8, 1, 2, '2024-09-25', 4, 35, 'Lunchtime quick play'),
(7, 10, 4, '2024-09-22', 4, 60, 'Relaxed cafe gaming session'),
(1, 6, 1, '2024-09-20', 5, 80, 'Wingspan night with the full group'),

-- SQLINES DEMO *** ariety
(10, 1, 9, '2024-09-15', 3, 45, 'Testing new kingdom card combinations'),
(2, 8, 7, '2024-09-10', 4, 70, 'Introducing the game to new players'),
(13, 9, 2, '2024-09-05', 4, 120, 'Epic Scythe session - very competitive'),
(4, 2, NULL, '2024-08-30', 3, 85, 'Cooperative victory against tough difficulty'),
(11, 3, 6, '2024-08-25', 4, 150, 'Long Agricola game - everyone was strategic'),
(14, 1, 3, '2024-08-20', 3, 180, 'Marathon Terraforming Mars session'),
(5, 6, 5, '2024-08-15', 2, 30, 'Quick two-player game'),
(9, 4, NULL, '2024-08-10', 6, 40, 'Game night at community center'),
(12, 9, 1, '2024-08-05', 3, 135, 'Brass Birmingham - incredibly close game'),
(7, 1, 7, '2024-07-30', 5, 70, 'Carcassonne with expansions'),
(6, 2, 9, '2024-07-25', 7, 45, '7 Wonders with full player count'),
(1, 1, 8, '2024-07-20', 4, 75, 'Wingspan - bird bonanza!'),
(15, 5, NULL, '2024-07-15', 3, 210, 'Gloomhaven campaign session 5 - no winner in co-op'),
(8, 10, 12, '2024-07-10', 3, 35, 'Splendor at the cafe'),
(3, 7, 9, '2024-07-05', 4, 80, 'Catan - wheat monopoly strategy worked!'),
(2, 8, 4, '2024-06-30', 5, 68, 'Ticket to Ride family tournament'),
(4, 1, NULL, '2024-06-25', 4, 95, 'Pandemic - lost to outbreaks but fun trying'),
(10, 3, 1, '2024-06-20', 4, 50, 'Dominion with Prosperity expansion'),
(9, 4, NULL, '2024-06-15', 8, 50, 'Codenames teams battle'),
(5, 6, 8, '2024-06-10', 4, 45, 'Azul with the beautiful tiles'),
(13, 9, 5, '2024-06-05', 5, 125, 'Scythe - Rusviet faction dominated'),
(7, 1, 10, '2024-05-30', 3, 55, 'Carcassonne - big city strategy'),
(11, 3, 2, '2024-05-25', 3, 140, 'Agricola - everyone starved less this time!'),
(6, 2, 3, '2024-05-20', 5, 48, '7 Wonders - science victory'),
(1, 1, 6, '2024-05-15', 5, 78, 'Wingspan with bird feeders full'),
(14, 9, 6, '2024-05-10', 4, 175, 'Terraforming Mars - ecologist strategy'),
(8, 10, 5, '2024-05-05', 2, 28, 'Quick Splendor before dinner'),
(12, 9, 2, '2024-04-30', 4, 145, 'Brass Birmingham - canal era was crucial'),
(15, 5, NULL, '2024-04-25', 4, 195, 'Gloomhaven scenario 8 - tough but conquered'),
(2, 8, 10, '2024-04-20', 4, 62, 'Ticket to Ride - Europe map'),
(4, 2, NULL, '2024-04-15', 3, 88, 'Pandemic with Medic and Researcher - won!'),
(3, 7, 3, '2024-04-10', 4, 85, 'Longest road battle in Catan'),
(9, 4, NULL, '2024-04-05', 6, 42, 'Codenames Pictures version'),
(5, 1, 1, '2024-03-30', 3, 38, 'Azul perfect wall bonus achieved');

-- SQLINES DEMO *** ====================================
-- GA... SQLINES DEMO ***
-- SQLINES DEMO *** ====================================
INSERT INTO game_wish (board_game_id, user_id, note, want_level, wished_at) VALUES
(12, 3, 'Want to get the deluxe edition with upgraded components. Waiting for restock.', 'MUST_HAVE', '2024-09-15 14:30:00'),
(15, 4, 'Heard amazing things but need to commit to a group first. Maybe next year.', 'SOMEDAY', '2024-08-20 16:45:00'),
(14, 7, 'Love engine building games. Want to get this after I finish my current game backlog.', 'WANT_TO_PLAY', '2024-10-01 18:00:00'),
(13, 8, 'The miniatures look gorgeous! Would love the collectors edition.', 'NICE_TO_HAVE', '2024-09-10 20:15:00'),
(11, 9, 'Really want to try this classic worker placement game.', 'WANT_TO_PLAY', '2024-07-15 15:30:00'),
(1, 10, 'My family loves birds and I think this would be perfect for us!', 'MUST_HAVE', '2024-10-10 19:45:00'),
(6, 11, 'Need a game that plays well with 6+ players for our game nights.', 'WANT_TO_PLAY', '2024-08-05 17:00:00'),
(8, 4, 'Looking for a good quick-playing strategy game. This seems perfect.', 'NICE_TO_HAVE', '2024-09-20 14:00:00'),
(10, 7, 'Want to explore more deck-building games. Dominion is the original!', 'WANT_TO_PLAY', '2024-10-05 16:30:00'),
(7, 12, 'Perfect for introducing my kids to strategy games.', 'WANT_TO_PLAY', '2024-09-25 18:45:00'),
(2, 11, 'Don''t own this classic yet - need it for family gatherings.', 'MUST_HAVE', '2024-10-15 20:00:00'),
(9, 12, 'Party games are always welcome. This one seems like a hit.', 'NICE_TO_HAVE', '2024-08-30 15:15:00'),
(4, 9, 'Love cooperative games! This is high on my priority list.', 'MUST_HAVE', '2024-07-20 17:30:00'),
(5, 8, 'The production quality looks amazing. Want it for the aesthetic alone.', 'NICE_TO_HAVE', '2024-09-05 19:00:00'),
(3, 10, 'Classic that I somehow never owned. Need to fix that.', 'SOMEDAY', '2024-08-15 21:15:00');
