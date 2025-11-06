SET role god;
SELECT current_user, session_user;

CALL merge_user_accounts(9, 10);

SELECT * FROM user_game_release WHERE user_id = 9;
