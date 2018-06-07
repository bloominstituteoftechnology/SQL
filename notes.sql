PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS note;
DROP TABLE IF EXISTS author;

CREATE TABLE note (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    content VARCHAR(1024),
    author_id INTEGER REFERENCES author(id),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE author (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL
);

INSERT INTO author (name) VALUES ('Amanda');
INSERT INTO author (name) VALUES ('Harry');
INSERT INTO author (name) VALUES ('Dumbledore');

INSERT INTO note (title, content, author_id) VALUES ('Duckies', 'I collect them', 1);
INSERT INTO note (title, content, author_id) VALUES ('Owls', 'Yeah, I collect them, too', 1);
INSERT INTO note (title, content, author_id) VALUES ('Potions 1', ' bewitch the mind and ensnare the senses, brew glory, bottle fame, even stopper death', 2);
INSERT INTO note (title, content, author_id) VALUES ('Snape', 'He hates me, avoid at all costs', 2);
INSERT INTO note (title, content, author_id) VALUES ('Check in', 'I wonder how Mr. Potter is settling in.', 3);
INSERT INTO note (title, content, author_id) VALUES ('Think of something clever', 'I need a clever quote to give to students at any given time.', 3);

SELECT * FROM note, author
    WHERE author.name = 'Amanda'
    AND note.author_id = author.id;

SELECT * FROM note, author
    WHERE note.id = '3'
    AND note.author_id = author.id;

SELECT COUNT(*), author.name FROM note, author
    WHERE note.author_id = author.id
    GROUP BY author.name;