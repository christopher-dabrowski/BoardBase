-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE main.location (
    location_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    description VARCHAR(500),
    CONSTRAINT location_name_not_empty CHECK (TRIM(name) <> ''),
    owner_user_id INTEGER NOT NULL,
    CONSTRAINT fk_location_owner_user
      FOREIGN KEY (owner_user_id)
      REFERENCES main.app_user(user_id)
      ON DELETE CASCADE
);

CREATE TABLE main.game_release (
    game_release_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    board_game_id INTEGER NOT NULL,
    publisher_id INTEGER NOT NULL,
    release_date DATE,
    language VARCHAR(30) NOT NULL,
    CONSTRAINT game_release_language_not_empty CHECK (TRIM(language) <> ''),
    CONSTRAINT fk_game_release_board_game
        FOREIGN KEY (board_game_id)
        REFERENCES main.board_game(board_game_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_game_release_publisher
        FOREIGN KEY (publisher_id)
        REFERENCES main.publisher(publisher_id)
);

CREATE TABLE main.price (
    price_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    game_release_id INTEGER NOT NULL,
    amount NUMERIC(10, 2) NOT NULL,
    currency CHAR(3) NOT NULL,
    start_date DATE NOT NULL DEFAULT CONVERT(DATE, GETDATE()),
    end_date DATE,
    CONSTRAINT price_amount_positive CHECK (amount >= 0),
    CONSTRAINT price_date_range_valid CHECK (
        end_date IS NULL OR
        start_date <= end_date
    ),
    CONSTRAINT fk_price_game_release
        FOREIGN KEY (game_release_id)
        REFERENCES main.game_release(game_release_id)
        ON DELETE CASCADE
);

CREATE TABLE main.rating (
    rating_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    board_game_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    enjoyment INTEGER NOT NULL,
    minimal_player_count INTEGER,
    maximum_player_count INTEGER,
    best_player_count INTEGER,
    minimal_age INTEGER,
    complexity INTEGER,
    rated_at DATETIME2 DEFAULT GETDATE() NOT NULL,
    CONSTRAINT rating_enjoyment_range CHECK (enjoyment >= 1 AND enjoyment <= 10),
    CONSTRAINT rating_complexity_range CHECK (complexity IS NULL OR (complexity >= 1 AND complexity <= 5)),
    CONSTRAINT rating_player_count_valid CHECK (
        minimal_player_count IS NULL OR
        maximum_player_count IS NULL OR
        minimal_player_count <= maximum_player_count
    ),
    CONSTRAINT rating_min_players_positive CHECK (
        minimal_player_count IS NULL OR
        minimal_player_count > 0
    ),
    CONSTRAINT rating_best_players_positive CHECK (
        best_player_count IS NULL OR
        best_player_count > 0
    ),
    CONSTRAINT maximum_player_count_positive CHECK (
        maximum_player_count IS NULL OR
        maximum_player_count > 0
    ),
    CONSTRAINT rating_age_realistic CHECK (
        minimal_age IS NULL OR
        (minimal_age >= 0 AND minimal_age <= 99)
    ),
    CONSTRAINT rating_user_game_unique UNIQUE (user_id, board_game_id),
    CONSTRAINT fk_rating_board_game
        FOREIGN KEY (board_game_id)
        REFERENCES main.board_game(board_game_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_rating_user
        FOREIGN KEY (user_id)
        REFERENCES main.app_user(user_id)
);

CREATE TABLE main.review (
    review_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    board_game_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    review_text VARCHAR(5000) NOT NULL,
    hours_spent_playing INTEGER,
    reviewed_at DATETIME2 DEFAULT GETDATE() NOT NULL,
    CONSTRAINT review_text_not_empty CHECK (TRIM(review_text) <> ''),
    CONSTRAINT review_hours_non_negative CHECK (
        hours_spent_playing IS NULL OR
        hours_spent_playing >= 0
    ),
    CONSTRAINT fk_review_board_game
        FOREIGN KEY (board_game_id)
        REFERENCES main.board_game(board_game_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_review_user
        FOREIGN KEY (user_id)
        REFERENCES main.app_user(user_id)
        ON DELETE CASCADE
);

CREATE TABLE main.play (
    play_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    board_game_id INTEGER NOT NULL,
    location_id INTEGER,
    winner_user_id INTEGER,
    play_date DATE NOT NULL DEFAULT CONVERT(DATE, GETDATE()),
    player_count INTEGER,
    duration_in_minutes INTEGER,
    note VARCHAR(1000),
    CONSTRAINT play_player_count_positive CHECK (player_count IS NULL OR player_count > 0),
    CONSTRAINT play_duration_positive CHECK (
        duration_in_minutes IS NULL OR
        duration_in_minutes > 0
    ),
    CONSTRAINT fk_play_board_game
        FOREIGN KEY (board_game_id)
        REFERENCES main.board_game(board_game_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_play_location
        FOREIGN KEY (location_id)
        REFERENCES main.location(location_id)
        ON DELETE SET NULL,
    CONSTRAINT fk_play_winner
        FOREIGN KEY (winner_user_id)
        REFERENCES main.app_user(user_id)
);


CREATE TABLE main.game_wish (
    game_wish_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    board_game_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    note VARCHAR(500),
    want_level VARCHAR(20) NOT NULL,
    wished_at DATETIME2 DEFAULT GETDATE() NOT NULL,
    CONSTRAINT game_wish_user_game_unique UNIQUE (user_id, board_game_id),
    CONSTRAINT fk_game_wish_board_game
        FOREIGN KEY (board_game_id)
        REFERENCES main.board_game(board_game_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_game_wish_user
        FOREIGN KEY (user_id)
        REFERENCES main.app_user(user_id)
        ON DELETE CASCADE
);
