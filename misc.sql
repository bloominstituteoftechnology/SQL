.mode COLUMN
.header ON

-- Show all track titles from Super Funky Album
SELECT title FROM track WHERE album_id IS (SELECT id FROM album WHERE title IS 'Super Funky Album');

-- Same query as above, but rename the column from title to Track_Title in the output
SELECT title as Track_Title FROM track WHERE album_id IS (SELECT id FROM album WHERE title IS 'Super Funky Album');

-- Select all album titles by Han Solo
SELECT title AS Han_Solo_Tracks FROM track WHERE album_id IS (
    SELECT album_id FROM artist_album WHERE artist_id IS 
(SELECT id FROM artist WHERE name IS 'Han Solo')
);

-- Select the average year all albums were released
SELECT AVG(release_year) AS Average_Release_Year FROM album;

-- Select the average year all albums by Leia and the Ewoks were released
SELECT AVG(release_year) as Average_Release_Year_By_Leia FROM album WHERE id IS (
    SELECT album_id FROM artist_album WHERE artist_id IS (SELECT id FROM artist WHERE name IS 'Leia and the Ewoks')
);

-- Select the number of artists
SELECT COUNT(name) as Number_Of_Artists FROM artist;

-- Select the number of tracks on Super Dubstep Album
SELECT COUNT(title) as Number_Of_Tracks_On_Super_Dubstep_Album FROM track WHERE album_id IS (
    SELECT id FROM album WHERE title IS 'Super Dubstep Album'
);