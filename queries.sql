SELECT * FROM album;
SELECT *
    FROM album
    WHERE album.release_year >= 1975 AND album.release_year <= 1990;

SELECT *
    FROM album
    WHERE album.title LIKE 'Super D%';

SELECT *
    FROM album
    WHERE album.release_year IS NULL;