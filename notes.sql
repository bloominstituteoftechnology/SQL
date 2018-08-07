CREATE TABLE Notes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER REFERENCES authors(id),
  title VARCHAR,
  content TEXT,
  created_on DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Authors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(125),
  last_name VARCHAR(125)
);


-- Insert authors to the author table.
INSERT INTO Authors(first_name, last_name) VALUES ("Jeffrey", "Flynn");
INSERT INTO Authors(first_name, last_name) VALUES ("Burt", "Macklin");
INSERT INTO Authors(first_name, last_name) VALUES ("Issiah", "Kimmel");


-- Insert notes to the note table.
INSERT INTO Notes(author_id, title, content) VALUES (1, "Note #1", "Great content");
INSERT INTO Notes(author_id, title, content) VALUES (1, "Note #2", "Sweet!");
INSERT INTO Notes(author_id, title, content) VALUES (1, "Note #3", "Suppp.");


-- Select all notes by an author's name.
SELECT title, content FROM Notes, Authors
  WHERE Notes.author_id = Authors.id 
  AND Authors.first_name = "Jeffrey";


-- Select author for a particular note by note ID.
SELECT first_name, last_name FROM Authors, Notes
  WHERE Notes.author_id = Authors.id
  AND Notes.id = 2;


-- Select the names of all the authors along with the number of notes they each have. (Hint: `GROUP BY`.)
SELECT first_name, last_name, COUNT(*) FROM Authors, Notes
  WHERE Authors.id = Notes.author_id
  GROUP BY Authors.id;


-- Delete authors from the author table.
DELETE FROM Authors WHERE Authors.id = 3;