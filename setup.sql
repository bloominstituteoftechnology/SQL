PRAGMA foreign_keys = ON;  -- Set foreign key constraing MUST BE DO.

-- IMPROVE PRINT: Set to divede in columns and show Headers
.mode column
.headers on

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
  album_id INTEGER,
  FOREIGN KEY (album_id) REFERENCES album(id) -- ALWAYS: the last statements to be declared.
);

CREATE TABLE artist_album (
  artist_id INTEGER,
  album_id INTEGER,
  FOREIGN KEY (artist_id) REFERENCES artist(id), -- ALWAYS: the last statements to be declared.
  FOREIGN KEY (album_id) REFERENCES album(id) -- ALWAYS: the last statements to be declared.
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

-- QUERIES
-- Show all track titles from Super Funky Album.
SELECT track.title FROM track, album WHERE track.album_id=album.id AND album.id=1;
  -- title
  -- ---------------------
  -- Super Awesome Track 1
  -- Super Awesome Track 2
  -- Super Awesome Track 3
  -- Super Awesome Track 4
  -- Super Awesome Track 5

-- Same query as above, but rename the column from title to Track_Title in the output.
SELECT track.title AS Track_Title FROM track, album WHERE track.album_id=album.id AND album.id=1;
  -- Track_Title
  -- ---------------------
  -- Super Awesome Track 1
  -- Super Awesome Track 2
  -- Super Awesome Track 3
  -- Super Awesome Track 4
  -- Super Awesome Track 5

-- Select all album titles by Han Solo.
SELECT album.title FROM artist, album, artist_album WHERE artist.id=artist_album.artist_id AND artist_album.album_id=album.id AND artist.name="Han Solo";
  -- title
  -- -----------------
  -- Super Disco Album
  -- Super Hairband Al

-- Select the average year all albums were released.
SELECT AVG(release_year) FROM album;
  -- AVG(release_year)
  -- -----------------
  -- 1984.0

-- Select the average year all albums by Leia and the Ewoks were released.
SELECT AVG(release_year) FROM artist, artist_album, album WHERE artist.id=artist_album.artist_id AND artist_album.album_id=album.id AND artist.name="Leia and the Ewoks";
  -- AVG(release_year)
  -- -----------------
  -- 1990.0

-- Select the number of artists.
SELECT COUNT(name) FROM artist;
  -- COUNT(name)
  -- -----------
  -- 3

-- Select the number of tracks on Super Dubstep Album.
SELECT COUNT(track.title) FROM track, album WHERE track.album_id=album.id AND album.title="Super Dubstep Album";
  -- COUNT(track.title)
  -- ------------------
  -- 5

