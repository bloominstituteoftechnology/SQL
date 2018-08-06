-- Show all albums
select * from album;

-- Show all albums made between 1975 and 1990.
select * from album where release_year>=1975 and release_year <= 1990



-- Show all albums that have no release year.
select * from album where release_year is null

-- Show all track titles from Super Funky Album.
select track.title  from track, album
    where track.album_id = album.id and album.title = "Super Funky Album";

-- Same query as above, but rename the column from title to Track_Title in the output.
select track.title as "Track Title" from track, album
    where track.album_id = album.id and album.title = "Super Funky Album";

