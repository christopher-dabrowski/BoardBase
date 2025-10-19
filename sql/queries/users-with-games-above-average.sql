SELECT
    u.username,
    COUNT(DISTINCT ugr.game_release_id) AS game_count,
    (
        SELECT ROUND(AVG(game_count), 2)
        FROM (
            SELECT COUNT(*) AS game_count
            FROM main.user_game_release
            GROUP BY user_id
        ) AS user_collections
    ) AS avg_games_per_user,
    COUNT(DISTINCT r.rating_id) AS ratings_given,
    COUNT(DISTINCT pp.play_id) AS sessions_played,
    MIN(ugr.acquired_at) AS first_game_acquired
FROM main.app_user u
INNER JOIN main.user_game_release ugr ON u.user_id = ugr.user_id
LEFT JOIN main.rating r ON u.user_id = r.user_id
LEFT JOIN main.play_participant pp ON u.user_id = pp.user_id
GROUP BY u.user_id, u.username, u.email
HAVING COUNT(DISTINCT ugr.game_release_id) > (
    SELECT AVG(game_count)
    FROM (
        SELECT COUNT(*) AS game_count
        FROM main.user_game_release
        GROUP BY user_id
    ) AS collections
)
ORDER BY game_count DESC;
