CREATE USER god WITH PASSWORD 'secure_admin_password';
GRANT admins TO god;

CREATE USER jonny_the_combo_player WITH PASSWORD 'secure_player_password';
GRANT players TO jonny_the_combo_player;

CREATE USER guest WITH PASSWORD 'secure_guest_password';
GRANT guests TO guest;
