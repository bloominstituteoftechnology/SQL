-- TABLES | COLUMNS
-- album | title - string, release_year - int
-- artist | name - string
-- artist_album | atrist_id - int refs artist id, album_id - int refs album id
-- track | title - string, album_id - int refs album id
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS artist;
DROP TABLE IF EXISTS track;
DROP TABLE IF EXISTS artist_album;

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
    album_id INTEGER REFERENCES album(id)
);

CREATE TABLE artist_album (
    artist_id INTEGER REFERENCES artist(id),
    album_id INTEGER REFERENCES album(id)
);

.read setup.sql

-- Show all albums.
SELECT * FROM album;
-- Show all albums made between 1975 and 1990.
SELECT * FROM album WHERE release_year >= 1975 AND release_year <= 1990;
SELECT * FROM album WHERE release_year >= 1975 <= 1990; -- This worked???
-- Show all albums whose names start with Super D.
SELECT * FROM album WHERE title LIKE 'Super D%';
-- Show all albums that have no release year.
SELECT * FROM album WHERE release_year IS NULL;

-- Show all track titles from Super Funky Album.
SELECT track.title FROM album, track 
    WHERE track.album_id = album.id 
    AND album.title = "Super Funky Album";
-- Same query as above, but rename the column from title to Track_Title in the output.
SELECT track.title AS 'Track_Title' FROM album, track 
    WHERE track.album_id = album.id 
    AND album.title = "Super Funky Album";
-- Select all album titles by Han Solo.
SELECT album.title FROM album, artist, artist_album
    WHERE artist.name = "Han Solo"
    AND artist_album.artist_id = artist.id
    AND artist_album.album_id = album.id;
-- Select the average year all albums were released.
SELECT avg(release_year) FROM album;
-- Select the average year all albums by Leia and the Ewoks were released.
SELECT avg(release_year) FROM album, artist, artist_album
    WHERE artist.name = 'Leia and the Ewoks'
    AND artist_album.artist_id = artist.id
    AND artist_album.album_id = album.id;
-- Select the number of artists.
SELECT count(*) FROM artist;
-- Select the number of tracks on Super Dubstep Album.
SELECT count(*) FROM album, track 
    WHERE track.album_id = album.id 
    AND album.title = "Super Dubstep Album";