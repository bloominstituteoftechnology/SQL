-- Show all albums
SELECT * FROM albums;

-- Show all albums made between 1975 and 1990.
SELECT * FROM album WHERE release_year>=1975 and release_year<=1990;

-- Show all albums whose names start with Super D
SELECT * FROM album WHERE title LIKE 'D%';

-- Show all albums that have no release year
SELECT * FROM album WHERE release_year is null;

-- Show all track titles from Super Funky Album
SELECT track.title FROM track, album WHERE track.album_id = album_id and album.title = 'Super Funky Album';

-- Same query as above, but rename the column from title to Track_Title in the output
SELECT track.title AS Track_Title from track, album WHERE track.album_id = album_id and album.title = 'Super Funky Album';

-- Select all album titles by Han Solo
SELECT album.title FROM album, artist_album, artist WHERE artist_album.albumID = albumID and artist_album.artist_id = artist.id and artist.name = 'Han Solo';

-- Select the average year all albums were released
SELECT AVG(release_year) FROM album

-- Select the average year all albums by Leia and the Ewoks were released
select AVG(release_year) from album, artist_album, artist
where artist_album.artist_id = artist.id and
artist_album.albumID = album.id and
artist.name = "Leia and the Ewoks";

-- Select the number of artists
SELECT count(*) FROM artist;

-- Select the number of tracks on Super Dubstep Album
SELECT COUNT(*) FROM track, album
    WHERE track.albumID = album.id AND
    album.title = "Super Dubstep Album";