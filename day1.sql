-- Show all albums.
SELECT * FROM album;

-- Show all albums made between 1975 and 1990.
SELECT * FROM album
WHERE (release_year <= 1990)
AND (release_year >= 1975);

-- Show all albums whose names start with `Super D`.
SELECT * FROM album
WHERE title LIKE "Super D%";

-- Show all albums that have no release year.
SELECT * FROM album
WHERE release_year IS NULL;


-- Show all track titles from `Super Funky Album`.

SELECT track.title FROM track,album 
WHERE album.title = 'Super Funky Album' 
AND album_id = album.id;

-- Same query as above, but rename the column from `title` to `Track_Title` in the output.

SELECT track.title AS Track_Title
FROM track,album 
WHERE album.title = 'Super Funky Album' 
AND album_id = album.id

-- Select all album titles by `Han Solo`.
AND artist.name= 'Han Solo';

SELECT * FROM artist, artist_album 
WHERE artist.id = artist_id 

-- Select the average year all albums were released.
SELECT avg(release_year)
FROM album;

-- Select the average year all albums by `Leia and the Ewoks` were released.

SELECT AVG(release_year) 
FROM artist, album, artist_album 
WHERE artist.id = artist_album.artist_id
AND album.id = artist_album.album_id 
AND artist.name = 'Leia and the Ewoks';

-- Select the number of artists

SELECT count(id)
FROM artist;

-- Select the number of tracks on `Super Dubstep Album`.

SELECT count(track.id)
FROM track, album
WHERE album.title = "Super Dubstep Album";