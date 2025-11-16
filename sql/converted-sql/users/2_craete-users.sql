CREATE USER god -- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
 WITH PASSWORD 'secure_admin_password';
GRANT admins TO god;

CREATE USER jonny_the_combo_player WITH PASSWORD 'secure_player_password';
GRANT players TO jonny_the_combo_player;

CREATE USER casual_gamer WITH PASSWORD 'secure_casual_password';
GRANT players TO casual_gamer;

CREATE USER guest WITH PASSWORD 'secure_guest_password';
GRANT guests TO guest;
