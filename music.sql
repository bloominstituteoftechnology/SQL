/*specify persistent DB file*/
sqlite3 music.db

PRAGMA foreign_keys = ON
.mode COLUMN
.header ON

/*CREATE TABLEs*/
CREATE TABLE album (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(128) NOT NULL, release_year INTEGER);

CREATE TABLE artist (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(128) NOT NULL);

CREATE TABLE track(id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(128) NOT NULL, album_id INT REFERENCES album(id));

CREATE TABLE artist_album(artist_id INT REFERENCES artist(id), album_id INT REFERENCES album(id));

/*Populate tables*/
.read setup.sql

/*Queries*/
/*Show all albums*/
/*Show all albums made between 1975 and 1990*/
/*Show all albums whose name starts with Super D*/
/*Show all albums than have no release year*/
/*Show all track titles from Super Funky Album*/
/*Same as above but rename the column from title to Track_title in the output*/
/*Select all album titles by Han Solo*/
/*Select the average year all albums were released*/
/*Select the average year all albums by Leia and the Ewoks were released*/
/*Select the number of artists*/
/*Select the number of tracks on Super Dubstep Album*/
