CREATE TABLE IF NOT EXISTS artist (
    mbid char(36),
    artist_mb STRING,
    artist_lastfm STRING,
    country_mb char(40),
    country_lastfm char(200),
    tags_mb ARRAY < STRING >,
    tags_lastfm ARRAY < STRING >,
    listeners_lastfm int,
    scrobbles_lastfm int,
    ambiguous_artist BOOLEAN
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' COLLECTION ITEMS TERMINATED BY ';';

LOAD DATA INPATH '/artists.csv' OVERWRITE INTO TABLE artist;