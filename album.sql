.mode column
.header on

SELECT * FROM album;

SELECT * FROM album where release_year > 1974 and release_year < 1991;

SELECT * FROM album where title IS 'SUPER D';

SELECT * FROM album where release_year IS NULL;