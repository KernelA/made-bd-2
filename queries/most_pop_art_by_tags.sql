SELECT
    DISTINCT artist_info.artist_lastfm,
    artist_info.scrobbles_lastfm
FROM
    (
        SELECT
            artist_lastfm,
            trim(artist_tag) tag,
            scrobbles_lastfm
        FROM
            artist LATERAL VIEW explode(tags_lastfm) artist_info AS artist_tag
        WHERE
            scrobbles_lastfm IS NOT NULL
            AND trim(artist_tag) != ''
    ) artist_info
WHERE
    artist_info.tag IN (
        SELECT
            t.tag
        FROM
            (
                SELECT
                    trim(tag) AS tag,
                    count(*) AS count_tag
                FROM
                    artist LATERAL VIEW explode(tags_lastfm) t AS tag
                WHERE
                    trim(tag) != ''
                GROUP BY
                    tag
                ORDER BY
                    count_tag DESC
                LIMIT
                    10
            ) t
    )
ORDER BY
    artist_info.scrobbles_lastfm DESC
LIMIT
    10