PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS notes;
DROP TABLE IF EXISTS author;

CREATE TABLE notes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    content VARCHAR(1024),
    'datetime' DATETIME NOT NULL DEFAULT (datetime(CURRENT_TIMESTAMP, 'localtime')),
    author_id INTEGER REFERENCES author(id)
);

CREATE TABLE author (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL
);

INSERT INTO author (name) VALUES ("JK Rowling");
INSERT INTO author (name) VALUES ("Madeline L'Engle");
INSERT INTO author (name) VALUES ("Ursula K Le Guin");
INSERT INTO author (name) VALUES ("Yu Watase");
INSERT INTO author (name) VALUES ("Natsuki Takaya");

INSERT INTO notes (title, author_id) VALUES ("Harry Potter", 1);
INSERT INTO notes (title, author_id) VALUES ("A Wrinkle in Time", 2);
INSERT INTO notes (title, author_id) VALUES ("Many Waters", 2);
INSERT INTO notes (title, author_id) VALUES ("An Acceptable Time", 2);
INSERT INTO notes (title, author_id) VALUES ("A Wizard of Earthsea", 3);
INSERT INTO notes (title, author_id) VALUES ("The Tombs of Atuan", 3);
INSERT INTO notes (title, author_id) VALUES ("Fushigi Yugi Genbu Kaiden", 4);
INSERT INTO notes (title, author_id) VALUES ("Fruits Basket", 5);
INSERT INTO notes (title, author_id) VALUES ("Fruits Basket Another", 5);

SELECT * FROM notes WHERE author_id IN (SELECT id
    FROM author WHERE name = "Natsuki Takaya");

SELECT author.name FROM notes, author 
    WHERE notes.id = 1
    AND notes.author_id = author.id;

SELECT author.name, COUNT(notes.id) FROM notes, author
    WHERE notes.author_id = author.id
    GROUP BY author.id;

DELETE FROM note WHERE note.author_id = 2;
DELETE FROM author WHERE author.id = 2;
