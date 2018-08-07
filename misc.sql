.mode column
.header on

SELECT title FROM track WHERE album_id IS (SELECT id FROM album WHERE title IS 'Super Funky Album');

SELECT title AS Track_Title FROM track WHERE album_id IS (SELECT id FROM album WHERE title IS 'Super Funky Album');

SELECT title FROM album WHERE id IS (SELECT album_id FROM artist_album WHERE artist_id IS (SELECT id FROM artist WHERE name IS 'Han Solo'));

SELECT AVG(release_year) AS AVERAGE_YEAR_THING FROM album;

SELECT AVG(release_year) AS AVERAGE_YEAR_THING FROM album WHERE id IS (SELECT album_id FROM artist_album WHERE artist_id IS (SELECT id FROM artist WHERE name IS 'Leia and the Ewoks'));

SELECT COUNT(*) as Total_Artists FROM artist;

SELECT COUNT(title) as Number_Of_Tracks FROM track WHERE album_id IS (SELECT id FROM album WHERE title IS 'Super Dubstep Album');
