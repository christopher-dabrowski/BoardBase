CREATE MATERIALIZED VIEW main.game_popularity_stats AS
SELECT bg.board_game_id,
       bg.name AS game_name,
       bg.declared_minimal_player_count,
       bg.declared_maximum_player_count,
       bg.declared_minimal_age,

       COUNT(DISTINCT r.rating_id) AS total_ratings,
       ROUND(AVG(r.enjoyment), 2) AS average_rating,
       main.fair_game_rating(bg.board_game_id, 10) AS fair_rating,

       ROUND(AVG(r.complexity), 2) AS average_complexity,
       COUNT(DISTINCT rev.review_id) AS total_reviews,
       SUM(COALESCE(rev.hours_spent_playing, 0)) AS total_hours_reviewed,
       COUNT(DISTINCT p.play_id) AS total_plays,
       ROUND(AVG(p.duration_in_minutes), 0) AS average_duration_minutes,
       SUM(COALESCE(p.player_count, 0)) AS total_players_participated,

       COUNT(DISTINCT CASE
           WHEN p.play_date >= CURRENT_DATE - INTERVAL '90 days' THEN p.play_id
       END) AS plays_last_90_days,

       COUNT(DISTINCT gw.game_wish_id) AS wishlist_count,
       COUNT(DISTINCT ugr.user_id) AS collection_count,
       COUNT(DISTINCT abg.award_id) AS award_count,
       (COUNT(DISTINCT gw.game_wish_id) + 0.5 * COUNT(DISTINCT ugr.user_id) + 10 * COUNT(DISTINCT abg.award_id)) AS popularity_score
FROM main.board_game bg
LEFT JOIN main.rating r ON bg.board_game_id = r.board_game_id
LEFT JOIN main.review rev ON bg.board_game_id = rev.board_game_id
LEFT JOIN main.play p ON bg.board_game_id = p.board_game_id
LEFT JOIN main.game_wish gw ON bg.board_game_id = gw.board_game_id
LEFT JOIN main.game_release gr ON bg.board_game_id = gr.board_game_id
LEFT JOIN main.user_game_release ugr ON gr.game_release_id = ugr.game_release_id
LEFT JOIN main.award_board_game abg ON bg.board_game_id = abg.board_game_id
GROUP BY bg.board_game_id, bg.name, bg.declared_minimal_player_count, bg.declared_maximum_player_count, bg.declared_minimal_age;

GRANT
SELECT ON main.game_popularity_stats TO guests,
                                        players,
                                        admins;
