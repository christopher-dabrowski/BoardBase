-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE OR ALTER VIEW main.game_catalog AS
WITH Categories_Agg AS (
    -- First, aggregate categories in their own scope
    SELECT
        bgc.board_game_id,
        STRING_AGG(c.name, ', ') WITHIN GROUP (ORDER BY c.name) AS categories
    FROM main.board_game_category bgc
    LEFT JOIN main.category c ON bgc.category_id = c.category_id
    GROUP BY bgc.board_game_id
),
Mechanics_Agg AS (
    -- Second, aggregate mechanics in their own scope
    SELECT
        bgm.board_game_id,
        STRING_AGG(m.name, ', ') WITHIN GROUP (ORDER BY m.name) AS mechanics
    FROM main.board_game_mechanic bgm
    LEFT JOIN main.mechanic m ON bgm.mechanic_id = m.mechanic_id
    GROUP BY bgm.board_game_id
)
-- Main query now joins to the pre-aggregated CTEs
SELECT
    bg.board_game_id,
    bg.name AS game_name,
    bg.designer,
    bg.description,
    bg.declared_minimal_player_count AS min_players,
    bg.declared_maximum_player_count AS max_players,
    bg.declared_minimal_age AS min_age,

    -- Use the pre-aggregated columns from the CTEs
    ca.categories,
    ma.mechanics,

    -- The rest of the aggregates are fine
    ROUND(AVG(CAST(r.enjoyment AS DECIMAL(10, 2))), 2) AS average_enjoyment,
    ROUND(AVG(CAST(r.complexity AS DECIMAL(10, 2))), 2) AS average_complexity,
    COUNT(DISTINCT r.rating_id) AS total_ratings,

    COUNT(DISTINCT pl.play_id) AS total_plays,
    ROUND(AVG(CAST(pl.duration_in_minutes AS DECIMAL(10, 2))), 0) AS average_duration_minutes

FROM main.board_game bg
-- Join to the CTEs instead of the original junction/entity tables
LEFT JOIN Categories_Agg ca ON bg.board_game_id = ca.board_game_id
LEFT JOIN Mechanics_Agg ma ON bg.board_game_id = ma.board_game_id
-- These joins remain for the other aggregates
LEFT JOIN main.game_release gr ON bg.board_game_id = gr.board_game_id
LEFT JOIN main.publisher p ON gr.publisher_id = p.publisher_id
LEFT JOIN main.rating r ON bg.board_game_id = r.board_game_id
LEFT JOIN main.play pl ON bg.board_game_id = pl.board_game_id
GROUP BY
    bg.board_game_id, bg.name, bg.designer, bg.description,
    bg.declared_minimal_player_count, bg.declared_maximum_player_count,
    bg.declared_minimal_age,
    -- Add the pre-aggregated columns to the GROUP BY
    ca.categories,
    ma.mechanics;
GO

CREATE OR ALTER VIEW main.game_prices_current AS
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
WHERE pr.end_date IS NULL  -- On... SQLINES DEMO ***
ORDER BY bg.name, pr.amount;

-- GRANT SELECT ON main.game_catalog TO guests, players, admins;
-- GRANT SELECT ON main.game_prices_current TO guests, players, admins;
