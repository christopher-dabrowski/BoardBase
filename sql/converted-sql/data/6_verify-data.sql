-- SQLINES DEMO *** each table
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
SELECT 'category' as table_name, COUNT(*) as row_count FROM category
UNION ALL SELECT 'mechanic', COUNT(*) FROM mechanic
UNION ALL SELECT 'publisher', COUNT(*) FROM publisher
UNION ALL SELECT 'award', COUNT(*) FROM award
UNION ALL SELECT 'app_user', COUNT(*) FROM app_user
UNION ALL SELECT 'board_game', COUNT(*) FROM board_game
UNION ALL SELECT 'location', COUNT(*) FROM location
UNION ALL SELECT 'game_release', COUNT(*) FROM game_release
UNION ALL SELECT 'price', COUNT(*) FROM price
UNION ALL SELECT 'rating', COUNT(*) FROM rating
UNION ALL SELECT 'review', COUNT(*) FROM review
UNION ALL SELECT 'play', COUNT(*) FROM play
UNION ALL SELECT 'game_wish', COUNT(*) FROM game_wish
UNION ALL SELECT 'board_game_category', COUNT(*) FROM board_game_category
UNION ALL SELECT 'board_game_mechanic', COUNT(*) FROM board_game_mechanic
UNION ALL SELECT 'user_game_release', COUNT(*) FROM user_game_release
UNION ALL SELECT 'play_participant', COUNT(*) FROM play_participant
UNION ALL SELECT 'award_board_game', COUNT(*) FROM award_board_game;

-- SQLINES DEMO *** ames
SELECT bg.name, cast(AVG(r.enjoyment) as numeric(3,1)) as avg_rating, COUNT(*) as rating_count
FROM board_game bg
JOIN rating r ON bg.board_game_id = r.board_game_id
GROUP BY bg.name
ORDER BY avg_rating DESC;

-- SQLINES DEMO ***  games
SELECT bg.name, COUNT(*) as play_count
FROM board_game bg
JOIN play p ON bg.board_game_id = p.board_game_id
GROUP BY bg.name
ORDER BY play_count DESC;

-- SQLINES DEMO *** tions
SELECT u.username, COUNT(*) as games_owned
FROM app_user u
JOIN user_game_release ugr ON u.user_id = ugr.user_id
GROUP BY u.username
ORDER BY games_owned DESC;
