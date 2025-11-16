-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE FUNCTION remove_from_wishlist_on_acquire()
RETURNS TRIGGER
AS
BEGIN
    DELETE FROM main.game_wish
    WHERE user_id = NEW.user_id
      AND board_game_id = (
          SELECT board_game_id
          FROM main.game_release
          WHERE game_release_id = NEW.game_release_id
      );

    RETURN NEW;
END;
$$

CREATE TRIGGER trg_remove_from_wishlist_on_acquire ON main.user_game_release
    AFTER INSERT
  AS
    EXECUTE FUNCTION dbo.remove_from_wishlist_on_acquire();

CREATE FUNCTION update_player_count_on_participant_add()
RETURNS TRIGGER
AS
BEGIN
    DECLARE @current_player_count INTEGER;
    DECLARE @new_participant_count INTEGER;
 
    SELECT @current_player_count = player_count
    FROM main.play
    WHERE play_id = NEW.play_id;

    SELECT @new_participant_count = COUNT(*) + 1
    FROM main.play_participant
    WHERE play_id = NEW.play_id;

    IF @current_player_count IS NOT NULL AND @new_participant_count > @current_player_count BEGIN
        UPDATE main.play
        SET player_count = @new_participant_count
        WHERE play_id = NEW.play_id;

        RAISE NOTICE 'The calculated player count % is grater than declared count %. Updating player_count for play session % to %',
                    @new_participant_count,
                    @current_player_count,
                    NEW.play_id,
                    @new_participant_count;
    END 

    RETURN NEW;
END;
$$

CREATE TRIGGER trg_update_player_count_on_participant_add ON main.play_participant
    INSTEAD OF INSERT
  AS
    EXECUTE FUNCTION dbo.update_player_count_on_participant_add();

CREATE FUNCTION validate_player_count_on_play_update()
RETURNS TRIGGER
AS
BEGIN
    DECLARE @participant_count INTEGER;
 
    IF NEW.player_count IS NOT NULL BEGIN
        SELECT @participant_count = COUNT(*)
        FROM main.play_participant
        WHERE play_id = NEW.play_id;

        IF @participant_count > NEW.player_count BEGIN
            RAISE EXCEPTION 'Cannot set player_count to % for play session %. Current participant count is %',
                            NEW.player_count, NEW.play_id, @participant_count;
        END 
    END 

    RETURN NEW;
END;
$$

CREATE TRIGGER trg_validate_player_count_on_play_update ON main.play
    INSTEAD OF UPDATE
  AS
    EXECUTE FUNCTION dbo.validate_player_count_on_play_update();

