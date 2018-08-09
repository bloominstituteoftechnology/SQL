SELECT * FROM album;
SELECT * FROM album WHERE release_year > 1975 AND release_year < 1990;
SELECT * FROM album WHERE title LIKE 'Super D%';
SELECT * FROM album WHERE release_year IS NULL;

SELECT track.title FROM track WHERE track.album_id = 2;
SELECT track.title AS 'Track_Title' FROM track WHERE track.album_id = 2;
SELECT album.title FROM album, artist_album WHERE album.id = artist_album.album_id AND artist_album.artist_id = 3;
SELECT AVG(album.release_year) FROM album;
SELECT AVG(album.release_year) FROM album, artist_album WHERE album.id = artist_album.album_id AND artist_album.artist_id = 2;
SELECT COUNT(id) FROM artist;
SELECT COUNT(track.id) FROM track WHERE track.album_id = 5;