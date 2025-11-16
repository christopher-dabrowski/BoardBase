CREATE TRIGGER main.trg_remove_from_wishlist_on_acquire
   ON  main.user_game_release
   AFTER INSERT
AS
BEGIN
    -- This ensures SQL Server doesn't return the "rows affected" message,
    -- which can interfere with some applications.
    SET NOCOUNT ON;

    -- Delete from game_wish by joining with the 'inserted' table
    -- (which contains all newly inserted rows) and the game_release table.
    DELETE gw
    FROM main.game_wish AS gw
    JOIN main.game_release AS gr
        ON gw.board_game_id = gr.board_game_id
    JOIN inserted AS i
        ON gr.game_release_id = i.game_release_id AND gw.user_id = i.user_id;

END;
GO

CREATE TRIGGER main.trg_update_player_count_on_participant_add
   ON  main.play_participant
   AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the player_count in the main.play table
    -- based on the newly inserted participants.
    -- This UPDATE statement joins to a subquery (pc) that calculates
    -- the *new total* participant count for all plays affected by the INSERT.
    UPDATE p
    SET
        p.player_count = pc.new_participant_count
    FROM
        main.play AS p
    JOIN (
        -- Subquery to find the new total participant count for each affected play.
        -- We only need to check plays that were part of this insert batch.
        SELECT
            pp.play_id,
            COUNT(*) AS new_participant_count
        FROM
            main.play_participant AS pp
        -- Join on *distinct* play_ids from the insert batch
        JOIN
            (SELECT DISTINCT play_id FROM inserted) AS i ON pp.play_id = i.play_id
        GROUP BY
            pp.play_id
    ) AS pc ON p.play_id = pc.play_id
    WHERE
        -- Only update if the new total count is greater than the old stored count
        -- (And the old count wasn't NULL, matching the original PG logic)
        p.player_count IS NOT NULL
        AND pc.new_participant_count > p.player_count;
END;
GO

CREATE TRIGGER main.trg_validate_player_count_on_play_update
   ON  main.play
   AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if any row in the entire updated batch
    -- violates the player count rule.
    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        LEFT JOIN (
            -- Subquery to get the current participant count for each play
            SELECT
                play_id,
                COUNT(*) AS participant_count
            FROM
                main.play_participant
            GROUP BY
                play_id
        ) AS pc ON i.play_id = pc.play_id
        WHERE
            -- Check the original trigger's conditions
            i.player_count IS NOT NULL
            -- Use ISNULL in case a play has 0 participants (pc.participant_count would be NULL)
            AND ISNULL(pc.participant_count, 0) > i.player_count
    )
    BEGIN
        -- As requested, throw a generic error and roll back the entire transaction.
        -- State 16 is a user-defined error level.
        RAISERROR ('Cannot set player_count to a value less than the current number of participants. The transaction has been rolled back.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;
GO
