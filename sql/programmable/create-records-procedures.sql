CREATE PROCEDURE add_user(
    username VARCHAR(30),
    email VARCHAR(100),
    password VARCHAR(100),
    OUT new_user_id INTEGER,
    is_admin BOOLEAN DEFAULT FALSE
)
LANGUAGE sql
AS $$
    INSERT INTO main.app_user (username, email, password_hash, is_admin)
    VALUES (TRIM(username), TRIM(email), md5(password)::bytea, is_admin)
    RETURNING user_id;
$$;

CREATE PROCEDURE add_location(
    name VARCHAR(100),
    OUT new_location_id INTEGER,
    address VARCHAR(200) DEFAULT NULL,
    description VARCHAR(500) DEFAULT NULL
)
LANGUAGE sql
AS $$
    WITH user_data AS (
        SELECT user_id
        FROM main.app_user
        WHERE username = CURRENT_USER
    )
    INSERT INTO main.location (name, address, description, owner_user_id)
    SELECT
        TRIM(name),
        TRIM(address),
        TRIM(description),
        user_id
    FROM user_data
    RETURNING location_id;
$$;

CREATE PROCEDURE add_rating(
    board_game_id INTEGER,
    enjoyment INTEGER,
    OUT new_rating_id INTEGER,
    minimal_player_count INTEGER DEFAULT NULL,
    maximum_player_count INTEGER DEFAULT NULL,
    best_player_count INTEGER DEFAULT NULL,
    minimal_age INTEGER DEFAULT NULL,
    complexity INTEGER DEFAULT NULL
)
LANGUAGE sql
AS $$
    WITH user_data AS (
        SELECT user_id
        FROM main.app_user
        WHERE username = CURRENT_USER
    )
    INSERT INTO main.rating (
        board_game_id,
        user_id,
        enjoyment,
        minimal_player_count,
        maximum_player_count,
        best_player_count,
        minimal_age,
        complexity
    )
    SELECT
        board_game_id,
        user_id,
        enjoyment,
        minimal_player_count,
        maximum_player_count,
        best_player_count,
        minimal_age,
        complexity
    FROM user_data
    RETURNING rating_id;
$$;

CREATE PROCEDURE add_review(
    board_game_id INTEGER,
    review_text VARCHAR(5000),
    OUT new_review_id INTEGER,
    hours_spent_playing INTEGER DEFAULT NULL
)
LANGUAGE sql
AS $$
    WITH user_data AS (
        SELECT user_id
        FROM main.app_user
        WHERE username = CURRENT_USER
    )
    INSERT INTO main.review (board_game_id, user_id, review_text, hours_spent_playing)
    SELECT
        board_game_id,
        user_id,
        TRIM(review_text),
        hours_spent_playing
    FROM user_data
    RETURNING review_id;
$$;

CREATE PROCEDURE add_game_wish(
    board_game_id INTEGER,
    OUT new_game_wish_id INTEGER,
    want_level main.want_level_enum DEFAULT 'WANT_TO_PLAY',
    note VARCHAR(500) DEFAULT NULL
)
LANGUAGE sql
AS $$
    WITH user_data AS (
        SELECT user_id
        FROM main.app_user
        WHERE username = CURRENT_USER
    )
    INSERT INTO main.game_wish (board_game_id, user_id, note, want_level)
    SELECT
        board_game_id,
        user_id,
        TRIM(note),
        want_level
    FROM user_data
    RETURNING game_wish_id;
$$;
