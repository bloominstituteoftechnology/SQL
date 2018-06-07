PRAGMA foreign_keys = ON; -- SQLite Only!

-- .mode columns;
-- .headers on;

DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS note;

CREATE TABLE note (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(128),
  content TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT(DATETIME()),
  last_modified TIMESTAMP NOT NULL DEFAULT(DATETIME()),
  author_id INTEGER REFERENCES author(id)
);

CREATE TABLE author (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(128) NOT NULL
);

INSERT INTO author (name) VALUES ("Timmy");
INSERT INTO author (name) VALUES ("Bimmy");
INSERT INTO author (name) VALUES ("Rimmy");
INSERT INTO author (name) VALUES ("Paul");

-- Timmy
INSERT INTO note (title, content, author_id) VALUES ("Timmy title 1", "Timmy content 1", 1);
INSERT INTO note (title, content, author_id) VALUES ("Timmy title 2", "Timmy content 2", 1);
INSERT INTO note (title, content, author_id) VALUES ("Timmy title 3", "Timmy content 3", 1);

-- Bimmy
INSERT INTO note (title, content, author_id) VALUES ("Bimmy title 1", "Bimmy content 1", 2);
INSERT INTO note (title, content, author_id) VALUES ("Bimmy title 2", "Bimmy content 2", 2);
INSERT INTO note (title, content, author_id) VALUES ("Bimmy title 3", "Bimmy content 3", 2);

-- Rimmy
INSERT INTO note (title, content, author_id) VALUES ("Rimmy title 1", "Rimmy content 1", 3);
INSERT INTO note (title, content, author_id) VALUES ("Rimmy title 2", "Rimmy content 2", 3);
INSERT INTO note (title, content, author_id) VALUES ("Rimmy title 3", "Rimmy content 3", 3);

-- Paul
INSERT INTO note (title, content, author_id) VALUES ("Paul title 1", "Paul content 1", 4);
INSERT INTO note (title, content, author_id) VALUES ("Paul title 2", "Paul content 2", 4);
INSERT INTO note (title, content, author_id) VALUES ("Paul title 3", "Paul content 3", 4);

-- Select all notes by an author's name.
SELECT note.* FROM note, author WHERE note.author_id = author.id AND author.name = "Timmy";

-- Select author for a particular note by note ID.
SELECT author.* FROM note, author
  WHERE author.id = note.author_id AND note.id = 11;
  
-- Select the names of all the authors along with the number of notes they each have. (Hint: GROUP BY.)
SELECT author.name, COUNT(note.title) FROM note, author
  WHERE note.author_id = author.id GROUP BY author.id;

-- Delete authors from the author table.
DELETE FROM note WHERE note.author_id = 2;
DELETE FROM author WHERE author.id = 2;

-- What happens when you try to delete an author with an existing note?
  -- foreign key error
-- How can you prevent this?
  -- delete the keys only