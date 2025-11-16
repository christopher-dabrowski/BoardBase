DO $$ BEGIN
    CREATE TYPE want_level_enum AS ENUM (
        'MUST_HAVE',
        'WANT_TO_PLAY',
        'NICE_TO_HAVE',
        'SOMEDAY'
    );
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;
