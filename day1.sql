SELECT * FROM album;

SELECT * FROM album WHERE release_year >= 1975 AND release_year <= 1990;

SELECT * FROM album WHERE title LIKE 'Super D%';

SELECT * FROM album WHERE release_year IS NULL;

SELECT track.title FROM track,album WHERE album.title = 'Super Funky Album' AND album_id = album.id;

SELECT track.title AS Track_Title FROM track,album WHERE album_id = album.id AND album.title = 'Super Funky Album';

SELECT album.title FROM artist, artist_album, album WHERE artist.id = artist_id AND album.id = album_id AND artist.name= 'Han Solo';

SELECT AVG(release_year) FROM album;

SELECT AVG(release_year) FROM artist, album, artist_album WHERE artist.id = artist_album.artist_id AND album.id = artist_album.album_id AND artist.name = 'Leia and the Ewoks';

SELECT COUNT() FROM artist;

SELECT COUNT(track.id) FROM track, album WHERE track.album_id = album.id AND album.title = 'Super Dubstep Album';