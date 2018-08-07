SELECT * FROM album;

SELECT * FROM album WHERE album.release_year BETWEEN 1975 AND 1990;

SELECT * FROM album WHERE album.title LIKE 'Super D%';

SELECT title FROM album WHERE album.release_year is NULL;

SELECT title FROM track WHERE album_id = 2;

SELECT title FROM track AS "Track_Title" WHERE album_id = 2;

SELECT * FROM album.title WHERE artist = 'Han Solo';

SELECT AVG FROM release_year;

SELECT AVG FROM release_year WHERE artist = 'Leia and the Ewoks';

SELECT COUNT FROM artist;

SELECT COUNT FROM tracks WHERE album.title = 'Super Dubstep Album';

