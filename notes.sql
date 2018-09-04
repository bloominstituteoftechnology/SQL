-- Create a database for taking notes.

PRAGMA foreign_keys = ON;

create table author (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(64) NOT NULL
);

create table note (
id INTEGER PRIMARY KEY AUTOINCREMENT,
title VARCHER(128) NOT NULL,
content VARCHAR(2056) NOT NULL,
author_id INTEGER REFERENCES author(id),
timestamp DATE DEFAULT (datetime('now', 'localtime'))
);

INSERT INTO author (name) VALUES ("Fausto Fraga");
INSERT INTO author (name) VALUES ("Peter Parker");
INSERT INTO author (name) VALUES ("Kyle Busch");
INSERT INTO author (name) VALUES ("Amelia Badelia");


INSERT INTO note (title, content, author_id) VALUES ("Note by Fausto", "fhkjashfjkasfhasfh", 1);
INSERT INTO note (title, content, author_id) VALUES("Note by me", "blalbjjdsjdf ldlfaskf albab2", 2);
INSERT INTO note (title, content, author_id) VALUES("Esto es espanol", "jfhfhf sskdsksk slsksks", 3);
INSERT INTO note (title, content, author_id) VALUES("My note", "jfjfjfj sllsls lsldkf", 4);
INSERT INTO note (title, content, author_id) VALUES("The best book", "kfk ldsldkl msdmdm", 3);
INSERT INTO note (title, content, author_id) VALUES("Always good", "ksksk dskdkdk", 1);
INSERT INTO note (title, content, author_id) VALUES("I like ham", "poquque pspdkd ", 2);


SELECT name, title, content,  timestamp FROM note, author
WHERE author.name = "Peter Parker"
AND author.id = author_id;


SELECT author.name FROM author, note
WHERE note.id = 3 and
author.id = author_id;


SELECT name, count(title) FROM note, author
WHERE author.id = author_id
GROUP BY author.name;


DELETE FROM author
WHERE name = "Peter Parker";