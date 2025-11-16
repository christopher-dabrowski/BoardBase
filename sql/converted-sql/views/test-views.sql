-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
SELECT *
FROM main.game_catalog
ORDER BY total_ratings DESC
;

SELECT TOP 5
    game_name,
    publisher_name,
    language,
    amount,
    currency,
    price_tier
FROM main.game_prices_current
ORDER BY amount
;

SET @ROLE casual_gamer;

SELECT
    game_name,
    publisher_name,
    language,
    current_price,
    currency,
    years_owned,
    times_played
FROM main.user_game_collection;

SELECT TOP 5
    play_date,
    game_name,
    location_name,
    player_count,
    duration_in_minutes,
    winner_username,
    SUBSTRING(participants, 1, 50) AS participants_preview,
    session_length_category
FROM main.user_play_history
ORDER BY play_date DESC
;

SET @ROLE god;

SELECT
    game_name,
    designer,
    categories_count,
    mechanics_count
FROM main.games_missing_metadata
LIMIT 5;
