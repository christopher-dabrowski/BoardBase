SELECT current_user, session_user;

CREATE EXTENSION IF NOT EXISTS pg_cron;

REFRESH MATERIALIZED VIEW main.game_popularity_stats;

SELECT cron.schedule(
    'refresh-game-stats-view',
    '0 3 * * *',
    $$REFRESH MATERIALIZED VIEW main.game_popularity_stats$$
);

SELECT *
FROM cron.job

