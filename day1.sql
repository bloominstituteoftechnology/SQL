
SELECT * FROM album;

SELECT * FROM album
WHERE (release_year <= 1990)
AND (release_year >= 1975);

SELECT * FROM album
WHERE title LIKE "Super D%";

SELECT * FROM album
WHERE release_year IS NULL;

SELECT track.title, album.title from track
JOIN album ON(album.title = "Super Funky Album");

SELECT track.title FROM track,album 
WHERE album.title = 'Super Funky Album' 
AND album_id = album.id;

SELECT track.title AS Track_Title
from track
JOIN album ON(album.title = "Super Funky Album");

SELECT track.title AS Track_Title
FROM track,album 
WHERE album.title = 'Super Funky Album' 
AND album_id = album.id

SELECT album.title AS Album_Title
from album
JOIN artist ON(artist.name = "Han Solo");

SELECT * FROM artist, artist_album 
WHERE artist.id = artist_id 
AND artist.name= 'Han Solo';

SELECT avg(release_year)
FROM album;

SELECT AVG(release_year) 
FROM artist, album, artist_album 
WHERE artist.id = artist_album.artist_id
AND album.id = artist_album.album_id 
AND artist.name = 'Leia and the Ewoks';

SELECT count(id)
FROM artist;

SELECT count(track.id)
FROM track, album
WHERE album.title = "Super Dubstep Album"