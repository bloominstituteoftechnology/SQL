-- PRAGMA foreign_keys = ON;

CREATE TABLE author (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL
);

CREATE TABLE note (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    content VARCHAR(140) NOT NULL,
    posted TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    author_id INTEGER NOT NULL
    -- FOREIGN KEY(author_id) REFERENCES author(id)
);

--Insert authors to the author table.
INSERT INTO author (name) VALUES ("Alfredo");
INSERT INTO author (name) VALUES ("Big Bobby B");
INSERT INTO author (name) VALUES ("Renly (the One True King)");

--Insert notes to the note table.
INSERT INTO note (content, author_id) VALUES ("I like tortillas", 1);
INSERT INTO note (content, author_id) VALUES ("I like cheese", 2);
INSERT INTO note (content, author_id) VALUES ("I like sushi", 2);
INSERT INTO note (content, author_id) VALUES ("Tacos are bae", 2);
INSERT INTO note (content, author_id) VALUES ("Taco sauce = Sundae", 3);


--Select all notes by an author's name.
SELECT * FROM note, author
WHERE note.author_id = author.id
AND author.name = 'Big Bobby B';

--Select author for a particular note by note ID.
SELECT author.name FROM author, note
WHERE note.author_id = author.id
AND note.id = 1;

--Select the names of all the authors along with the number of notes they each have. (Hint: GROUP BY.)
SELECT author.name, COUNT(author_id) FROM note, author
WHERE note.author_id = author.id
GROUP BY author.name;

--Delete authors from the author table.
-- DELETE FROM author WHERE id = 1;
-- DELETE FROM author WHERE id = 2;
-- DELETE FROM author WHERE id = 3;
DELETE FROM author;