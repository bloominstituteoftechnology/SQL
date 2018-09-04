/*create a persistent DB file*/
sqlite3 music.db

/*Turns on foreign key constraints*/
PRAGMA foreign_keys = ON

/*Turn on column out put and headers for `SELECT`*/
.mode COLUMN
.header ON

/*CREATE TABLES*/

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
    album_id INT REFERENCES album(id)
);

CREATE TABLE artist_album (
    artist_id INT REFERENCES artist(id),
    album_id INT REFERENCES album(id)
);

/*POPULATE TABLES*/

.read setup.sql

/*ALBUM QUERIES AND OUTPUT*/

/*Show all albums*/
SELECT * FROM album;

-- 1|Super Awesome Album|1990
-- 2|Super Funky Album|
-- 3|Super Disco Album|1978
-- 4|Super Hairband Album|1984
-- 5|Super Dubstep Album|

/*Show all albums between 1975 and 1990*/
SELECT * from album WHERE 1975 < release_year AND release_year < 1990;

-- 3|Super Disco Album|1978
-- 4|Super Hairband Album|1984

/*Show all albums that start with "Super D" */
SELECT * from album WHERE title LIKE 'Super D%';

-- 3|Super Disco Album|1978
-- 5|Super Dubstep Album|

/*Show all albums with no release year*/
SELECT * from album WHERE release_year IS NULL;

-- 2|Super Funky Album|
-- 5|Super Dubstep Album|

/*ADVANCED QUERIES AND OUTPUT*/

-- Show all track titles from Super Funky Album.
SELECT track.title FROM track, album WHERE track.album_id = album.id AND album.title = 'Super Funky Album';

--             title
--             -------------------
--             Super Funky Track 1
--             Super Funky Track 2
--             Super Funky Track 3
--             Super Funky Track 4


-- Same query as above, but rename the column from title to Track_Title in the output.
SELECT track.title AS Track_Title from track, album WHERE track.album_id=album.id AND album.title = 'Super Funky Album';

--             Track_Title
--             -------------------
--             Super Funky Track 1
--             Super Funky Track 2
--             Super Funky Track 3
--             Super Funky Track 4 


-- Select all album titles by Han Solo.



-- Select the average year all albums were released.



-- Select the average year all albums by Leia and the Ewoks were released.



-- Select the number of artists.



-- Select the number of tracks on Super Dubstep Album.

