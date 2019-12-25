-- Create a database for taking notes.

PRAGMA foreign_keys = ON;

CREATE TABLE author(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_name VARCHAR(64) NOT NULL
);

CREATE TABLE note (
id INTEGER PRIMARY KEY AUTOINCREMENT,
title VARCHER(128) NOT NULL,
content VARCHAR(2056) NOT NULL,
author_id INTEGER REFERENCES author(id),
timestamp DATE DEFAULT (datetime('now', 'localtime'))
FOREIGN KEY(author_id) REFERENCES author(id) ON DELETE CASCADE
);

INSERT INTO author (author_name) VALUES ("David Loveday");
INSERT INTO author (author_name) VALUES ("Mcbed Abed");
INSERT INTO author (author_name) VALUES ("John Medina");
INSERT INTO author (author_name) VALUES ("Joseph Alagoa");

INSERT INTO note (title, content, author_id) VALUES ("Note by David", "This is a note by David", 1);
INSERT INTO note (title, content, author_id) VALUES("Note by Mcbed", "This is a note by Mcbed", 2);
INSERT INTO note (title, content, author_id) VALUES("Note by John", "This is a note by John", 3);
INSERT INTO note (title, content, author_id) VALUES("Note by Joseph", "This is a note by Joseph", 4);
INSERT INTO note (title, content, author_id) VALUES("Another by John", "This is a note by John", 3);
INSERT INTO note (title, content, author_id) VALUES("Another by David", "This is another note by David", 1);
INSERT INTO note (title, content, author_id) VALUES("Another by Mcbed", "This is another note by Mcbed", 2);

SELECT author_name, title, content,  timestamp FROM note, author
WHERE author.author_name = "Mcbed Abed"
AND author.id = author_id;

SELECT author.author_name FROM author, note
WHERE note.id = 3 and
author.id = author_id;

SELECT author_name, count(title) FROM note, author
WHERE author.id = author_id
GROUP BY author.author_name;

DELETE FROM author
WHERE name = "Note by Mcbed";