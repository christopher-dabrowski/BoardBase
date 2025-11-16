DROP INDEX IF EXISTS idx_board_game_name;
DROP INDEX IF EXISTS idx_board_game_player_count;
DROP INDEX IF EXISTS idx_board_game_min_age;
DROP INDEX IF EXISTS idx_board_game_description;

-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE INDEX IF NOT EXISTS idx_board_game_name
ON board_game USING dbo.btree (name);

CREATE INDEX IF NOT EXISTS idx_board_game_player_count
ON board_game USING dbo.btree (declared_minimal_player_count, declared_maximum_player_count);

CREATE INDEX IF NOT EXISTS idx_board_game_min_age
ON board_game USING dbo.btree (declared_minimal_age);

CREATE INDEX IF NOT EXISTS idx_board_game_description
ON board_game USING dbo.GIN (description);

EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)
SELECT board_game_id, name,
       declared_minimal_player_count,
       declared_maximum_player_count
FROM board_game
WHERE 4 BETWEEN declared_minimal_player_count AND declared_maximum_player_count;
-- SQLINES DEMO *** 095 ms
-- SQLINES DEMO *** .450 ms

-- SQLINES DEMO *** 445 ms
-- SQLINES DEMO *** .514 ms
