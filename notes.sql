PRAGMA foreign_keys = ON; --enable foreign key constraints for sqlite

CREATE DATABASE notes;
USE notes;

CREATE TABLE note (id INT AUTOINCREMENT PRIMARY KEY, title VARCHAR(128) NOT NULL, content VARCHAR(255), created_on DATETIME, author_id INT, FOREIGN KEY(author_id) REFERENCES author(id));

CREATE TABLE author (id INT AUTOINCREMENT PRIMARY KEY, name VARCHAR(128) NOT NULL);

-- Insert Queries
INSERT INTO note (title, content, author_id) VALUES ('First Note', 'Sample note test', 1);

INSERT INTO author (name) VALUES ('John Doe');

-- Select Queries
SELECT * FROM note, author WHERE note.author_id = author.id AND author.name = "John Doe";

SELECT author.name FROM author, note WHERE note.author_id = author.id AND note.id = 1;

SELECT author.name, COUNT(*) FROM author, note WHERE author.id = note.author_id GROUP BY author.id;

-- Delete Queries
DELETE FROM author WHERE id = 1;