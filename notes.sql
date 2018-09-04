/*create a persistent DB file*/
sqlite3 notes.db

/*Turns on foreign key constraints*/
PRAGMA foreign_keys = ON

/*Turn on column out put and headers for `SELECT`*/
.mode COLUMN
.header ON

/*CREATE TABLES*/
CREATE TABLE author(
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    first_name VARCHAR(128) NOT NULL, 
    last_name VARCHAR(128) NOT NULL
);

CREATE TABLE note (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    title VARCHAR(128) NOT NULL, 
    content VARCHAR(255) NOT NULL, 
    author_id INT REFERENCES author(id), 
    created_on DATETIME DEFAULT CURRENT_TIMESTAMP, 
    last_modified DATETIME DEFAULT CURRENT_TIMESTAMP
);

/*QUERIES*/
INSERT INTO author (first_name, last_name) VALUES ("Edgar", "Poe");
INSERT INTO author (first_name, last_name) VALUES ("Mark", "Twain");
INSERT INTO author (first_name, last_name) VALUES ("George", "Orwell");
INSERT INTO author (first_name, last_name) VALUES ("Michael", "Chrichton");
INSERT INTO author (first_name, last_name) VALUES ("Daniel", "Lazare");
INSERT INTO author (first_name, last_name) VALUES ("Gore", "Vidal");

