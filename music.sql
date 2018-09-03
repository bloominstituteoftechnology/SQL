sqlite3 musicdb.db          -- Specify a persistent DB file 

PRAGMA foreign_keys = ON;   -- The library is compiled with foreign keys enabled. 
.mode COLUMN
.header ON

/********* CREATE TABLES **********/
CREATE TABLE album (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, title VARCHAR(128) NOT NULL, release_year INTEGER);
CREATE TABLE artist (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name VARCHAR(128) NOT NULL);
CREATE TABLE track (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, title VARCHAR(128) NOT NULL, album_id INTEGER REFERENCES album(id));
CREATE TABLE artist_album (artist_id INTEGER REFERENCES artist(id), album_id INTEGER REFERENCES album(id));


