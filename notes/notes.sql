CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(128) NOT NULL, content VARCHAR(128), author_id INTEGER, time_stamp DATETIME DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY(author_id) REFERENCES author(id));

CREATE TABLE author (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(128), FOREIGN KEY(id) REFERENCES notes(author_id));

INSERT INTO notes (title, content, author_id) VALUES ("Week 12: Front-end Dev.", "There are various libraries you can utilize to build front-end of your website. Some includes bootstrap, React, etc.", 1);
INSERT INTO notes (title, content, author_id) VALUES ("Random title", "Random notes. Just scribling randomly.", 2);
INSERT INTO notes (title, content, author_id) VALUES ("Another random title", "Just another random writing to test the function of sqlite.", 2);
INSERT INTO notes (title, content, author_id) VALUES ("123", "4567890", 3);

INSERT INTO author (name) VALUES ("Guy");
INSERT INTO author (name) VALUES ("Another Guy");
INSERT INTO author (name) VALUES ("Keanu Reaves");

PRAGMA foreign_keys = ON;