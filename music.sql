/*Launch into SQL database with specified DB file*/
sqlite3 22music.db

/*Foreign Key constraint on*/
PRAGMA foreign_keys = ON;

/* turn on column output to make it look pretty*/
.mode COLUMN

/*turns on headers so you can see columm header labels*/
.header ON

 /*Provided Tables*/
CREATE TABLE album (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(128) NOT NULL, release_year INTEGER);
CREATE TABLE artist (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(128) NOT NULL);

/*Make track table and artist_album m:m table*/
CREATE TABLE track(id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(128) NOT NULL, album_id INT REFERENCES album(id));
CREATE TABLE artist_album(artist_id INT REFERENCES artist(id), album_id INT REFERENCES album(id));

/* Load Data FROM setup.sql */
.read setup.sql

/* Write Queries */

/* Show all Albums */
SELECT * FROM album;
/* 
id          title                release_year
----------  -------------------  ------------
1           Super Awesome Album  1990
2           Super Funky Album
3           Super Disco Album    1978
4           Super Hairband Albu  1984
5           Super Dubstep Album
 */

/* Show all albums made between 1975 and 1990 */
SELECT * FROM album WHERE release_year > 1975 AND release_year < 1990;
/* 
id          title              release_year
----------  -----------------  ------------
3           Super Disco Album  1978
4           Super Hairband Al  1984
 */

/* Show all albums whose names start with Super D */
SELECT * FROM album WHERE album.title LIKE '%Super D%';
/* 
id          title              release_year
----------  -----------------  ------------
3           Super Disco Album  1978
5           Super Dubstep Alb
 */

/* Show all albums that have no release year */
SELECT * FROM album WHERE album.release_year IS NULL;
/* 
----------  -----------------  ------------
2           Super Funky Album
5           Super Dubstep Alb
 */

/* HARDER QUERIES */

/* Show all track titles FROM Super Funky Album */
SELECT * FROM track WHERE track.title LIKE '%Super Funky%'; /*isn't what we're looking for.*/

SELECT track.title FROM track, album WHERE track.album_id = album.id AND album.title = 'Super Funky Album';
/* 
title
-------------------
Super Funky Track 1
Super Funky Track 2
Super Funky Track 3
Super Funky Track 4
 */

/* Same as above, but rename column title to Track_Title in the output */
SELECT track.title as Track_Title FROM track, album WHERE track.album_id = album.id AND album.title = 'Super Funky Album';

/*SELECT all album titles by Han Solo*/
/*give me album titles where the artist is Han Solo, then using name you can get artist id then go to relational table and get the albums with that artist's id */
SELECT album.title FROM album, artist, artist_album WHERE artist.name = 'Han Solo' AND artist.id = artist_album.artist_id AND artist_album.album_id = album.id;
/*
title
-----------------
Super Disco Album
Super Hairband Al
*/

/*SELECT the average year all albums were released*/
SELECT AVG(release_year) FROM album;

/*
avg(release_year)
-----------------
1984.0
*/


/*SELECT the average year all albums by Leia and the Ewoks were released*/
SELECT AVG(release_year) FROM album, artist, artist_album WHERE artist.id = artist_album.artist_id AND album.id = artist_album.album_id AND artist.name = 'Leia and the Ewoks';
/*FROM lecture*/
SELECT AVG(release_year) FROM album  JOIN artist_album ON(album.id=artist_album.album_id) JOIN artist ON(artist.id = artist_album.artist_id) WHERE artist.name=“Leia and the Ewoks”;

/*
AVG(release_year)
-----------------
1990.0
*/


/*SELECT the number of Artists*/
SELECT COUNT(id) FROM artist;

/*
COUNT(id)
----------
3
*/


/*SELECT the number of tracks on Super Dubstep Album*/
SELECT COUNT(track.id) FROM track, album WHERE track.album_id = album.id AND album.title = 'Super Dubstep Album';

/*
COUNT(track.id)
---------------
5
*/