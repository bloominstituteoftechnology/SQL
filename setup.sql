.mode columm
.header on
.print ""

.print "Show all albums:"
SELECT * FROM album;
.print ""

.print "Show all albums made between 1975 and 1990:"
SELECT * FROM album WHERE release_year >= 1975 and release_year <= 1990;
.print ""

.print "Show all albums whose name starts with Super D:"
SELECT * FROM album WHERE title LIKE "Super D%";
.print ""

.print "Show all albums that have no release year:"
SELECT * FROM album WHERE release_year is NULL;
.print ""

.print "Show all track titles from `Super Funky Album:"
SELECT track.title from track, album 
    WHERE track.album_id = album_id and album_title = "Super Funky Album";
.print ""

.print "Show all track titles from `Super Funky Album:"
SELECT track.title as "Track Title" from track, album 
    WHERE track.album_id = album_id and album_title = "Super Funky Album";
.print ""

.print "Show all the album titles by Han Solo:"
SELECT title FROM album, artist_album
    WHERE album_id = album.id AND artist_id = 3;
.print ""

.print "Average year all albums released:"
SELECT AVG(release_year) AS "average" FROM album;
.print ""

.print "Average year all albums by Leia and Ewoks released:"
SELECT AVG(release_year) AS "average" FROM album, artist_album
    WHERE album_id = album.id AND artist_id = 2;

.print "Number of artists:"
SELECT COUNT(*) AS "count" FROM artist;
.print ""

.print "Number of track on Super Dubstep Album:"
SELECT COUNT(*) AS "count" FROM track, WHERE album_id = album.id AND album_id = 5;





INSERT INTO album (title, release_year) VALUES ("Super Awesome Album", 1990);
INSERT INTO album (title) VALUES ("Super Funky Album");
INSERT INTO album (title, release_year) VALUES ("Super Disco Album", 1978);
INSERT INTO album (title, release_year) VALUES ("Super Hairband Album", 1984);
INSERT INTO album (title) VALUES ("Super Dubstep Album");

INSERT INTO artist (name) VALUES ("Luke and the Droidtones");
INSERT INTO artist (name) VALUES ("Leia and the Ewoks");
INSERT INTO artist (name) VALUES ("Han Solo");

INSERT INTO artist_album (artist_id, album_id) VALUES (1, 5);
INSERT INTO artist_album (artist_id, album_id) VALUES (1, 2);
INSERT INTO artist_album (artist_id, album_id) VALUES (2, 1);
INSERT INTO artist_album (artist_id, album_id) VALUES (2, 2);
INSERT INTO artist_album (artist_id, album_id) VALUES (3, 3);
INSERT INTO artist_album (artist_id, album_id) VALUES (3, 4);

INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 1", 1);
INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 2", 1);
INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 3", 1);
INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 4", 1);
INSERT INTO track (title, album_id) VALUES ("Super Awesome Track 5", 1);

INSERT INTO track (title, album_id) VALUES ("Super Funky Track 1", 2);
INSERT INTO track (title, album_id) VALUES ("Super Funky Track 2", 2);
INSERT INTO track (title, album_id) VALUES ("Super Funky Track 3", 2);
INSERT INTO track (title, album_id) VALUES ("Super Funky Track 4", 2);

INSERT INTO track (title, album_id) VALUES ("Super Disco Track 1", 3);
INSERT INTO track (title, album_id) VALUES ("Super Disco Track 2", 3);
INSERT INTO track (title, album_id) VALUES ("Super Disco Track 3", 3);

INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 1", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 2", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 3", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 4", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 5", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 6", 4);
INSERT INTO track (title, album_id) VALUES ("Super Hairband Track 7", 4);

INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 1", 5);
INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 2", 5);
INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 3", 5);
INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 4", 5);
INSERT INTO track (title, album_id) VALUES ("Super Dubstep Track 5", 5);