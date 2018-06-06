PRAGMA foreign_keys = ON; -- SQLite ONLY!

CREATE TABLE track (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(128) NOT NULL,
  album_id INTEGER REFERENCES album(id)
);

CREATE TABLE artist (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(128) NOT NULL
);

CREATE TABLE album (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(128) NOT NULL,
  release_year INTEGER
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

INSERT INTO artist_album (artist_id, album_id) VALUES (1, 5);
INSERT INTO artist_album (artist_id, album_id) VALUES (1, 2);
INSERT INTO artist_album (artist_id, album_id) VALUES (2, 1);
INSERT INTO artist_album (artist_id, album_id) VALUES (2, 2);
INSERT INTO artist_album (artist_id, album_id) VALUES (3, 3);
INSERT INTO artist_album (artist_id, album_id) VALUES (3, 4);

INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 1", 1);
INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 2", 1);
INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 3", 1);
INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 4", 1);
INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 5", 1);

INSERT INTO track (title, album_id) VALUES ("Super Funky Track 1", 2);
INSERT INTO track (title, album_id) VALUES ("Super Funky Track 2", 2);
INSERT INTO track (title, album_id) VALUES ("Super Funky Track 3", 2);
INSERT INTO track (title, album_id) VALUES ("Super Funky Track 4", 2);

INSERT INTO track (title, album_id) VALUES ("Super Disco Track 1", 3);
INSERT INTO track (title, album_id) VALUES ("Super Disco Track 2", 3);
INSERT INTO track (title, album_id) VALUES ("Super Disco Track 3", 3);

INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 1", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 2", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 3", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 4", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 5", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 6", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 7", 4);

INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 1", 5);
INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 2", 5);
INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 3", 5);
INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 4", 5);
INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 5", 5);

-- Show all albums
SELECT * FROM album;

-- Show all albums made between 1975 and 1990
SELECT * FROM album WHERE album.release_year >= 1975 AND album.release_year <= 1990;

-- Show all albums whose names start with 'Super D'
SELECT * from album WHERE album.title LIKE 'Super D%';

-- Show all albums that have no release year
SELECT * FROM album WHERE album.release_year IS NULL;

-- Show all track titles from 'Super Funky Album'
SELECT track.title FROM track WHERE track.album_id = 2;

-- Same as above, but rename the column from title to Track_Title in output
SELECT track.title AS Track_Title FROM track WHERE track.album_id = 2;

-- Get album titles by Han Solo
SELECT album.title FROM artist_album LEFT JOIN album ON album.id = artist_album.album_id WHERE artist_id = 3;

-- Select the average year all albums were released
SELECT AVG(release_year) FROM album;

-- Select the average year all albums by Leia and the Ewoks were released.
SELECT AVG(album.release_year) FROM artist_album LEFT JOIN album ON album.id = artist_album.album_id WHERE artist_id = 2;

-- Select the number of artists.
SELECT COUNT(*) FROM artist;

-- Select the number of tracks on 'Super Dubstep Album'
SELECT COUNT(*) FROM track WHERE track.album_id = (SELECT id FROM album WHERE album.title = "Super Dubstep Album");
