PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS notes;
DROP TABLE IF EXISTS author;

CREATE TABLE note (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    content VARCHAR(1024),
    author_id INTEGER REFERENCES author(id),
  -- created_at TIMESTAMP NOT NULL DEFAULT(DATETIME()),
   -- last_modified TIMESTAMP NOT NULL DEFAULT(DATETIME()),
    -- created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE author (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL
);

INSERT INTO author (name) VALUES ('Dixie');
INSERT INTO author (name) VALUES ('Edmund');

INSERT INTO note (title, content, author_id) VALUES ('First Note', 'Yay, first note from Dixie', 1);
INSERT INTO note (title, content, author_id) VALUES ('First Note', 'Yay, first note from Edmun', 2);
INSERT INTO note (title, content, author_id) VALUES ('Second Note', 'Yay, second note from Dixie', 1);
INSERT INTO note (title, content, author_id) VALUES ('Second Note', 'Yay, second note from Edmun', 2);
INSERT INTO note (title, content, author_id) VALUES ('Third Note', 'Yay, third note from Dixie', 1);
INSERT INTO note (title, content, author_id) VALUES ('Third Note', 'Yay, third note from Edmun', 2);

SELECT * FROM note, author
    WHERE author.name = 'Dixie'
    AND note.author_id = author.id;

SELECT * FROM note, author
    WHERE note.id = '2'
    AND note.author_id = author.id;

SELECT COUNT(*), author.name FROM note, author
   WHERE note.author_id = author.id
   GROUP BY author.name; 

DELETE FROM note WHERE author_id IN (1);
DELETE FROM author WHERE author.name = 'Dixie';