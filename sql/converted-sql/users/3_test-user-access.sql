-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
SELECT system_user, [session_user];

SET @role guest;
SELECT system_user, [session_user];

INSERT INTO board_game (name, description, designer, declared_minimal_player_count, declared_maximum_player_count, declared_minimal_age) VALUES
('Catan', 'Trade, build, and settle the island of Catan.', 'Klaus Teuber', 3, 4, 10);

SELECT * FROM board_game WHERE name = 'Catan';

SET @role casual_gamer;
SELECT system_user, [session_user];

INSERT INTO rating (user_id, board_game_id, enjoyment) VALUES
((SELECT user_id FROM app_user WHERE username = 'casual_gamer'),
 (SELECT board_game_id FROM board_game WHERE name = 'Catan'),
 8);

SET @role god;
SELECT system_user, [session_user];

DELETE FROM rating WHERE rating_id = 12;
