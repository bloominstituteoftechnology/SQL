sqlite3 musicdb.db          -- Specify a persistent DB file 

PRAGMA foreign_keys = ON;   -- The library is compiled with foreign keys enabled. 
.mode COLUMN
.header ON


/********* CREATE TABLES **********/
CREATE TABLE album (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, title VARCHAR(128) NOT NULL, release_year INTEGER);
CREATE TABLE artist (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name VARCHAR(128) NOT NULL);
CREATE TABLE track (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, title VARCHAR(128) NOT NULL, album_id INTEGER REFERENCES album(id));
CREATE TABLE artist_album (artist_id INTEGER REFERENCES artist(id), album_id INTEGER REFERENCES album(id));


/********* Run the queries in the file `setup.sql` to populate the tables **********/
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


/********* SELECT queries *********/

/********* Show all albums *********/

SELECT * FROM album;
id          title                release_year
----------  -------------------  ------------
1           Super Awesome Album  1990        
2           Super Funky Album                
3           Super Disco Album    1978        
4           Super Hairband Albu  1984        
5           Super Dubstep Album


/******** Show all albums made between 1975 and 1990 *********/

SELECT * FROM album WHERE release_year BETWEEN 1975 AND 1990;   -- inclusive begin and end value
SELECT * FROM album WHERE release_year >= 1975 AND release_year <= 1990;    -- BETWEEN is shorthand for >= AND <=
id          title                release_year
----------  -------------------  ------------
1           Super Awesome Album  1990        
3           Super Disco Album    1978        
4           Super Hairband Albu  1984 


/********* Show all albums whose names start with Super D *********/

SELECT * FROM album WHERE title LIKE 'Super D%';
id          title              release_year
----------  -----------------  ------------
3           Super Disco Album  1978        
5           Super Dubstep Alb  


/********* Show all albums that have no release year *********/

SELECT * FROM album WHERE release_year IS NULL;
id          title              release_year
----------  -----------------  ------------
2           Super Funky Album              
5           Super Dubstep Alb 


/********* Show all track titles from Super Funky Album *********/

SELECT track.title 
FROM track, album 
WHERE track.album_id = album.id 
AND album.title = 'Super Funky Album';

title              
-------------------
Super Funky Track 1
Super Funky Track 2
Super Funky Track 3
Super Funky Track 4


/********* Same query as above, but rename the column from title to Track_Title in the output *********/

SELECT track.title 
AS Track_Title 
FROM track, album 
WHERE track.album_id = album.id 
AND album.title = 'Super Funky Album';

Track_Title        
-------------------
Super Funky Track 1
Super Funky Track 2
Super Funky Track 3
Super Funky Track 4


/********* Select all album titles by Han Solo *********/

SELECT album.title 
FROM artist, album, artist_album 
WHERE artist_album.album_id = album.id
AND artist_album.artist_id = artist.id
AND artist.name = 'Han Solo';

title            
-----------------
Super Disco Album
Super Hairband Al


/********* Select the average year all albums were released *********/

SELECT AVG(release_year) FROM album;

AVG(release_year)
-----------------
1984.0 


/********* Select the average year all albums by Leia and the Ewoks were released *********/

SELECT AVG(release_year) 
FROM artist, album, artist_album
WHERE artist_album.album_id = album.id
AND artist_album.artist_id = artist.id
AND artist.name = 'Leia and the Ewoks';

AVG(release_year)
-----------------
1990.0 


/********* Select the number of artists *********/

SELECT COUNT(id) FROM artist;

COUNT(id) 
----------
3


/********* Select the number of tracks on Super Dubstep Album *********/

SELECT COUNT(track.title)
FROM track, album
WHERE track.album_id = album.id
AND album.title = 'Super Dubstep Album';

COUNT(track.title)
------------------
5 


