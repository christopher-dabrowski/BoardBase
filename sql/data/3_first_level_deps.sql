-- =====================================================
-- First-Level Dependent Tables
-- File: 03_first_level_dependencies.sql
-- =====================================================

-- Clear existing data (if any)
TRUNCATE TABLE location CASCADE;
ALTER SEQUENCE location_location_id_seq RESTART WITH 1;
TRUNCATE TABLE game_release CASCADE;
ALTER SEQUENCE game_release_game_release_id_seq RESTART WITH 1;

-- =====================================================
-- LOCATION
-- =====================================================
INSERT INTO location (name, address, description, owner_user_id) VALUES
('Home - Living Room', '123 Maple Street, Springfield', 'My main gaming space with a large table and comfortable seating', 1),
('Board Game Cafe "Dice Tower"', '456 Oak Avenue, Downtown', 'Local board game cafe with extensive library and great coffee', 1),
('Chris Gaming Den', '789 Pine Road, Suburbia', 'Dedicated game room in the basement with custom gaming table', 7),
('Community Center Hall', '321 Elm Street, City Center', 'Public space available for game nights and tournaments', 2),
('Game Store Back Room', '654 Cedar Lane, Shopping District', 'Private gaming area at our local game store', 3),
('Anna''s Apartment', '987 Birch Boulevard, Uptown', 'Cozy apartment perfect for 4-6 player games', 6),
('The Meeple Mansion', '147 Walnut Way, Riverside', 'Large house with multiple game tables and full collection display', 5),
('Family Game Night Corner', '258 Cherry Circle, Greenfield', 'Family-friendly space with kids games and snacks', 10),
('Strategy Bunker', '369 Ash Avenue, Hillside', 'Serious gaming space for heavy Euro games and long sessions', 2),
('Casual Corner Cafe', '741 Spruce Street, Lakeside', 'Relaxed cafe setting for lighter party games', 8);

-- =====================================================
-- GAME_RELEASE
-- =====================================================
INSERT INTO game_release (board_game_id, publisher_id, release_date, language) VALUES
-- Wingspan releases
(1, 1, '2019-01-25', 'English'),
(1, 1, '2019-03-15', 'German'),
(1, 1, '2019-06-10', 'Polish'),

-- Ticket to Ride releases
(2, 2, '2004-10-02', 'English'),
(2, 2, '2005-03-20', 'German'),
(2, 2, '2006-05-15', 'French'),
(2, 2, '2012-09-01', 'Polish'),

-- Catan releases
(3, 5, '1995-09-01', 'German'),
(3, 5, '1996-03-15', 'English'),
(3, 5, '2010-08-20', 'Polish'),

-- Pandemic releases
(4, 6, '2008-01-01', 'English'),
(4, 6, '2013-05-10', 'Polish'),
(4, 6, '2009-03-15', 'German'),

-- Azul releases
(5, 1, '2017-10-01', 'English'),
(5, 1, '2017-10-01', 'German'),

-- 7 Wonders releases
(6, 1, '2010-12-01', 'English'),
(6, 1, '2011-02-15', 'German'),
(6, 1, '2012-06-20', 'Polish'),

-- Carcassonne releases
(7, 6, '2000-01-01', 'German'),
(7, 6, '2001-06-15', 'English'),
(7, 6, '2008-09-10', 'Polish'),

-- Splendor releases
(8, 1, '2014-04-01', 'English'),
(8, 1, '2014-08-15', 'German'),
(8, 1, '2015-03-20', 'Polish'),

-- Codenames releases
(9, 3, '2015-08-01', 'English'),
(9, 3, '2015-10-15', 'German'),
(9, 3, '2016-03-01', 'Polish'),

-- Dominion releases
(10, 6, '2008-10-10', 'English'),
(10, 6, '2009-02-20', 'German'),

-- Agricola releases
(11, 1, '2007-10-01', 'German'),
(11, 1, '2008-09-15', 'English'),

-- Brass: Birmingham releases
(12, 1, '2018-07-01', 'English'),

-- Scythe releases
(13, 1, '2016-08-03', 'English'),
(13, 1, '2017-03-10', 'German'),

-- Terraforming Mars releases
(14, 1, '2016-10-01', 'English'),
(14, 1, '2017-05-15', 'German'),

-- Gloomhaven releases
(15, 4, '2017-07-01', 'English');
