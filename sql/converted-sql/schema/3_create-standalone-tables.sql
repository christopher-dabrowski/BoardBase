
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE main.category (
    category_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(500),
    CONSTRAINT category_name_not_empty CHECK (TRIM(name) <> '')
);
GO

CREATE TABLE main.mechanic (
    mechanic_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(60) NOT NULL UNIQUE,
    description VARCHAR(500),
    CONSTRAINT mechanic_name_not_empty CHECK (TRIM(name) <> '')
);

CREATE TABLE main.publisher (
    publisher_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    website_url VARCHAR(100),
    description VARCHAR(1000),
    CONSTRAINT publisher_name_not_empty CHECK (TRIM(name) <> ''),
    CONSTRAINT publisher_website_url_format CHECK (
        website_url IS NOT NULL)
);

CREATE TABLE main.board_game (
    board_game_id INTEGER IDENTITY(1,1) PRIMARY KEY,
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

CREATE TABLE main.app_user (
    user_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(30) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARBINARY(max) NOT NULL,
    is_admin BIT DEFAULT 0 NOT NULL,
    CONSTRAINT user_username_not_empty CHECK (TRIM(username) <> ''),
    CONSTRAINT user_email_format CHECK (
        email LIKE '%_@__%.__%'
    )
);

CREATE TABLE main.award (
    award_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    awarding_body VARCHAR(100) NOT NULL,
    description VARCHAR(1000),
    awarded_date DATE,
    category VARCHAR(80),
    CONSTRAINT award_name_not_empty CHECK (TRIM(name) <> '')
);
