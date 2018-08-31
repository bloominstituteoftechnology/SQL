Write SQL SELECT queries that:

Show all albums.
select * from album;

Show all albums made between 1975 and 1990.
select * from album where release_year between 1975 and 1990;

Show all albums whose names start with Super D.
select * from album where title like 'Super D%';

Show all albums that have no release year.
select * from album where release_year is null;


Write SQL SELECT queries that:

Show all track titles from Super Funky Album.
select track.title from track, album where track.album_id = album.id and album.title = 'Super Funky Album';

Same query as above, but rename the column from title to Track_Title in the output.
select track.title as Track_Title from track, album where track.album_id = album.id and album.title = 'Super Funky Album';

Select all album titles by Han Solo.
SELECT album.title FROM album, artist_album, artist WHERE artist_album.album_id = album.id AND artist_album.artist_id = artist.id AND artist.name = "Han Solo";

Select the average year all albums were released.
SELECT AVG(release_year) FROM album;

Select the average year all albums by Leia and the Ewoks were released.
SELECT AVG(release_year) FROM album, artist_album, artist
    WHERE artist_album.artist_id = artist.id
    AND artist_album.album_id = album.id
    AND artist.name = "Leia and the Ewoks";

Select the number of artists.
SELECT COUNT(id) FROM artist;

Select the number of tracks on Super Dubstep Album.
SELECT COUNT(*) FROM track, album
	WHERE track.album_id = album.id
	AND album.title = 'Super Dubstep Album';