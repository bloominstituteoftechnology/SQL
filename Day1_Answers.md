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
    album_id INTEGER NOT NULL,
    FOREIGN KEY(album_id) REFERENCES album(id)
);

CREATE TABLE artist_albums (
    artist_id INTEGER,
    album_id INTEGER,
    FOREIGN KEY(artist_id) REFERENCES artist(id),
    FOREIGN KEY(album_id) REFERENCES album(id)
);

SELECT * FROM album;

SELECT * FROM album WHERE release_year >= 1975 AND release_year < 1990;

SELECT * FROM album WHERE title LIKE "Super D%";

SELECT * FROM album WHERE release_year IS NULL;

SELECT track.title FROM track, album
    WHERE track.album_id = album.id AND album.title = "Super Funky Album";

SELECT track.title AS "Track Title" FROM track, album
    WHERE track.album_id = album.id AND album.title = "Super Funky Album";

SELECT album.title FROM album, artist_album, artist
    WHERE artist_album.album_id = album.id AND
    artist_album.artist_id = artist.id AND
    artist.name = "Han Solo";

SELECT AVG(release_year) FROM album;

SELECT AVG(release_year) FROM album, artist_album, artist
    WHERE artist_album.album_id = album.id AND
    artist_album.artist_id = artist.id AND
    artist.name = "Leia and the Ewoks";

SELECT COUNT(*) FROM artist;

SELECT COUNT(*) FROM track, album
    WHERE track.album_id = album.id AND
    album.title = "Super Dubstep Album";
