CREATE ROLE admins;
CREATE ROLE players;
CREATE ROLE guests;


GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA :: main TO admins;
GRANT SELECT, UPDATE ON SCHEMA :: main TO admins;

GRANT INSERT ON main.rating TO players;
GRANT INSERT ON main.review TO players;
GRANT INSERT ON main.play TO players;
GRANT INSERT ON main.play_participant TO players;
GRANT INSERT ON main.game_wish TO players;
GRANT INSERT ON main.user_game_release TO players;
GRANT INSERT ON main.location TO players;
GRANT INSERT ON main.price TO players;

GRANT SELECT (user_id, username) ON main.app_user TO players;
GRANT SELECT (user_id, username) ON main.app_user TO guests;
