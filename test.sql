SELECT track.title FROM track, album
 WHERE track.album_id = album.id AND album.title = 'Super Funky Album';

SELECT track.title AS 'Track_Title' FROM  album, track
 WHERE track.album_id = album.id AND album.title = 'Super Funky Album';
