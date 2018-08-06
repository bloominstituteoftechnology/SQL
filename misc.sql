SELECT title FROM track WHERE album_id IS (SELECT id FROM album WHERE title IS 'Super Funky Album');

SELECT title AS Track_Title FROM track WHERE album_id IS (SELECT id FROM album WHERE title IS 'Super Funky Album');

SELECT title FROM album WHERE album_id IS (SELECT id FROM artist_album WHERE artist_id IS (SELECT id FROM artist WHERE name IS 'Han Solo'));

