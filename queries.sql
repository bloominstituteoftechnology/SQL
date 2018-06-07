

SELECT * FROM album
 WHERE title LIKE "Super D%";

SELECT * FROM album
 WHERE release_year IS NULL;

SELECT track.title FROM track, album
 WHERE track.album_id = album.id AND album.title = 'Super Funky Album';

SELECT track.title AS 'Track_Title' FROM  album, track
 WHERE track.album_id = album.id AND album.title = 'Super Funky Album';

SELECT album.title FROM album, artist, artist_album
 WHERE artist.name = "Han Solo" AND artist_album.artist_id = artist.id AND artist_album.album_id = album.id;

SELECT AVG(release_year) FROM album;

SELECT AVG(release_year) FROM album, artist, artist_album
    WHERE artist.name = 'Leia and the Ewoks'
    AND artist_album.artist_id = artist.id
    AND artist_album.album_id = album.id;

SELECT COUNT(*) FROM artist;

SELECT COUNT(*) FROM album, track 
 WHERE track.album_id = album.id AND album.title = 'Super Dubstep Album';
 