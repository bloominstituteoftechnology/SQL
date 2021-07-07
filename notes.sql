PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS note;
DROP TABLE IF EXISTS author;

CREATE TABLE note (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    author_id INTEGER,
    title VARCHAR(128),
    content TEXT,
    created_on DATETIME,
    FOREIGN KEY(author_id) REFERENCES author(id) ON DELETE CASCADE
); 

CREATE TABLE author (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128)
);

INSERT INTO author (name) VALUES ("Author Name 1");
INSERT INTO author (name) VALUES ("Author Name 2");
INSERT INTO author (name) VALUES ("Author Name 3");
INSERT INTO author (name) VALUES ("Author Name 4");
INSERT INTO author (name) VALUES ("Author Name 5");

INSERT INTO note (author_id, title, content, created_on) VALUES (1, "Author 1 Note 1", "A1N1 Content", CURRENT_TIMESTAMP);
INSERT INTO note (author_id, title, content, created_on) VALUES (1, "Author 1 Note 2", "A1N2 Content", CURRENT_TIMESTAMP);
INSERT INTO note (author_id, title, content, created_on) VALUES (3, "Author 3 Note 1", "A3N1 Content", CURRENT_TIMESTAMP);
INSERT INTO note (author_id, title, content, created_on) VALUES (4, "Author 4 Note 1", "A4N1 Content", CURRENT_TIMESTAMP);
INSERT INTO note (author_id, title, content, created_on) VALUES (5, "Author 5 Note 1", "A5N1 Content", CURRENT_TIMESTAMP);
INSERT INTO note (author_id, title, content, created_on) VALUES (5, "Author 5 Note 2", "A5N2 Content", CURRENT_TIMESTAMP);
INSERT INTO note (author_id, title, content, created_on) VALUES (5, "Author 5 Note 3", "A5N3 Content", CURRENT_TIMESTAMP);

SELECT title, content FROM note, author
    WHERE note.author_id = author.id AND
    author.name = "Author Name 5";

SELECT name FROM note, author
    WHERE note.author_id = author.id AND
    note.id = 6;

SELECT name, COUNT(*) FROM note, author
    WHERE note.author_id = author.id
    GROUP BY author_id;

DELETE FROM author WHERE id = 3;