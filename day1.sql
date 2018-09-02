-- SHOW ALL ALBUMS
SELECT * FROM album;

-- SELECT ALBUMS CREATE BETWEEN 1975 and 1990
SELECT * FROM album
WHERE release_year BETWEEN 1975 and 1990;

-- SELECT ALBUMS THAT CONTAIN `Super D`
SELECT * FROM album
WHERE title Like 'Super D%';

-- SELECT ALBUMS WITHOUT A RELEASE YEAR
SELECT * FROM album
WHERE release_year IS NULL;

-- SELECT TRACKS FROM `Super Funky Album`
SELECT track.title FROM track
INNER JOIN album
ON album.id IS track.album_id
WHERE album.title IS 'Super Funky Album';

-- SAME QUERY BUT track.title NAMED Track_Title
SELECT track.title as Track_Title FROM track
INNER JOIN album
ON album.id IS track.album_id
WHERE album.title IS 'Super Funky Album';

-- SELECT ALL ALBUM TITLES BY `Han Solo`
SELECT album.title FROM album, artist, artist_album
WHERE artist.name IS 'Han Solo'
AND artist.id IS artist_album.artist_id
AND album.id IS artist_album.album_id;

-- RETURN AVG YEAR ALL ALBUMS WERE RELEASED
SELECT AVG(release_year) from album
WHERE release_year IS NOT NULL;

-- RETURN AVG ALL ALBUMS FROM `Leia and the Ewoks` WERE RELEASED
SELECT AVG(release_year) FROM album, artist, artist_album
WHERE artist.name IS 'Leia and the Ewoks'
AND artist.id IS artist_album.artist_id
AND album.id IS artist_album.album_id;

-- RETURN NUMBER OF ARTISTS
SELECT COUNT(id) FROM artist;

-- Select the number of tracks on `Super Dubstep Album`
SELECT COUNT(track.title) FROM track, album
WHERE album.id IS track.album_id
AND album.title IS 'Super Dubstep Album';