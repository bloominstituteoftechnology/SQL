PRAGMA foreign_keys = ON; --enable foreign key constraints for sqlite

CREATE TABLE track (id INT NOT NULL AUTOINCREMENT PRIMARY KEY, title VARCHAR(128) NOT NULL, album_id INT, FOREIGN KEY(album_id) REFERENCES album(title) ON DELETE CASCADE);

CREATE TABLE artist_album (artist_id INT REFERENCES artist(id), album_id INT REFERENCES album(id));

CREATE TABLE album (id INT NOT NULL AUTOINCREMENT PRIMARY KEY, title VARCHAR(128), release_year INT);

CREATE TABLE artist(id INT NOT NULL AUTOINCREMENT PRIMARY KEY, name VARCHAR(128) NOT NULL);

-- SELECT QUERIES --
SELECT * FROM album;
SELECT * FROM album WHERE release_year >= 1975 AND release_year <=1990;
SELECT * FROM album WHERE title LIKE 'Super D%';
SELECT * FROM album WHERE release_year IS NULL;
SELECT track.title FROM track, album WHERE track.album_id = album.id AND album.title = "Super Funky Album";
SELECT track.title AS "Track_Title" FROM track, album WHERE track.album_id = album.id AND album.title = "Super Funky Album";
SELECT album.title FROM album, artist_album, artist WHERE artist_album.album_id = album.id AND artist_album.artist_id = artist.id AND artist.name = "Han Solo";
SELECT AVG(release_year) FROM album;
SELECT AVG(album.release_year) FROM album, artist_album, artist WHERE artist_album.album_id = album.id AND artist_album.artist_id = artist.id AND artist.name = "Leia and the Ewoks";
SELECT COUNT(*) FROM artist;
SELECT COUNT(*) FROM track, album WHERE track.album_id = album.id AND album.title = "Super Dubstep Album";