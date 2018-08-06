-- Show all albums
SELECT title, release_year FROM album;
-- Show all albums made between 1975 and 1990.
SELECT title, release_year FROM album WHERE release_year BETWEEN 1795 AND 1990;
-- Show all albums whose names start with `Super D`.
SELECT title, release_year FROM album WHERE title GLOB "Super D*";
-- Show all albums that have no release year.
SELECT title FROM album WHERE release_year IS NULL;

-- Show all track titles from `Super Funky Album`.
SELECT track.title FROM track JOIN album ON track.album_id = album.id AND album.title IS "Super Funky Album";
-- Same query as above, but rename the column from `title` to `Track_Title` in the output.
SELECT track.title AS Track_Title, album.title AS Album FROM track JOIN album ON track.album_id = album.id AND album.title = "Super Funky Album";
-- Select all album titles by `Han Solo`.
SELECT album.title AS "Album Title", artist.name AS "Artist Name" FROM album JOIN artist_album ON album.id = artist_album.album_id JOIN artist ON artist.id = artist_album.artist_id AND artist.name IS "Han Solo";
-- Select the average year all albums were released.
SELECT printf("%d", avg(release_year)) AS "Average Release Year" FROM album;
-- Select the average year all albums by `Leia and the Ewoks` were released.
SELECT printf("%d", avg(release_year)) AS "Average Release Year" FROM album JOIN artist_album ON album.id = artist_album.album_id JOIN artist ON artist.id = artist_album.artist_id AND artist.name IS "Leia and the Ewoks";
-- Select the number of artists.
SELECT count() FROM artist;
-- Select the number of tracks on `Super Dubstep Album`.
SELECT count() FROM track JOIN album ON track.album_id = album.id AND album.title IS "Super Dubstep Album";