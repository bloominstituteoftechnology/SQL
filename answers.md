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
    title VARCHAR(128) NOT NULL,
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    album_id INTEGER
);

CREATE TABLE artist_album (
    artist_id INTEGER,
    album_id INTEGER
);

SELECT * FROM album;

SELECT * FROM album WHERE release_year < 1990 and > 1975;

SELECT * FROM album WHERE title like 'Super D%';

SELECT * FROM album WHERE release_year is NULL;

SELECT track.title FROM track, album WHERE track.album_id = album.id AND album.title = "Super Funky Album";

SELECT track.title AS Track_Title FROM track, album WHERE track.album_id = album.id AND album.title = "Super Funky Album";

SELECT album.title FROM artist, album, artist_album WHERE artist_album.artist_id = artist.id AND artist_album.album_id = album.id AND artist.name = "Han Solo";

SELECT AVG(release_year) FROM album;

SELECT AVG(release_year) FROM album, artist, artist_album WHERE artist_album.artist_id = artist.id AND artist_album.album_id = album.id AND artist.name = "Leia and the Ewoks";

SELECT count(artist.id) FROM artist;

SELECT COUNT(track.id) FROM track, album WHERE track.album_id = album.id AND album.title = 'Super Dubstep Album';