/* CREATE A MUSIC DATABASE */

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

/* Show all albums */

 SELECT * from album;

--- 1|Super Awesome Album|1990
--- 2|Super Funky Album|
--- 3|Super Disco Album|1978
--- 4|Super Hairband Album|1984
--- 5|Super Dubstep Album|

/* Show all albums made between 1975 and 1990 */

SELECT * from album WHERE release_year > 1975 AND release_year < 1990;

--- 3|Super Disco Album|1978
--- 4|Super Hairband Album|1984 /*

/* Show all albums whose names start with `Super D` */

SELECT * from album WHERE title LIKE 'Super D%';

--- 3|Super Disco Album|1978
--- 5|Super Dubstep Album|

/* Show all albums that have no release year */

SELECT * from album WHERE release_year IS NULL;

--- 2|Super Funky Album|
--- 5|Super Dubstep Album|

/* Show all track titles from `Super Funky Album` */

SELECT track.title FROM track, album WHERE track.album_id = album.id AND album.title = 'Super Funky Album';

--- Super Funky Track 1
--- Super Funky Track 2
--- Super Funky Track 3
--- Super Funky Track 4

/* Select all album titles by `Han Solo` */

SELECT album.title from artist, album, artist_album WHERE artist.id = artist_album.artist_id AND artist_album.album_id = album.id AND artist.name = 'Han Solo'; 

--- Super Disco Album
--- Super Hairband Album

/* Select the average year all albums were released */ 

SELECT AVG(release_year) FROM album;

--- 1984.0

/* Select the average year all albums by `Leia and the Ewoks` were released */

SELECT AVG(release_year) FROM album, artist, artist_album WHERE artist.id = artist_album.artist_id AND album_id = artist_album.album_id AND artist.name = 'Leia and the Ewoks';

--- 1990.0 

/* Select the number of artists */

SELECT COUNT(id) from artist;

--- 3 

/* Select the number of tracks on `Super Dubstep Album` */

SELECT COUNT(track.id) FROM track, album WHERE album.id = track.album_id and album.title = 'Super Dubstep Album';

--- 5 