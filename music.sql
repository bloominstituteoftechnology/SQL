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

/* Load Data from setup.sql */
.read setup.sql

/* Write Queries */

/* Show all Albums */
SELECT * from album;
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
SELECT * from album WHERE release_year > 1975 AND release_year < 1990;
/* 
id          title              release_year
----------  -----------------  ------------
3           Super Disco Album  1978
4           Super Hairband Al  1984
 */

/* Show all albums whose names start with Super D */
SELECT * from album WHERE album.title LIKE '%Super D%';
/* 
id          title              release_year
----------  -----------------  ------------
3           Super Disco Album  1978
5           Super Dubstep Alb
 */

/* Show all albums that have no release year */
SELECT * from album WHERE album.release_year IS NULL;
/* 
----------  -----------------  ------------
2           Super Funky Album
5           Super Dubstep Alb
 */

/*  */

/*  */

/*  */

/*  */


/**/



/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/