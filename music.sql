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

-- Select all track titles from Super Funky Album and rename title column to Track_Title
SELECT track.title AS Track_Title
  FROM track, album
  WHERE track.album_id = album.id AND album.title = 'Super Funky Album';

-- Select all album titles by Han Solo
SELECT album.title
  FROM album, artist, artist_album
  WHERE 
    artist.id = artist_album.artist_id AND
    album.id = artist_album.album_id AND
    artist.name = 'Han Solo';

-- Select the average year all albums were released
SELECT AVG(release_year) AS average_release_year FROM album;

-- Select the average year all albums by Leia and the Ewoks were released
SELECT AVG(release_year) AS average_release_year
  FROM album, artist, artist_album
  WHERE 
    artist.id = artist_album.artist_id AND
    album.id = artist_album.album_id AND
    artist.name = 'Leia and the Ewoks';

-- Select the number of artists
SELECT COUNT(name) AS number_of_artists FROM artist;