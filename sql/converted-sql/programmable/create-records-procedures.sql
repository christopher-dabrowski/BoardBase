CREATE PROCEDURE main.add_user
    @username VARCHAR(30),
    @email VARCHAR(100),
    @password VARCHAR(100),
    @new_user_id INTEGER OUTPUT,
    @is_admin BIT = 0
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO main.app_user (username, email, password_hash, is_admin)
    VALUES (TRIM(@username), TRIM(@email), HASHBYTES('MD5', @password), @is_admin);

    SET @new_user_id = SCOPE_IDENTITY();
END;
GO

---

CREATE PROCEDURE main.add_location
    @name VARCHAR(100),
    @new_location_id INTEGER OUTPUT,
    @address VARCHAR(200) = NULL,
    @description VARCHAR(500) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    WITH user_data AS (
        SELECT user_id
        FROM main.app_user
        WHERE username = USER_NAME()
    )
    INSERT INTO main.location (name, address, description, owner_user_id)
    SELECT
        TRIM(@name),
        TRIM(@address),
        TRIM(@description),
        user_id
    FROM user_data;

    SET @new_location_id = SCOPE_IDENTITY();
END;
GO

---

CREATE PROCEDURE main.add_rating
    @board_game_id INTEGER,
    @enjoyment INTEGER,
    @new_rating_id INTEGER OUTPUT,
    @minimal_player_count INTEGER = NULL,
    @maximum_player_count INTEGER = NULL,
    @best_player_count INTEGER = NULL,
    @minimal_age INTEGER = NULL,
    @complexity INTEGER = NULL
AS
BEGIN
    SET NOCOUNT ON;

    WITH user_data AS (
        SELECT user_id
        FROM main.app_user
        WHERE username = USER_NAME()
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
        @board_game_id,
        user_id,
        @enjoyment,
        @minimal_player_count,
        @maximum_player_count,
        @best_player_count,
        @minimal_age,
        @complexity
    FROM user_data;

    SET @new_rating_id = SCOPE_IDENTITY();
END;
GO

---

CREATE PROCEDURE main.add_review
    @board_game_id INTEGER,
    @review_text VARCHAR(5000),
    @new_review_id INTEGER OUTPUT,
    @hours_spent_playing INTEGER = NULL
AS
BEGIN
    SET NOCOUNT ON;

    WITH user_data AS (
        SELECT user_id
        FROM main.app_user
        WHERE username = USER_NAME()
    )
    INSERT INTO main.review (board_game_id, user_id, review_text, hours_spent_playing)
    SELECT
        @board_game_id,
        user_id,
        TRIM(@review_text),
        @hours_spent_playing
    FROM user_data;

    SET @new_review_id = SCOPE_IDENTITY();
END;
GO

---

CREATE PROCEDURE main.add_game_wish
    @board_game_id INTEGER,
    @new_game_wish_id INTEGER OUTPUT,
    @want_level VARCHAR(20) = 'WANT_TO_PLAY',
    @note VARCHAR(500) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    WITH user_data AS (
        SELECT user_id
        FROM main.app_user
        WHERE username = USER_NAME()
    )
    INSERT INTO main.game_wish (board_game_id, user_id, note, want_level)
    SELECT
        @board_game_id,
        user_id,
        TRIM(@note),
        @want_level
    FROM user_data;

    SET @new_game_wish_id = SCOPE_IDENTITY();
END;
GO
