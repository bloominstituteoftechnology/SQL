PRAGMA foreign_keys = ON;

SELECT * FROM album;
SELECT * FROM album 
    WHERE release_year BETWEEN 1975 AND 1990;
SELECT * FROM album WHERE title LIKE 'Super D%';
SELECT * FROM album WHERE release_year IS NULL;

SELECT track.title FROM track, album
    WHERE track.album_id = album.id
    AND album.title = 'Super Funky Album';

SELECT track.title AS Track_Title FROM track, album
    WHERE track.album_id = album.id
    AND album.title = 'Super Funky Album';

SELECT album.title FROM album, artist, artist_album
    WHERE artist_album.artist_id = artist.id
    AND artist_album.album_id = album.id
    AND artist.name = 'Han Solo';

SELECT AVG(release_year) FROM album;

SELECT AVG(release_year) FROM album, artist, artist_album
    WHERE artist_album.artist_id = artist.id
    AND artist_album.album_id = album.id
    AND artist.name = 'Leia and the Ewoks';

SELECT COUNT(*) FROM artist;

SELECT COUNT(*) FROM album JOIN track
    WHERE track.album_id = album.id
    AND album.title = 'Super Dubstep Album';