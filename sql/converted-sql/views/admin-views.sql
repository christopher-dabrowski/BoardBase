-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE OR ALTER VIEW main.games_missing_metadata AS
SELECT
    bg.board_game_id,
    bg.name AS game_name,
    bg.designer,
    COUNT(DISTINCT bgc.category_id) AS categories_count,
    COUNT(DISTINCT bgm.mechanic_id) AS mechanics_count
FROM main.board_game bg
LEFT JOIN main.board_game_category bgc ON bg.board_game_id = bgc.board_game_id
LEFT JOIN main.board_game_mechanic bgm ON bg.board_game_id = bgm.board_game_id
GROUP BY bg.board_game_id, bg.name, bg.designer
HAVING COUNT(DISTINCT bgc.category_id) = 0 OR COUNT(DISTINCT bgm.mechanic_id) = 0
ORDER BY categories_count, mechanics_count;

'Shows board games without categories or mechanics', 'user', main, 'view', games_missing_metadata;

GRANT SELECT ON main.games_missing_metadata TO admins;
REVOKE SELECT ON main.games_missing_metadata FROM guests, players;
