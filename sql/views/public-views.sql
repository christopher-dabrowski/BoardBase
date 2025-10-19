CREATE OR REPLACE VIEW main.game_catalog AS
SELECT
    bg.board_game_id,
    bg.name AS game_name,
    bg.designer,
    bg.description,
    bg.declared_minimal_player_count AS min_players,
    bg.declared_maximum_player_count AS max_players,
    bg.declared_minimal_age AS min_age,

    STRING_AGG(DISTINCT c.name, ', ' ORDER BY c.name) AS categories,
    STRING_AGG(DISTINCT m.name, ', ' ORDER BY m.name) AS mechanics,

    ROUND(AVG(r.enjoyment), 2) AS average_enjoyment,
    ROUND(AVG(r.complexity), 2) AS average_complexity,
    COUNT(DISTINCT r.rating_id) AS total_ratings,

    COUNT(DISTINCT pl.play_id) AS total_plays,
    ROUND(AVG(pl.duration_in_minutes), 0) AS average_duration_minutes

FROM main.board_game bg
LEFT JOIN main.board_game_category bgc ON bg.board_game_id = bgc.board_game_id
LEFT JOIN main.category c ON bgc.category_id = c.category_id
LEFT JOIN main.board_game_mechanic bgm ON bg.board_game_id = bgm.board_game_id
LEFT JOIN main.mechanic m ON bgm.mechanic_id = m.mechanic_id
LEFT JOIN main.game_release gr ON bg.board_game_id = gr.board_game_id
LEFT JOIN main.publisher p ON gr.publisher_id = p.publisher_id
LEFT JOIN main.rating r ON bg.board_game_id = r.board_game_id
LEFT JOIN main.play pl ON bg.board_game_id = pl.board_game_id
GROUP BY bg.board_game_id, bg.name, bg.designer, bg.description,
         bg.declared_minimal_player_count, bg.declared_maximum_player_count,
         bg.declared_minimal_age;

COMMENT ON VIEW main.game_catalog IS
'Main game catalog';

CREATE OR REPLACE VIEW main.game_prices_current AS
SELECT
    bg.board_game_id,
    bg.name AS game_name,
    gr.game_release_id,
    p.name AS publisher_name,
    gr.language,
    gr.release_date,
    pr.price_id,
    pr.amount,
    pr.currency,
    pr.start_date AS price_start_date,

    CASE
        WHEN pr.amount < 30 THEN 'Budget'
        WHEN pr.amount < 60 THEN 'Standard'
        WHEN pr.amount < 100 THEN 'Premium'
        ELSE 'Luxury'
    END AS price_tier

FROM main.board_game bg
INNER JOIN main.game_release gr ON bg.board_game_id = gr.board_game_id
INNER JOIN main.publisher p ON gr.publisher_id = p.publisher_id
INNER JOIN main.price pr ON gr.game_release_id = pr.game_release_id
WHERE pr.end_date IS NULL  -- Only current prices
ORDER BY bg.name, pr.amount;

COMMENT ON VIEW main.game_prices_current IS
'Current market prices for all game releases';

GRANT SELECT ON main.game_catalog TO guests, players, admins;
GRANT SELECT ON main.game_prices_current TO guests, players, admins;
