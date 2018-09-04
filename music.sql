-- sqlite3 music.db

CREATE TABLE track (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(256) NOT NULL,
    album_id INT REFERENCES album(id)
);

CREATE TABLE artist (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name VARCHAR(256) NOT NULL
);

CREATE TABLE album (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    title VARCHAR(256) NOT NULL, 
    release_year INTEGER
);

CREATE TABLE artist_album(
    artist_id INT REFERENCES artist(id), 
    album_id INT REFERENCES album(id)
);

SELECT * FROM album;
SELECT * FROM album WHERE release_year > 1974 AND release_year < 1991;
SELECT * FROM album WHERE title LIKE '%Super D%';
SELECT * from album WHERE release_year IS NULL;
SELECT track.title FROM track, album WHERE track.album_id = album.id AND album.title = 'Super Funky Album';