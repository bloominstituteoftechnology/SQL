.mode column
.header on
-- Show all albums.
SELECT * FROM album;

-- Show all albums made between 1975 and 1990.
SELECT * FROM album where release_year > 1975 and release_year <= 1990;

-- Show all albums whose names start with Super D.
SELECT * FROM album where title LIKE 'Super D%';

-- Show all albums that have no release year.
SELECT * FROM album where release_year IS NULL;