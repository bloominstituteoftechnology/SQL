SELECT * FROM album;

SELECT title FROM album WHERE release_year BETWEEN 1975 AND 1990;

SELECT title FROM album WHERE title LIKE 'Super%D';

SELECT title FROM album WHERE release_year = NULL;

SELECT * FROM album WHERE track IN 'Super Funky Album';

SELECT * FROM album WHERE Track_Title IN 'Super Funky Album';

SELECT * FROM album.title WHERE artist = 'Han Solo';

SELECT AVG FROM release_year;

SELECT AVG FROM release_year WHERE artist = 'Leia and the Ewoks';

SELECT COUNT FROM artist;

SELECT COUNT FROM tracks WHERE album.title = 'Super Dubstep Album';

