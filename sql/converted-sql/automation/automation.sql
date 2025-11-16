-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
SELECT system_user, [session_user];


REFRESH MATERIALIZED VIEW main.game_popularity_stats;

SELECT cron.schedule(
    'refresh-game-stats-view',
    '0 3 * * *',
    $$REFRESH MATERIALIZED VIEW main.game_popularity_stats$$
);

SELECT *
FROM cron.job

SELECT * FROM main.game_popularity_stats;
