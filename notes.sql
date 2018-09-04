-- create an author table with needed data

create table author (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(128) NOT NULL
);

-- create a notes table including an autopopulated date field
-- and a foreign key referencing the author

create table note (
id INTEGER PRIMARY KEY AUTOINCREMENT,
title VARCHER(128) NOT NULL,
body VARCHAR(2056) NOT NULL,m
author_id INTEGER REFERENCES authod(id),
timestamp DATE DEFAULT (datetime('now', 'localtime'))
);

-- fill db with authors

INSERT INTO author VALUES ("Peter");
INSERT INTO author VALUES ("Klaus");
INSERT INTO author VALUES ("Margareth");
INSERT INTO author VALUES ("Ursula");
INSERT INTO author VALUES ("Petra");

-- fill db with notes

INSERT INTO note (title, body, author_id) VALUES("blubb1", "blalbalbab1", 1);
INSERT INTO note (title, body, author_id) VALUES("blubb2", "blalbalbab2", 2);
INSERT INTO note (title, body, author_id) VALUES("blubb3", "blalbalbab3", 3);
INSERT INTO note (title, body, author_id) VALUES("blubb4", "blalbalbab4", 4);
INSERT INTO note (title, body, author_id) VALUES("blubb5", "blalbalbab5", 5);
INSERT INTO note (title, body, author_id) VALUES("blubb6", "blalbalbab5", 1);
INSERT INTO note (title, body, author_id) VALUES("blubb7", "blalbalbab5", 2);

-- select all notes by author "Peter"

SELECT name, title, body,  timestamp FROM note, author
WHERE author.name = "Peter"
AND author.id = author_id;

-- select author of note nr 3 

SELECT author.name FROM author, note
WHERE note.id = 3 and
author.id = author_id;

-- count notes and group by author

SELECT name, count(title) FROM note, author
WHERE author.id = author_id
GROUP BY author.name;

-- delete author 

DELETE FROM author
WHERE name = "Peter";