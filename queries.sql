-- Show all albums:
SELECT * FROM album;

-- Show all albums made between 1975 and 1990
SELECT * FROM album WHERE release_year > 1975 AND release_year < 1990;

-- Show all albums whose names start with Super D
SELECT * FROM album WHERE title LIKE 'Super D%';

-- Show all albums that have no release year
SELECT * FROM album WHERE release_year IS NULL;

-- Show all track titles from Super Funky Album
-- Same query as above, but rename the column from title to Track_Title in the output.
SELECT track.title AS "Track_Title" FROM track, album WHERE album.id = track.album_id AND album.id = 2;

-- Select all album titles by Han Solo
SELECT album.title FROM artist_album, album WHERE album.id = artist_album.album_id AND artist_album.artist_id = 3;

-- Select the average year all albums were released
SELECT AVG(release_year) FROM album; -- 1984.0

-- Select the average year all albums by Leia and the Ewoks were released.
SELECT AVG(release_year) FROM album, artist_album WHERE album.id = artist_album.album_id AND artist_album.artist_id = 2;

-- Select the number of artists.
SELECT COUNT(*) FROM artist;

-- Select the number of tracks on Super Dubstep Album
SELECT COUNT(*) FROM track, album WHERE track.album_id = album.id AND album.id = 5;
