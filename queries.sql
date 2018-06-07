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

-- Show all albums
SELECT * FROM album

-- Show all albums made between 1975 and 1990.
SELECT * FROM album WHERE release_year >= 1975 AND release_year <= 1990;

--Show all albums whose name start with Super D
SELECT * FROM album WHERE title LIKE 'Super D%';

-- Show all albums that have no release year.
SELECT * FROM album WHERE release_year IS NULL;


