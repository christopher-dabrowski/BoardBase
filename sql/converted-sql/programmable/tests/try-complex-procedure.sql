SET @role god;
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
SELECT system_user, [session_user];

EXEC merge_user_accounts 9, 10;

SELECT * FROM user_game_release WHERE user_id = 9;
