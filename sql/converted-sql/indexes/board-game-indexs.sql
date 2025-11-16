-- DROP INDEX idx_board_game_name ON main.board_game;
-- DROP INDEX idx_board_game_player_count ON main.board_game;
-- DROP INDEX idx_board_game_min_age ON main.board_game;
-- DROP INDEX idx_board_game_description ON main.board_game;
CREATE INDEX idx_board_game_name ON main.board_game ([name]);
CREATE NONCLUSTERED INDEX idx_board_game_player_count ON main.board_game (
  declared_minimal_player_count,
  declared_maximum_player_count
);
CREATE NONCLUSTERED INDEX idx_board_game_min_age ON main.board_game (declared_minimal_age);
CREATE NONCLUSTERED INDEX idx_board_game_description ON main.board_game (description);

GO
SELECT board_game_id,
  name,
  declared_minimal_player_count,
  declared_maximum_player_count
FROM main.board_game
WHERE 4 BETWEEN declared_minimal_player_count AND declared_maximum_player_count;
GO
SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO
