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
  name VARCHAR(128) NOT NULL
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

SELECT title FROM album;
SELECT title FROM album WHERE release_year BETWEEN 1975 AND 1990;
SELECT title FROM album WHERE title LIKE 'Super D%';
SELECT title FROM album WHERE release_year IS NULL;

SELECT track.title, album.title FROM track, album WHERE album.title IS "Super Funky Album" AND track.album_id = album.id;
SELECT track.title AS "Track_Title", album.title FROM track, album WHERE album.title IS "Super Funky Album" AND track.album_id = album.id;
SELECT album.title, artist.name FROM album, artist, artist_album WHERE artist.name IS "Han Solo" AND artist_album.album_id = album.id AND artist_album.artist_id = artist.id;
SELECT avg(release_year) FROM album;
SELECT avg(album.release_year), artist.name FROM album, artist, artist_album WHERE artist.name IS "Leia and the Ewoks" AND artist_album.album_id = album.id AND artist_album.artist_id = artist.id;
SELECT count(id) FROM artist;
SELECT count(track.title), album.title FROM track, album WHERE album.title IS "Super Dubstep Album" AND track.album_id = album.id;

-- RESULTS ------------------------------------------------
-- sqlite> .read setup.sql
-- title
-- -------------------
-- Super Awesome Album
-- Super Funky Album
-- Super Disco Album
-- Super Hairband Albu
-- Super Dubstep Album
-- title
-- -------------------
-- Super Awesome Album
-- Super Disco Album
-- Super Hairband Albu
-- title
-- -----------------
-- Super Disco Album
-- Super Dubstep Alb
-- title
-- -----------------
-- Super Funky Album
-- Super Dubstep Alb
-- title                title
-- -------------------  -----------------
-- Super Funky Track 1  Super Funky Album
-- Super Funky Track 2  Super Funky Album
-- Super Funky Track 3  Super Funky Album
-- Super Funky Track 4  Super Funky Album
-- Track_Title          title
-- -------------------  -----------------
-- Super Funky Track 1  Super Funky Album
-- Super Funky Track 2  Super Funky Album
-- Super Funky Track 3  Super Funky Album
-- Super Funky Track 4  Super Funky Album
-- title              name
-- -----------------  ----------
-- Super Disco Album  Han Solo
-- Super Hairband Al  Han Solo
-- avg(release_year)
-- -----------------
-- 1984.0
-- avg(album.release_year)  name
-- -----------------------  ------------------
-- 1990.0                   Leia and the Ewoks
-- count(id)
-- ----------
-- 3
-- count(track.title)  title
-- ------------------  -------------------
-- 5                   Super Dubstep Album
-- RESULTS ------------------------------------------------