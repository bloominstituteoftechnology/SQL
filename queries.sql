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


-- Show all albums
SELECT * FROM album;

-- Show albums released between 1975 and 1990
SELECT * FROM album WHERE release_year BETWEEN 1975 AND 1990;

-- Show albums that start with `Super D`
SELECT * FROM album WHERE title LIKE 'Super D%';

-- Show albums with no release date
SELECT * FROM album WHERE release_year IS NULL;

SELECT track.title FROM track, album 
	WHERE track.album_id = album.id 
	AND album.title = 'Super Funky Album';

SELECT track.title AS Track_Title FROM track, album 
	WHERE track.album_id = album.id 
	AND album.title = 'Super Funky Album';

SELECT album.title, artist.name FROM artist, artist_album, album 
	WHERE artist_album.album_id = album.id 
	AND artist_album.artist_id = artist.id 
	AND artist.name = 'Han Solo';

SELECT AVG(release_year) FROM album;

SELECT AVG(release_year) FROM artist, artist_album, album
	WHERE artist_album.artist_id = artist.id 
	AND artist_album.album_id = album.id 
	AND artist.name = 'Leia and the Ewoks';

SELECT COUNT(*) from artist;

SELECT COUNT(*) from track, album
	WHERE track.album_id = album.id 
	AND album.title = 'Super Dubstep Album';