SELECT * FROM album;
SELECT *
    FROM album
    WHERE album.release_year >= 1975 AND album.release_year <= 1990;

SELECT *
    FROM album
    WHERE album.title LIKE 'Super D%';

SELECT *
    FROM album
    WHERE album.release_year IS NULL;

SELECT track.title
    FROM track, album
    WHERE album.id = track.album_id AND album.title = 'Super Funky Album';

SELECT track.title AS Track_Title
    FROM track, album
    WHERE album.id = track.album_id AND album.title = 'Super Funky Album';

SELECT album.title
    FROM album, artist, artist_album
    WHERE artist_album.album_id = album.id AND artist_album.artist_id = artist.id AND artist.name = 'Han Solo';

SELECT AVG(release_year)
    FROM album;

SELECT AVG(album.release_year)
    FROM album, artist, artist_album
    WHERE artist_album.album_id = album.id AND artist_album.artist_id = artist.id AND artist.name = 'Leia and the Ewoks';

SELECT COUNT(*)
    FROM artist;

SELECT COUNT(track.id)
    FROM track, album
    WHERE album.id = track.album_id AND album.title = 'Super Dubstep Album';