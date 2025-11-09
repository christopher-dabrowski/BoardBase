-- Bayesian average rating for a game
CREATE OR REPLACE FUNCTION fair_game_rating (game_id INTEGER, minimum_rating_count INTEGER = 10)
RETURNS NUMERIC(4,2)
AS $$
DECLARE
  game_rating NUMERIC(4,2);
  game_rating_count BIGINT;
  average_rating NUMERIC(4,2);
BEGIN
  SELECT COALESCE(AVG(enjoyment), 0) INTO game_rating
  FROM main.rating
  WHERE board_game_id = game_id;

  SELECT COUNT(*) INTO game_rating_count
  FROM main.rating
  WHERE board_game_id = game_id;

  SELECT COALESCE(AVG(enjoyment), 0) INTO average_rating
  FROM main.rating;

  RETURN (game_rating * game_rating_count + average_rating * minimum_rating_count) / (game_rating_count + minimum_rating_count);
END;
$$ LANGUAGE plpgsql;

-- Test the function

SELECT enjoyment FROM main.rating WHERE board_game_id = 1;
SELECT COUNT(*) FROM main.rating WHERE board_game_id = 1;
SELECT AVG(enjoyment) FROM main.rating WHERE board_game_id = 1;
SELECT main.fair_game_rating(1);
