SELECT
    artist_lastfm
FROM
    artist
WHERE
    scrobbles_lastfm IN (
        SELECT
            max(scrobbles_lastfm)
        FROM
            artist
    )