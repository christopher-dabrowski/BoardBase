DROP INDEX IF EXISTS idx_board_game_name;
DROP INDEX IF EXISTS idx_board_game_player_count;
DROP INDEX IF EXISTS idx_board_game_min_age;
DROP INDEX IF EXISTS idx_board_game_description;

CREATE INDEX IF NOT EXISTS idx_board_game_name
ON board_game USING btree (name);

CREATE INDEX IF NOT EXISTS idx_board_game_player_count
ON board_game USING btree (declared_minimal_player_count, declared_maximum_player_count);

CREATE INDEX IF NOT EXISTS idx_board_game_min_age
ON board_game USING btree (declared_minimal_age);

CREATE INDEX IF NOT EXISTS idx_board_game_description
ON board_game USING GIN (description);

EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)
SELECT board_game_id, name,
       declared_minimal_player_count,
       declared_maximum_player_count
FROM board_game
WHERE 4 BETWEEN declared_minimal_player_count AND declared_maximum_player_count;
-- Planning Time: 2.095 ms
-- Execution Time: 9.450 ms

-- Planning Time: 1.445 ms
-- Execution Time: 1.514 ms
