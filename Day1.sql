PRAGMA foreign_keys = ON;

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
    title VARCHAR(128),
    album_id INTEGER, --foreign key
    FOREIGN KEY (album_id) REFERENCES album (id)
);

CREATE TABLE artist_album (
    artist_id INTEGER,
    album_id INTEGER,
    FOREIGN KEY(artist_id) REFERENCES artist(id),
    FOREIGN KEY(album_id) REFERENCES album(id)
);

.read setup.db
-- Queries
SELECT * FROM album
SELECT * FROM album WHERE release_year >= 1975 AND release_year <= 1990;
SELECT * FROM album WHERE release_year BETWEEN 1975 and 1990;
SELECT * FROM album WHERE title like 'Super D%';
SELECT * FROM album WHERE release_year is NULL;
SELECT track.title FROM track, album WHERE track.album_id = album.id AND album.title = "Super Funky Album";
SELECT track.title AS Track_Title FROM track, album WHERE track.album_id = album.id AND album.title = "Super Funky Album";
SELECT album.title FROM album, artist_album, artist WHERE artist_album.album_id = album.id AND artist_album.artist_id = artist.id AND artist.name = "Han Solo";
SELECT AVG(release_year) FROM album;
SELECT AVG(release_year) FROM album, artist_album, artist WHERE artist_album.artist_id = artist_id AND artist_album.album_id = album.id AND artist.name = "Leia and the Ewoks";
Select COUNT(*) from artist;
SELECT COUNT(*) FROM track, album WHERE track.album_id = album.id AND album.title = 'Super Dubstep Album';