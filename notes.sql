PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS authors (
				name VARCHAR(128),
				author_id INTEGER PRIMARY KEY AUTOINCREMENT
);

CREATE TABLE IF NOT EXISTS notes (
				note_id INTEGER PRIMARY KEY AUTOINCREMENT,
				author_id INTEGER,
				content TEXT,
				created_at DATETIME DEFAULT (STRFTIME('%d-%m-%Y   %H:%M', 'NOW','localtime')),
        FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);

INSERT INTO authors(name) VALUES('Yasin Shuman');
INSERT INTO authors(name) VALUES('Big Bird');
INSERT INTO authors(name) VALUES('Cookie Monster');
INSERT INTO authors(name) VALUES('Donald Trump');
INSERT INTO authors(name) VALUES('Hillary Clinton');
INSERT INTO authors(name) VALUES('Bill Clinton');
INSERT INTO authors(name) VALUES('Melania Trump');

INSERT INTO notes(author_id, content) VALUES (1, 'Pick up dry cleaning');
INSERT INTO notes(author_id, content) VALUES (2, 'Play outside');
INSERT INTO notes(author_id, content) VALUES (3, 'Bake cookies!');
INSERT INTO notes(author_id, content) VALUES (4, 'Resign');
INSERT INTO notes(author_id, content) VALUES (5, 'Blame everyone but myself for being a shit candidate');
INSERT INTO notes(author_id, content) VALUES (6, 'hide from hillary');
INSERT INTO notes(author_id, content) VALUES (7, 'runaway with a new sugar daddy');

-- Write queries that select all notes by an author's name:
SELECT content FROM notes, authors WHERE notes.author_id = authors.author_id AND authors.name = 'Yasin Shuman';
-- Write queries that select author for a particular note by note ID:
SELECT name FROM authors, notes WHERE notes.author_id = authors.author_id AND notes.note_id = 3;
-- Write queries that select the names of all the authors along with the number of notes they each have (HINT: GROUP BY):
SELECT NAME, COUNT(*) FROM authors, notes WHERE authors.author_id = notes.author_id GROUP By authors.author_id;
--Write queries that delete authors from the author table:
DELETE FROM authors WHERE authors.author_id = 7;
--Write queries that select author for a particular note by note ID:
SELECT name FROM authors, notes WHERE notes.author_id = authors.author_id AND notes.note_id = 3;
