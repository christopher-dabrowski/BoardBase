CREATE SCHEMA IF NOT EXISTS main AUTHORIZATION postgres;
GO

-- SQLINES DEMO *** O main, public;

ALTER DATABASE boardbase TO main, public;

SHOW search_path;
