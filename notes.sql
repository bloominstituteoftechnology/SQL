CREATE TABLE notes( id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(128) NOT NULL, body VARCHAR(256) , Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP, author_ID INT REFERENCES author(id));

CREATE TABLE author( id INTEGER PRIMARY KEY AUTOINCREMENT, name varchar(128) NOT NULL);

INSERT INTO author (name) VALUES ("john green");
INSERT INTO author (name) VALUES ("hank green");
INSERT INTO author (name) VALUES ("samarv");

INSERT INTO notes (title, body, author_ID) VALUES ("title goes here", "body here", 1);
INSERT INTO notes (title, body, author_ID) VALUES ("title goes here", "body here", 1);
INSERT INTO notes (title, body, author_ID) VALUES ("title goes here", "body here", 1);

SELECT * FROM notes,author WHERE author.name = "john green" AND author.id = author_id;

SELECT * FROM notes,author WHERE notes.id = 1  AND author.id = author_id;


SELECT COUNT(author_id),author.name  
  FROM author, notes 
  WHERE author.id = notes.author_id
  GROUP BY author.name; 

PRAGMA foreign_keys = ON;
DELETE FROM author WHERE name = "samarv";

