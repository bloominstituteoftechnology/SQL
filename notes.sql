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

INSERT INTO author (name) VALUES ("Chaucer");
INSERT INTO author (name) VALUES ("Orwell");
INSERT INTO author (name) VALUES ("Clancy");
INSERT INTO author (name) VALUES ("Clavell");
INSERT INTO note (title, content, author_id) VALUES ('Great', 'That one guy.', 1);
INSERT INTO note (title, content, author_id) VALUES ('Alright', 'A fantastic writer.', 2);
INSERT INTO note (title, content, author_id) VALUES ('Meh', 'This was a book.', 3);
INSERT INTO note (title, content, author_id) VALUES ('Merp...', 'Woohoo!', 4);
SELECT * FROM note, author WHERE author.name = 'Chaucer';
SELECT * FROM note, author WHERE note.id = 3;
SELECT name, COUNT(*) AS "total" FROM note, author WHERE note.author_id = author.id GROUP BY author_id;
DELETE * FROM author; --There seems to be an issue while trying to delete authors; I suspect that it is meant to protect connected records from being inadverdently deleted.