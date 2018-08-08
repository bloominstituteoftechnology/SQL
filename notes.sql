PRAGMA foreign_keys = ON; --enable foreign key constraints for sqlite

CREATE DATABASE notes;
USE notes;

CREATE TABLE note (id INT AUTOINCREMENT PRIMARY KEY, title VARCHAR(128) NOT NULL, content VARCHAR(255), created_on DATETIME, author_id INT, FOREIGN KEY(author_id) REFERENCES author(id));

CREATE TABLE author (id INT AUTOINCREMENT PRIMARY KEY, name VARCHAR(128) NOT NULL);