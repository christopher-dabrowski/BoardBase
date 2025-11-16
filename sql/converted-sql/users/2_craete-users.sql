CREATE LOGIN god WITH PASSWORD = 'secure_admin_password1!';
CREATE USER god FOR LOGIN god;
ALTER ROLE admins ADD MEMBER god;

CREATE LOGIN jonny_the_combo_player WITH PASSWORD = 'secure_player_password2!';
CREATE USER jonny_the_combo_player FOR LOGIN jonny_the_combo_player;
ALTER ROLE players ADD MEMBER jonny_the_combo_player;

CREATE LOGIN casual_gamer WITH PASSWORD = 'secure_casual_password3!';
CREATE USER casual_gamer FOR LOGIN casual_gamer;
ALTER ROLE players ADD MEMBER casual_gamer;

CREATE LOGIN guest WITH PASSWORD = 'secure_guest_password4!';
CREATE USER guest FOR LOGIN guest;
ALTER ROLE guests ADD MEMBER guest;
