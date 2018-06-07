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
    title VARCHAR(128) NOT NULL
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

INSERT INTO album (title, release_year) VALUES ("Super Awesome Album", 1990);
INSERT INTO album (title) VALUES ("Super Funky Album");
INSERT INTO album (title, release_year) VALUES ("Super Disco Album", 1978);
INSERT INTO album (title, release_year) VALUES ("Super Hairband Album", 1984);
INSERT INTO album (title) VALUES ("Super Dubstep Album");

INSERT INTO artist (name) VALUES ("Luke and the Droidtones");
INSERT INTO artist (name) VALUES ("Leia and the Ewoks");
INSERT INTO artist (name) VALUES ("Han Solo");

-- Show all albums
SELECT * FROM album

-- Show all albums made between 1975 and 1990.
SELECT * FROM album WHERE release_year >= 1975 AND release_year <= 1990;

--Show all albums whose name start with Super D
SELECT * FROM album WHERE title LIKE 'Super D%';

-- Show all albums that have no release year.
SELECT * FROM album WHERE release_year IS NULL;



-- Show all track titles from `Super Funky Album`.
SELECT track.title FROM album, track
    WHERE track.album_id = album.id
    END album.title = "Super Funky Album";

-- Same query as above, but rename the column from `title` to `Track_Title` in the output.
SELECT track.title AS 'Track_Title' FROM album, track
    WHERE track.album_id - album.id
    AND album.title = "Super Funky Album";


-- Select all album titles by `Han Solo`.
SELECT album.title FROM album, artist, artist_album
    WHERE artist.name = "Han Solo"
    AND artist_album.artist_id = artist.id
    AND artist_album.album_id = album.id;

-- Select the average year all albums were released.
SELECT avg(release_year) FROM album;

-- Select the average year all albums by `Leia and the Ewoks` were released.
SELECT avg(release_year) FROM album, artist, artist_album
    WHERE artist.name = "Leia and the Ewoks"
    AND artist_album.artist_id = artist.id
    AND artist_album.album_id = album.id;

-- Select the number of artists.
SELECT count(*) FROM artist;

-- Select the number of tracks on `Super Dubstep Album`.
SELECT count(*) FROM album, track
    WHERE track.album_id = album.id
    AND album.title = "Super Dubstep Album";





