SET role casual_gamer;
SELECT current_user, session_user;

SELECT user_id, username FROM main.app_user WHERE username = 'casual_gamer';
SELECT board_game_id, name FROM main.board_game WHERE name = 'Catan' LIMIT 1;

SELECT bg.name
FROM game_wish gw
JOIN main.app_user u ON gw.user_id = u.user_id
JOIN main.board_game bg ON gw.board_game_id = bg.board_game_id
WHERE u.username = 'casual_gamer'

SELECT * FROM board_game;

-- id 4 is Pandemic
CALL add_game_wish(4, NULL);

SET role god;
SELECT current_user, session_user;

SELECT u.username, bg.name, gw.wished_at FROM main.game_wish gw
JOIN main.app_user u ON gw.user_id = u.user_id
JOIN main.board_game bg ON gw.board_game_id = bg.board_game_id
WHERE u.username = 'casual_gamer';

INSERT INTO main.user_game_release (user_id, game_release_id, acquired_at)
SELECT u.user_id, gr.game_release_id, CURRENT_DATE
FROM main.app_user u, main.game_release gr
JOIN main.board_game bg ON gr.board_game_id = bg.board_game_id
WHERE u.username = 'casual_gamer' AND bg.name = 'Pandemic'
LIMIT 1;

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
