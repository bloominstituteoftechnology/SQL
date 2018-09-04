-- CREATE TABLE [table name] ([column name][column data type][column options])

-- Create a table called track
CREATE TABLE track (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(128) NOT NULL,
  album_id INT NOT NULL REFERENCES album(id)
);

-- Create a table called artist_album
CREATE TABLE artist_album (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  artist_id INT NOT NULL REFERENCES artist(id),
  album_id INT NOT NULL REFERENCES album(id)
);

-- Select all albums
SELECT * FROM album;

-- Select all albums made between 1975 and 1990
SELECT * FROM album WHERE release_year >= 1975 AND release_year <= 1990;

-- Select all albums whose names start with Super D
SELECT * FROM album WHERE title LIKE 'Super D%';

-- Select all albums that have no release year
SELECT * FROM album WHERE release_year IS NULL;

-- Select all track titles from Super Funky Album
SELECT track.title
  FROM track, album
  WHERE track.album_id = album.id AND album.title = 'Super Funky Album';