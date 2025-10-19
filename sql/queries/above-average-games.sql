SELECT
    bg.name AS game_name,
    bg.designer,
    c.name AS main_category,
    ROUND(AVG(r.enjoyment), 2) AS avg_rating,
    COUNT(r.rating_id) AS rating_count,
    (
        SELECT ROUND(AVG(r2.enjoyment), 2)
        FROM main.rating r2
        INNER JOIN main.board_game_category bgc2
            ON r2.board_game_id = bgc2.board_game_id
        WHERE bgc2.category_id = c.category_id
    ) AS category_avg_rating
FROM main.board_game bg
INNER JOIN main.rating r ON bg.board_game_id = r.board_game_id
INNER JOIN main.board_game_category bgc ON bg.board_game_id = bgc.board_game_id
INNER JOIN main.category c ON bgc.category_id = c.category_id
GROUP BY
    bg.board_game_id,
    bg.name,
    bg.designer,
    c.category_id,
    c.name
HAVING AVG(r.enjoyment) > (
    SELECT AVG(r3.enjoyment)
    FROM main.rating r3
    INNER JOIN main.board_game_category bgc3
        ON r3.board_game_id = bgc3.board_game_id
    WHERE bgc3.category_id = c.category_id
)
ORDER BY avg_rating DESC, rating_count DESC
