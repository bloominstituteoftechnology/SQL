--********************************       COMMANDS TO CREATE ALL TABLES FOR MUSIC DB       ************************************
CREATE TABLE track (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(128), album_id INTEGER REFERENCES album(id));
CREATE TABLE album (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(128) NOT NULL, release_year INT);
CREATE TABLE artist (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(128) NOT NULL);
CREATE TABLE artist_album (artist_id INTEGER REFERENCES artist(id), album_id INTEGER REFERENCES album(id));
PRAGMA foreign_keys=ON;
.read setup.sql
.headers on
.mode column
--*****************************************************************************************************************************

-- Write SQL `SELECT` queries that:
  -- Show all albums.
    SELECT * FROM album; 

  -- Show all albums made between 1975 and 1990. 
    SELECT * FROM album WHERE release_year BETWEEN 1975 AND 1990; --start & end inclusive
    SELECT * FROM album WHERE release_year > 1975 AND release_year < 1990 --start & end exclusive

  -- Show all albums whose names start with `Super D`.
    SELECT * FROM album WHERE title LIKE 'SUPER D%';

  -- Show all albums that have no release year. 
    SELECT * FROM album WHERE release_year IS NULL;

-- Write SQL `SELECT` queries that:
  -- Show all track titles from `Super Funky Album`.
    SELECT track.title FROM track, album WHERE track.album_id=album.id AND album.title='Super Funky Album';
    --resource: http://www1.udel.edu/evelyn/SQL-Class2/SQLclass2_2tblEg.html

  -- Same query as above, but rename the column from `title` to `Track_Title` in the output.
    SELECT track.title AS 'Track_Title' FROM track, album WHERE track.album_id=album.id AND album.title='Super Funky Album';
    --resource: https://www.w3schools.com/sql/sql_alias.asp

  -- Select all album titles by `Han Solo`.  
    SELECT album.title FROM album, artist, artist_album WHERE album.id=artist_album.album_id AND artist.id=artist_album.artist_id AND artist.name='Han Solo';

  -- Select the average year all albums were released. 
    SELECT AVG(release_year) FROM album;

  -- Select the average year all albums by `Leia and the Ewoks` were released. 
    SELECT AVG(release_year) FROM album al, artist ar, artist_album aa WHERE aa.artist_id=ar.id AND aa.album_id=al.id AND ar.name='Leia and the Ewoks'; 

  -- Select the number of artists.
    SELECT COUNT(id) FROM artist;
    --resource: https://www.lifewire.com/counting-values-with-sql-count-function-1019771

  -- Select the number of tracks on `Super Dubstep Album`.
    SELECT COUNT(track.id) FROM track , album  WHERE track.album_id=album.id AND album.title='Super Dubstep Album';