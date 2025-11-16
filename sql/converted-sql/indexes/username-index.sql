-- ALTER TABLE app_user DROP CONSTRAINT app_user_username_key;

-- EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)
-- -- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
-- SELECT user_id, username, email, is_admin
-- FROM app_user
-- WHERE username = 'board_master_42';

-- CREATE INDEX IF NOT EXISTS idx_app_user_username
-- ON app_user USING dbo.btree (username);

-- CREATE INDEX idx_board_game_name ON main.board_game ([name]);

CREATE UNIQUE INDEX idx_app_user_username ON main.app_user (username);

-- EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)
-- SELECT user_id, username, email, is_admin
-- FROM app_user
-- WHERE username = 'board_master_42';

-- DROP INDEX IF EXISTS idx_app_user_username;

-- ALTER TABLE app_user ADD CONSTRAINT app_user_username_key UNIQUE (username);
