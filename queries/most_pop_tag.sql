SELECT
    t.tag as most_pop_tag
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
            1
    ) t