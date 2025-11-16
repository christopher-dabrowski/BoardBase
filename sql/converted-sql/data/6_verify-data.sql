-- SQLINES DEMO *** each table
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
SELECT 'category' as table_name, COUNT(*) as row_count FROM main.category
UNION ALL SELECT 'mechanic', COUNT(*) FROM main.mechanic
UNION ALL SELECT 'publisher', COUNT(*) FROM main.publisher
UNION ALL SELECT 'award', COUNT(*) FROM main.award
UNION ALL SELECT 'app_user', COUNT(*) FROM main.app_user
UNION ALL SELECT 'board_game', COUNT(*) FROM main.board_game
UNION ALL SELECT 'location', COUNT(*) FROM main.location
UNION ALL SELECT 'game_release', COUNT(*) FROM main.game_release
UNION ALL SELECT 'price', COUNT(*) FROM main.price
UNION ALL SELECT 'rating', COUNT(*) FROM main.rating
UNION ALL SELECT 'review', COUNT(*) FROM main.review
UNION ALL SELECT 'play', COUNT(*) FROM main.play
UNION ALL SELECT 'game_wish', COUNT(*) FROM main.game_wish
UNION ALL SELECT 'board_game_category', COUNT(*) FROM main.board_game_category
UNION ALL SELECT 'board_game_mechanic', COUNT(*) FROM main.board_game_mechanic
UNION ALL SELECT 'user_game_release', COUNT(*) FROM main.user_game_release
UNION ALL SELECT 'play_participant', COUNT(*) FROM main.play_participant
UNION ALL SELECT 'award_board_game', COUNT(*) FROM main.award_board_game;

-- SQLINES DEMO *** ames
SELECT bg.name, cast(AVG(r.enjoyment) as numeric(3,1)) as avg_rating, COUNT(*) as rating_count
FROM main.board_game bg
JOIN main.rating r ON bg.board_game_id = r.board_game_id
GROUP BY bg.name
ORDER BY avg_rating DESC;

-- SQLINES DEMO ***  games
SELECT bg.name, COUNT(*) as play_count
FROM main.board_game bg
JOIN play p ON bg.board_game_id = p.board_game_id
GROUP BY bg.name
ORDER BY play_count DESC;

-- SQLINES DEMO *** tions
SELECT u.username, COUNT(*) as games_owned
FROM main.app_user u
JOIN user_game_release ugr ON u.user_id = ugr.user_id
GROUP BY u.username
ORDER BY games_owned DESC;
