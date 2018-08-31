/* In ~/sqliterc file, I added:
PRAGMA foreign_keys = ON;
.header on
.mode column
*/

/* CREATE A MUSIC DATABASE */
/* Create album table */
CREATE TABLE album (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(128) NOT NULL, release_year INTEGER);

/* Create artist table */
CREATE TABLE artist (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(128) NOT NULL);

/* Create track table */
CREATE TABLE track (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(200), album_id INT REFERENCES album(id));

/* Create artist_album table */
CREATE TABLE artist_album (artist_id INT REFERENCES artist(id), album_id INT REFERENCES album(id));

/* Populate database with setup.sql data */
/*      .quit
        sqlite3 data.db < setup.sql     */



