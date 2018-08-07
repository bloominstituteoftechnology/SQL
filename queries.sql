SELECT * FROM album;

SELECT * FROM album WHERE album.release_year BETWEEN 1975 AND 1990;

SELECT * FROM album WHERE album.title LIKE 'Super D%';

SELECT title FROM album WHERE album.release_year is NULL;

SELECT title FROM track WHERE album_id = 2;

SELECT title FROM track AS "Track_Title" WHERE album_id = 2;

SELECT album.title FROM album WHERE artist.name is 'Han Solo';

SELECT AVG(release_year) FROM album;

SELECT AVG(release_year) FROM album WHERE artist = 'Leia and the Ewoks';

SELECT COUNT(*) FROM artist;

SELECT COUNT(*) FROM track, album WHERE album_id = 5 AND album_id = album.id;

