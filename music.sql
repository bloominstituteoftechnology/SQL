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


SELECT album.title FROM album, artist, artist_album WHERE artist.id = artist_album.artist_id 
AND album.id = artist_album.album_id AND artist.name = 'Han Solo';

SELECT track.title FROM track, album 
WHERE track.album_id = album.id AND album.title = 'Super Funky Album';

SELECT AVG(release_year) FROM album, artist, artist_album WHERE artist.id = artist_album.artist_id 
AND album.id = artist_album.album_id AND artist.name = 'Leia and the Ewoks';

SELECT AVG(release_year) from album;

SELECT COUNT(track.id) FROM track, album 
WHERE album.id = track.album_id and album.title = 'Super Dubstep Album';

SELECT COUNT(id) FROM artist;