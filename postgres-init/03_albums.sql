-- ==========================================
-- Load albums CSV with extra columns
-- ==========================================


-- Temporary staging table that matches CSV structure
CREATE TEMP TABLE albums_staging (

    album_id INT,
    title TEXT,
    artist TEXT,
    release_date TEXT,
    country TEXT,
    status TEXT,
    price DECIMAL,
    stock_quantity INT,
    genre TEXT

);


-- Load CSV into staging table
COPY albums_staging
FROM '/docker-entrypoint-initdb.d/albums.csv'
DELIMITER ','
CSV HEADER;


INSERT INTO albums (album_id, title, artist, genre, price, stock_quantity)

SELECT
album_id,
title,
artist,
genre,

-- random price between 10 and 30
round((random()*20 + 10)::numeric,2),

stock_quantity

FROM albums_staging;