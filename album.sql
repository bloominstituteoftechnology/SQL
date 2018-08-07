.mode column
.header on

-- show all albums
SELECT * FROM album;

--show all albums made between 1975-1990
SELECT * FROM album WHERE release_year > 1974 and release_year < 1991;

--Show all albums whose names start with Super D.
SELECT * FROM album WHERE title IS 'SUPER D';

--Show all albums that have no release year.
SELECT * FROM album WHERE release_year IS NULL;
