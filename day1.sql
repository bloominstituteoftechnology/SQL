SELECT * FROM album;

SELECT * FROM album WHERE release_year >= 1975 AND release_year <= 1990;

SELECT * FROM album WHERE title LIKE 'Super D%';

SELECT * FROM album WHERE release_year IS NULL;