CREATE TABLE album (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    release_year INTEGER
);

CREATE TABLE artist (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL
);

CREATE TABLE track (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    album_id INT REFERENCES album(id));

CREATE TABLE artist_album (
    artist_id INT REFERENCES artist(id),
    album_id INT REFERENCES album(id)
)

SELECT * from album;
SELECT * from album WHERE release_year >= 1975 AND release_year <= 1990;
SELECT * from album WHERE title LIKE 'Super D%';
SELECT * from album WHERE release_year IS NULL;

-- updated for new query request with new column heading

SELECT album.id, track.Track_Title
FROM album
INNER JOIN track ON album.id = track.album_id WHERE album.title LIKE 'Super Funky Album%';

PRAGMA foreign_keys=off;
 
BEGIN TRANSACTION;
 
ALTER TABLE track RENAME TO temp_table;
 
CREATE TABLE track
( 
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Track_Title VARCHAR(128),
    album_id INT REFERENCES album(id));

 
INSERT INTO track (id)
  SELECT id
  FROM temp_table;
 
INSERT INTO track (Track_Title)
  SELECT title
  FROM temp_table;
 
INSERT INTO track (album_id)
  SELECT album_id
  FROM temp_table;
 
DROP TABLE temp_table;
 
COMMIT;
 
PRAGMA foreign_keys=on;

SELECT artist_album.artist_id, artist.name, artist.id, album.title, album.id
FROM 
    artist_album 
        INNER JOIN artist
            ON artist_album.artist_id = artist.id 
            INNER JOIN album 
                ON artist_album.album_id = album.id
                WHERE artist.name LIKE 'Han Solo%';


SELECT AVG(release_year)
FROM album;

-- SELECT artist_album.artist_id, artist.name, artist.id, album.release_year, album.id
-- FROM 
--     artist_album 
--         INNER JOIN artist
--             ON artist_album.artist_id = artist.id 
--             INNER JOIN album 
--                 ON artist_album.album_id = album.id
--                 WHERE artist.name LIKE 'Leia and the Ewoks%'
--                 AND SELECT AVG(release_year)
                
--                 will figure this one out later...has to do with subqueries. Need to investigate more;


SELECT COUNT(name)
FROM artist;