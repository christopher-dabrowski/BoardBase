CREATE OR REPLACE VIEW main.user_game_collection AS
SELECT
    u.user_id,
    u.username,
    bg.board_game_id,
    bg.name AS game_name,
    bg.designer,
    gr.game_release_id,
    p.name AS publisher_name,
    gr.language,
    gr.release_date,
    ugr.acquired_at,

    pr.amount AS current_price,
    pr.currency,

    EXTRACT(YEAR FROM AGE(CURRENT_DATE, ugr.acquired_at))::INTEGER AS years_owned,

    CASE WHEN r.rating_id IS NOT NULL THEN TRUE ELSE FALSE END AS has_rated,
    r.enjoyment AS user_rating,

    COUNT(DISTINCT pp.play_id) AS times_played

FROM main.app_user u
INNER JOIN main.user_game_release ugr ON u.user_id = ugr.user_id
INNER JOIN main.game_release gr ON ugr.game_release_id = gr.game_release_id
INNER JOIN main.board_game bg ON gr.board_game_id = bg.board_game_id
INNER JOIN main.publisher p ON gr.publisher_id = p.publisher_id
LEFT JOIN main.price pr ON gr.game_release_id = pr.game_release_id AND pr.end_date IS NULL
LEFT JOIN main.rating r ON bg.board_game_id = r.board_game_id AND u.user_id = r.user_id
LEFT JOIN main.play pl ON bg.board_game_id = pl.board_game_id
LEFT JOIN main.play_participant pp ON pl.play_id = pp.play_id AND pp.user_id = u.user_id
WHERE u.username = CURRENT_USER
GROUP BY u.user_id, u.username, bg.board_game_id, bg.name, bg.designer,
         gr.game_release_id, p.name, gr.language, gr.release_date, ugr.acquired_at,
         pr.amount, pr.currency, r.rating_id, r.enjoyment
ORDER BY ugr.acquired_at DESC;

COMMENT ON VIEW main.user_game_collection IS
'Shows user specific game collection';


CREATE OR REPLACE VIEW main.user_play_history AS
SELECT
    pl.play_id,
    pl.play_date,
    bg.board_game_id,
    bg.name AS game_name,
    l.name AS location_name,
    l.address AS location_address,
    pl.player_count,
    pl.duration_in_minutes,
    w.username AS winner_username,
    pl.note,

    STRING_AGG(DISTINCT u.username, ', ' ORDER BY u.username) AS participants,

    CASE
        WHEN pl.duration_in_minutes IS NOT NULL AND pl.duration_in_minutes < 60 THEN 'Quick'
        WHEN pl.duration_in_minutes >= 60 AND pl.duration_in_minutes < 120 THEN 'Standard'
        WHEN pl.duration_in_minutes >= 120 AND pl.duration_in_minutes < 180 THEN 'Long'
        WHEN pl.duration_in_minutes >= 180 THEN 'Epic'
        ELSE 'Unknown'
    END AS session_length_category,

    CURRENT_DATE - pl.play_date AS days_since_played
FROM main.play pl
INNER JOIN main.board_game bg ON pl.board_game_id = bg.board_game_id
LEFT JOIN main.location l ON pl.location_id = l.location_id
LEFT JOIN main.app_user w ON pl.winner_user_id = w.user_id
LEFT JOIN main.play_participant pp ON pl.play_id = pp.play_id
LEFT JOIN main.app_user u ON pp.user_id = u.user_id
WHERE u.username = CURRENT_USER
GROUP BY pl.play_id, pl.play_date, bg.board_game_id, bg.name, l.name, l.address,
         pl.player_count, pl.duration_in_minutes, w.username, pl.note
ORDER BY pl.play_date DESC;

COMMENT ON VIEW main.user_play_history IS
'Complete current user play session log';

GRANT SELECT ON main.user_game_collection TO players, admins;
GRANT SELECT ON main.user_play_history TO players, admins;
