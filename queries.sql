-- Show all albums
select * from album;

-- Show all albums made between 1975 and 1990.
select * from album where release_year>=1975 and release_year <= 1990

-- Show all albums whose names start with Super D
SELECT * FROM album WHERE title LIKE "Super D%";

-- Show all albums that have no release year.
select * from album where release_year is null

-- Show all track titles from Super Funky Album.
select track.title  from track, album
    where track.album_id = album.id and album.title = "Super Funky Album";

-- Same query as above, but rename the column from title to Track_Title in the output.
select track.title as "Track Title" from track, album
    where track.album_id = album.id and album.title = "Super Funky Album";

-- Select all album titles by Han Solo
select album.title from album, artist_album, artist
where artist_album.album_id = album.id and
artist_album.artist_id = artist.id and
artist.name = "Han Solo"

-- Select the average year all albums were released.
select AVG(release_year) from album

-- Select the average year all albums by Leia and the Ewoks were released
select AVG(release_year) from album, artist_album, artist
where artist_album.artist_id = artist.id and
artist_album.album_id = album.id and
artist.name = "Leia and the Ewoks"


-- Select the number of artists.
select count(*) from artist