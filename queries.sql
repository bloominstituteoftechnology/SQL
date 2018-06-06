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

.print "Show all track titles from Super Funky Album:"
SELECT title FROM track WHERE album_id = 2;
.print ""

.print "Show all track titles from Super Funky Album with Track_Title as column name:"
SELECT title AS Track_Title FROM track WHERE album_id = 2;
.print ""

.print "All album titles by Han Solo:"
SELECT title FROM album, artist_album, artist
  WHERE album_id = album.id AND artist_id = artist.id AND artist_id = 3;
.print ""

.print "Average year all albums released:"
SELECT AVG(release_year) AS "average" FROM album;
.print ""

.print "Average year all albums by Leia and the Ewoks released:"
SELECT AVG(release_year) AS "average" FROM album, artist_album, artist
  WHERE album_id = album.id AND artist_id = artist.id AND artist_id = 2;
.print ""

.print "Number of artists:"
SELECT COUNT(*) AS "count" FROM artist;
.print ""

.print "Number of tracks on Super Dubstep Album:"
SELECT COUNT(*) AS "count" FROM track, album WHERE album_id = album.id AND album.id = 5;