
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE board_game_category (
    board_game_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (board_game_id, category_id),
    CONSTRAINT fk_board_game_category_game
        FOREIGN KEY (board_game_id)
        REFERENCES board_game(board_game_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_board_game_category_category
        FOREIGN KEY (category_id)
        REFERENCES category(category_id)
        ON DELETE CASCADE
);
EXECUTE sp_addextendedproperty 'MS_Description', 'Board game can belong to multiple categories', 'user', user_name(), 'table', board_game_category;

CREATE TABLE board_game_mechanic (
    board_game_id INTEGER NOT NULL,
    mechanic_id INTEGER NOT NULL,
    PRIMARY KEY (board_game_id, mechanic_id),
    CONSTRAINT fk_board_game_mechanic_game
        FOREIGN KEY (board_game_id)
        REFERENCES board_game(board_game_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_board_game_mechanic_mechanic
        FOREIGN KEY (mechanic_id)
        REFERENCES mechanic(mechanic_id)
        ON DELETE CASCADE
);
EXECUTE sp_addextendedproperty 'MS_Description', 'Board game can use multiple mechanics', 'user', user_name(), 'table', board_game_mechanic;

CREATE TABLE user_game_release (
    user_id INTEGER NOT NULL,
    game_release_id INTEGER NOT NULL,
    acquired_at DATETIME2 DEFAULT GETDATE() NOT NULL,
    PRIMARY KEY (user_id, game_release_id),
    CONSTRAINT fk_user_game_release_user
        FOREIGN KEY (user_id)
        REFERENCES app_user(user_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_user_game_release_game
        FOREIGN KEY (game_release_id)
        REFERENCES game_release(game_release_id)
        ON DELETE CASCADE
);
EXECUTE sp_addextendedproperty 'MS_Description', 'Users can onw game releases', 'user', user_name(), 'table', user_game_release;

CREATE TABLE play_participant (
    play_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    PRIMARY KEY (play_id, user_id),
    CONSTRAINT fk_play_participant_play
        FOREIGN KEY (play_id)
        REFERENCES play(play_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_play_participant_user
        FOREIGN KEY (user_id)
        REFERENCES app_user(user_id)
        ON DELETE CASCADE
);
EXECUTE sp_addextendedproperty 'MS_Description', 'Track which users participated in play sessions', 'user', user_name(), 'table', play_participant;

CREATE TABLE award_board_game (
    award_id INTEGER NOT NULL,
    board_game_id INTEGER NOT NULL,
    received_place INTEGER,
    PRIMARY KEY (award_id, board_game_id),
    CONSTRAINT fk_award_board_game_award
        FOREIGN KEY (award_id)
        REFERENCES award(award_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_award_board_game_game
        FOREIGN KEY (board_game_id)
        REFERENCES board_game(board_game_id)
        ON DELETE CASCADE
);
EXECUTE sp_addextendedproperty 'MS_Description', 'Table linking awards to the board games that received them', 'user', user_name(), 'table', award_board_game;
