CREATE PROCEDURE merge_user_accounts(
    source_user_id INTEGER,
    target_user_id INTEGER
)
LANGUAGE plpgsql
AS $$
DECLARE
    source_exists BOOLEAN;
    target_exists BOOLEAN;
    source_username VARCHAR(30);
    target_username VARCHAR(30);
BEGIN
    IF source_user_id = target_user_id THEN
        RAISE EXCEPTION 'Cannot merge user account with itself. Source and target user IDs must be different.';
    END IF;

    SELECT EXISTS(SELECT 1 FROM main.app_user WHERE user_id = source_user_id)
    INTO source_exists;

    IF NOT source_exists THEN
        RAISE EXCEPTION 'Source user with ID % does not exist.', source_user_id;
    END IF;

    SELECT EXISTS(SELECT 1 FROM main.app_user WHERE user_id = target_user_id)
    INTO target_exists;

    IF NOT target_exists THEN
        RAISE EXCEPTION 'Target user with ID % does not exist.', target_user_id;
    END IF;

    SELECT username INTO source_username FROM main.app_user WHERE user_id = source_user_id;
    SELECT username INTO target_username FROM main.app_user WHERE user_id = target_user_id;

    RAISE NOTICE 'Starting merge: % (ID: %) → % (ID: %)',
                 source_username, source_user_id, target_username, target_user_id;

    BEGIN
        DELETE FROM main.rating
        WHERE user_id = source_user_id
          AND board_game_id IN (
              SELECT board_game_id
              FROM main.rating
              WHERE user_id = target_user_id
          );

        RAISE NOTICE 'Deleted conflicting ratings where target user already has ratings';

        UPDATE main.rating
        SET user_id = target_user_id
        WHERE user_id = source_user_id;

        RAISE NOTICE 'Migrated ratings from source to target user';

        UPDATE main.review
        SET user_id = target_user_id
        WHERE user_id = source_user_id;

        RAISE NOTICE 'Migrated reviews from source to target user';

        DELETE FROM main.game_wish
        WHERE user_id = source_user_id
          AND board_game_id IN (
              SELECT board_game_id
              FROM main.game_wish
              WHERE user_id = target_user_id
          );

        RAISE NOTICE 'Deleted conflicting game wishes where target user already has wishes';

        UPDATE main.game_wish
        SET user_id = target_user_id
        WHERE user_id = source_user_id;

        RAISE NOTICE 'Migrated game wishes from source to target user';

        UPDATE main.user_game_release target
        SET acquired_at = source.acquired_at
        FROM main.user_game_release source
        WHERE target.user_id = target_user_id
          AND source.user_id = source_user_id
          AND target.game_release_id = source.game_release_id
          AND source.acquired_at < target.acquired_at;

        RAISE NOTICE 'Updated acquired dates where source user acquired games earlier';

        DELETE FROM main.user_game_release
        WHERE user_id = source_user_id
          AND game_release_id IN (
              SELECT game_release_id
              FROM main.user_game_release
              WHERE user_id = target_user_id
          );

        RAISE NOTICE 'Deleted conflicting game releases from source collection';

        UPDATE main.user_game_release
        SET user_id = target_user_id
        WHERE user_id = source_user_id;

        RAISE NOTICE 'Migrated unique game releases to target user collection';

        UPDATE main.location
        SET owner_user_id = target_user_id
        WHERE owner_user_id = source_user_id;

        RAISE NOTICE 'Transferred location ownership from source to target user';

        UPDATE main.play
        SET winner_user_id = target_user_id
        WHERE winner_user_id = source_user_id;

        RAISE NOTICE 'Updated play sessions where source user was winner';

        DELETE FROM main.play_participant
        WHERE user_id = source_user_id
          AND play_id IN (
              SELECT play_id
              FROM main.play_participant
              WHERE user_id = target_user_id
          );

        RAISE NOTICE 'Deleted conflicting play participations where target user already participated';

        UPDATE main.play_participant
        SET user_id = target_user_id
        WHERE user_id = source_user_id;

        RAISE NOTICE 'Migrated play participations from source to target user';

        DELETE FROM main.app_user
        WHERE user_id = source_user_id;

        RAISE NOTICE 'Deleted source user account: % (ID: %)', source_username, source_user_id;

        RAISE NOTICE 'Successfully merged user % into user %', source_username, target_username;
    END;
END;
$$;
