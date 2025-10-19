CREATE ROLE admins NOLOGIN;
CREATE ROLE players NOLOGIN;
CREATE ROLE guests NOLOGIN;

GRANT USAGE ON SCHEMA main TO admins;
GRANT USAGE ON SCHEMA main TO players;
GRANT USAGE ON SCHEMA main TO guests;

GRANT SELECT, INSERT, UPDATE, DELETE
  ON ALL TABLES IN SCHEMA main TO admins;
GRANT USAGE, SELECT
  ON ALL SEQUENCES IN SCHEMA main TO admins;

GRANT SELECT ON ALL TABLES IN SCHEMA main TO players;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA main TO players;

REVOKE SELECT ON TABLE main.app_user FROM players;
REVOKE SELECT ON TABLE main.app_user FROM guests;
GRANT SELECT (user_id, username) ON main.app_user TO players;
GRANT SELECT (user_id, username) ON main.app_user TO guests;

GRANT INSERT ON
  main.rating,
  main.review,
  main.play,
  main.play_participant,
  main.game_wish,
  main.user_game_release,
  main.location,
  main.price
TO players;

GRANT SELECT ON ALL TABLES IN SCHEMA main TO guests;

ALTER DEFAULT PRIVILEGES IN SCHEMA main
  GRANT SELECT ON TABLES TO admins, players, guests;

ALTER DEFAULT PRIVILEGES IN SCHEMA main
  GRANT INSERT, UPDATE, DELETE ON TABLES TO admins;

ALTER DEFAULT PRIVILEGES IN SCHEMA main
  GRANT USAGE, SELECT ON SEQUENCES TO admins, players;
