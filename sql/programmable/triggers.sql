CREATE FUNCTION remove_from_wishlist_on_acquire()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
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
$$;

CREATE TRIGGER trg_remove_from_wishlist_on_acquire
    AFTER INSERT ON main.user_game_release
    FOR EACH ROW
    EXECUTE FUNCTION remove_from_wishlist_on_acquire();

CREATE FUNCTION update_player_count_on_participant_add()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    current_player_count INTEGER;
    new_participant_count INTEGER;
BEGIN
    SELECT player_count INTO current_player_count
    FROM main.play
    WHERE play_id = NEW.play_id;

    SELECT COUNT(*) + 1 INTO new_participant_count
    FROM main.play_participant
    WHERE play_id = NEW.play_id;

    IF current_player_count IS NOT NULL AND new_participant_count > current_player_count THEN
        UPDATE main.play
        SET player_count = new_participant_count
        WHERE play_id = NEW.play_id;

        RAISE NOTICE 'The calculated player count % is grater than declared count %. Updating player_count for play session % to %',
                    new_participant_count,
                    current_player_count,
                    NEW.play_id,
                    new_participant_count;
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_update_player_count_on_participant_add
    BEFORE INSERT ON main.play_participant
    FOR EACH ROW
    EXECUTE FUNCTION update_player_count_on_participant_add();

CREATE FUNCTION validate_player_count_on_play_update()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    participant_count INTEGER;
BEGIN
    IF NEW.player_count IS NOT NULL THEN
        SELECT COUNT(*) INTO participant_count
        FROM main.play_participant
        WHERE play_id = NEW.play_id;

        IF participant_count > NEW.player_count THEN
            RAISE EXCEPTION 'Cannot set player_count to % for play session %. Current participant count is %',
                            NEW.player_count, NEW.play_id, participant_count;
        END IF;
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_validate_player_count_on_play_update
    BEFORE UPDATE ON main.play
    FOR EACH ROW
    EXECUTE FUNCTION validate_player_count_on_play_update();

