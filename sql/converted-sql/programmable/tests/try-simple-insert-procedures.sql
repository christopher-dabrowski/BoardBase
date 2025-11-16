SET @role god;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
SELECT system_user, [session_user];

DO $$
DECLARE
    @new_user_id INTEGER;
BEGIN
    EXEC add_user 'test_user_123', 'testuser@example.com', 'password123', @new_user_id;
    RAISE NOTICE 'Created user: %', @new_user_id;
END $$;

SET @role casual_gamer;
SELECT system_user, [session_user];

DO $$
DECLARE
    @new_location_id INTEGER;
BEGIN
    EXEC add_location 'My Game Room', @new_location_id;
    RAISE NOTICE 'Created location: %', @new_location_id;
END $$;

DO $$
DECLARE
    @game_id INTEGER;
    new_rating_id INTEGER;
BEGIN
    SELECT TOP 1 @game_id = board_game_id
    FROM main.board_game
    WHERE name = 'Wingspan'
;

    EXEC add_rating @game_id, 8, new_rating_id;
    RAISE NOTICE 'Created rating: %', new_rating_id;
END $$;

WITH game AS (
    SELECT board_game_id
    FROM main.board_game
    WHERE name = 'Wingspan'
)
SELECT * FROM rating
WHERE board_game_id = (SELECT board_game_id FROM game)
  AND user_id = (SELECT user_id FROM main.app_user WHERE username = SYSTEM_USER);

DO $$
DECLARE
    @game_id INTEGER;
    new_review_id INTEGER;
BEGIN
    SELECT TOP 1 @game_id = board_game_id
    FROM main.board_game
    WHERE name = 'Wingspan'
;

    EXEC add_review @game_id, 'Great game!', new_review_id;
    RAISE NOTICE 'Created review: %', new_review_id;
END $$;

WITH game AS (
    SELECT board_game_id
    FROM main.board_game
    WHERE name = 'Wingspan'
)
SELECT * FROM main.review

DO $$
DECLARE
    @game_id INTEGER;
    new_game_wish_id INTEGER;
BEGIN
    SELECT TOP 1 @game_id = board_game_id
    FROM main.board_game
    WHERE name = 'Catan'
;

    EXEC add_game_wish @game_id, new_game_wish_id;
    RAISE NOTICE 'Created game wish: %', new_game_wish_id;
END $$;

WITH game AS (
    SELECT board_game_id
    FROM main.board_game
    WHERE name = 'Catan'
)
SELECT * FROM main.game_wish
WHERE board_game_id = (SELECT board_game_id FROM game)
  AND user_id = (SELECT user_id FROM main.app_user WHERE username = SYSTEM_USER);
