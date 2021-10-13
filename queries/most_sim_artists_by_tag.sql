CREATE TEMPORARY TABLE top_artist_tags AS
SELECT
    t.artist_lastfm,
    tag
FROM
    (
        SELECT
            artist_lastfm,
            tags_lastfm,
            scrobbles_lastfm
        FROM
            artist
        ORDER BY
            scrobbles_lastfm DESC
        LIMIT
            100
    ) t lateral VIEW explode(t.tags_lastfm) new_t AS tag;

SELECT
    t.*
FROM
    (
        SELECT
            left_t.artist_lastfm AS artist_left,
            right_t.artist_lastfm AS artist_right,
            count(*) AS num_equal_tags,
            row_number() over (
                PARTITION by artist_left
                ORDER BY
                    num_equal_tags DESC
            ) AS rank
        FROM
            top_artist_tags AS left_t
            JOIN top_artist_tags AS right_t ON left_t.tag = right_t.tag
        WHERE
            left_t.artist_lastfm != right_t.artist_lastfm
        GROUP BY
            left_t.artist_lastfm,
            right_t.artist_lastfm
        HAVING
            num_equal_tags > 10
    ) t
WHERE
    rank < 6
ORDER BY
    t.artist_left,
    t.rank ASC