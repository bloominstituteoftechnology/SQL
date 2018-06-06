.mode column
.header on
.print ""

.print "Show all albums:"
SELECT * FROM album;
.print ""

.print "Show all albums made between 1975 and 1990:"
SELECT * FROM album WHERE release_year >= 1975 AND release_year <= 1990;
.print ""

.print "Show all albums whose name starts with Super D:"
SELECT * FROM album WHERE title LIKE "Super D%";
.print ""

.print "Show all albums that have no release year:"
SELECT * FROM album WHERE release_year IS NULL;
.print ""