CREATE SCHEMA IF NOT EXISTS main AUTHORIZATION postgres;

-- SET search_path TO main, public;

ALTER DATABASE boardbase SET search_path TO main, public;

SHOW search_path;
