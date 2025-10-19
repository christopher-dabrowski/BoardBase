SELECT
    game_name,
    designer,
    min_players,
    max_players,
    SUBSTRING(categories, 1, 40) AS categories_preview,
    SUBSTRING(mechanics, 1, 40) AS mechanics_preview,
    average_enjoyment,
    total_ratings,
    total_plays
FROM main.game_catalog
ORDER BY total_ratings DESC NULLS LAST
LIMIT 5;

SELECT
    game_name,
    publisher_name,
    language,
    amount,
    currency,
    price_tier
FROM main.game_prices_current
ORDER BY amount
LIMIT 5;

SET ROLE casual_gamer;

SELECT
    username,
    game_name,
    publisher_name,
    language,
    current_price,
    currency,
    years_owned,
    times_played
FROM main.user_game_collection
ORDER BY acquired_at DESC
LIMIT 5;

SELECT
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
LIMIT 5;

SET ROLE god;

SELECT
    game_name,
    designer,
    categories_count,
    mechanics_count
FROM main.games_missing_metadata
LIMIT 5;
