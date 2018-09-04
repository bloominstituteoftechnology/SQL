PRAGMA foreign_keys = ON;

CREATE TABLE author (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL
);

CREATE TABLE note (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    content VARCHAR(1024),
    created_on DATETIME NOT NULL default(date('now')),
    author_id INTEGER REFERENCES author(id)
);

INSERT INTO author (name) VALUES ("First");
INSERT INTO author (name) VALUES ("Second");
INSERT INTO author (name) VALUES ("Third");
INSERT INTO note (title, content, author_id) VALUES ('One', 'This is a first note', 1);
INSERT INTO note (title, content, author_id) VALUES ('Two', 'This is a second note', 2);
INSERT INTO note (title, content, author_id) VALUES ('Three', 'This is a third note', 3);
SELECT * FROM note, author WHERE author_id = author.id AND author.id = 1;
SELECT name, COUNT(*) AS "total" FORM note, author WHERE note.author_id = author.id GROUP BY author_id;
DELETE FROM author WHERE name = "Second";