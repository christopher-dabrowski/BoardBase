
CREATE TABLE IF NOT EXISTS category (
    category_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(500),
    CONSTRAINT category_name_not_empty CHECK (TRIM(name) <> '')
);
COMMENT ON TABLE category IS 'Dictionary of board game categories';

CREATE TABLE IF NOT EXISTS mechanic (
    mechanic_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(60) NOT NULL UNIQUE,
    description VARCHAR(500),
    CONSTRAINT mechanic_name_not_empty CHECK (TRIM(name) <> '')
);
COMMENT ON TABLE mechanic IS 'Dictionary of game mechanics';

CREATE TABLE IF NOT EXISTS publisher (
    publisher_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    website_url VARCHAR(100),
    description VARCHAR(1000),
    CONSTRAINT publisher_name_not_empty CHECK (TRIM(name) <> ''),
    CONSTRAINT publisher_website_url_format CHECK (
        website_url IS NULL OR
        website_url ~* '^https?://.+'
    )
);
COMMENT ON TABLE publisher IS 'Publishers who release board games';

CREATE TABLE IF NOT EXISTS board_game (
    board_game_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(1000),
    designer VARCHAR(50),
    declared_minimal_player_count INTEGER,
    declared_maximum_player_count INTEGER,
    declared_minimal_age INTEGER,
    CONSTRAINT board_game_name_not_empty CHECK (TRIM(name) <> ''),
    CONSTRAINT board_game_player_count_valid CHECK (
        declared_minimal_player_count IS NULL OR
        declared_maximum_player_count IS NULL OR
        declared_minimal_player_count <= declared_maximum_player_count
    ),
    CONSTRAINT board_game_min_players_positive CHECK (
        declared_minimal_player_count IS NULL OR
        declared_minimal_player_count > 0
    ),
    CONSTRAINT board_game_age_realistic CHECK (
        declared_minimal_age IS NULL OR
        (declared_minimal_age >= 0 AND declared_minimal_age <= 99)
    )
);
COMMENT ON TABLE board_game IS 'General information about board game';

CREATE TABLE IF NOT EXISTS app_user (
    user_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username VARCHAR(30) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash BYTEA NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE NOT NULL,
    CONSTRAINT user_username_not_empty CHECK (TRIM(username) <> ''),
    CONSTRAINT user_email_format CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')
);

CREATE TABLE IF NOT EXISTS award (
    award_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    awarding_body VARCHAR(100) NOT NULL,
    description VARCHAR(1000),
    awarded_date DATE,
    category VARCHAR(80),
    CONSTRAINT award_name_not_empty CHECK (TRIM(name) <> '')
);
COMMENT ON TABLE award IS 'Awards that board games can receive (e.g., Spiel des Jahres)';
