SELECT user_id, username FROM main.app_user WHERE username = 'casual_gamer';
SELECT TOP 1 board_game_id, name FROM main.board_game WHERE name = 'Catan';

SELECT bg.name
FROM game_wish gw
JOIN main.app_user u ON gw.user_id = u.user_id
JOIN main.board_game bg ON gw.board_game_id = bg.board_game_id
WHERE u.username = 'casual_gamer'

SELECT * FROM board_game;

EXECUTE AS USER = 'casual_gamer';


EXEC add_game_wish 4, NULL;

REVERT;
SELECT CURRENT_USER;

SELECT u.username, bg.name, gw.wished_at FROM main.game_wish gw
JOIN main.app_user u ON gw.user_id = u.user_id
JOIN main.board_game bg ON gw.board_game_id = bg.board_game_id
WHERE u.username = 'casual_gamer';

INSERT INTO main.user_game_release (user_id, game_release_id, acquired_at)
SELECT TOP 1 u.user_id, gr.game_release_id, CONVERT(DATE, GETDATE())
FROM main.app_user u, main.game_release gr
JOIN main.board_game bg ON gr.board_game_id = bg.board_game_id
WHERE u.username = 'casual_gamer' AND bg.name = 'Pandemic'
;

SELECT *
FROM main.user_game_release ugr
JOIN main.app_user u ON ugr.user_id = u.user_id
JOIN main.game_release gr ON ugr.game_release_id = gr.game_release_id
JOIN main.board_game bg ON gr.board_game_id = bg.board_game_id
WHERE u.username = 'casual_gamer' AND bg.name = 'Pandemic';

SELECT u.username, bg.name, gw.wished_at FROM main.game_wish gw
JOIN main.app_user u ON gw.user_id = u.user_id
JOIN main.board_game bg ON gw.board_game_id = bg.board_game_id
WHERE u.username = 'casual_gamer';
