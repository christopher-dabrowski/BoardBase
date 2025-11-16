-- SQLINES DEMO *** rating for a game
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
IF OBJECT_ID('fair_game_rating', 'FN') IS NOT NULL
  DROP FUNCTION fair_game_rating;
GO

CREATE FUNCTION fair_game_rating (@game_id INTEGER, @minimum_rating_count INTEGER = 10)
RETURNS NUMERIC(4,2)
AS
BEGIN
  DECLARE @game_rating NUMERIC(4,2);
  DECLARE @game_rating_count BIGINT;
  DECLARE @average_rating NUMERIC(4,2);
 
  SELECT @game_rating = COALESCE(AVG(enjoyment), 0)
  FROM main.rating
  WHERE board_game_id = @game_id;

  SELECT @game_rating_count = COUNT(*)
  FROM main.rating
  WHERE board_game_id = @game_id;

  SELECT @average_rating = COALESCE(AVG(enjoyment), 0)
  FROM main.rating;

  RETURN (@game_rating * @game_rating_count + @average_rating * @minimum_rating_count) / (@game_rating_count + @minimum_rating_count);
END;
$$ LANGUAGE plpgsql

-- Te... SQLINES DEMO ***

SELECT enjoyment FROM main.rating WHERE board_game_id = 1;
SELECT COUNT(*) FROM main.rating WHERE board_game_id = 1;
SELECT AVG(enjoyment) FROM main.rating WHERE board_game_id = 1;
SELECT main.fair_game_rating(1);
