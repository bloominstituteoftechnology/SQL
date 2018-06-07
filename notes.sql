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

INSERT INTO author (name) VALUES ("Eiichiro Oda");
INSERT INTO author (name) VALUES ("Masashi Kishimoto");
INSERT INTO author (name) VALUES ("Sui Ishida");
INSERT INTO author (name) VALUES ("Kouhei Horikoshi");
INSERT INTO author (name) VALUES ("ONE");

INSERT INTO notes (title, author_id) VALUES ("One Piece", 1);
INSERT INTO notes (title, author_id) VALUES ("Naruto", 2);
INSERT INTO notes (title, author_id) VALUES ("Naruto: Shippuden", 2);
INSERT INTO notes (title, author_id) VALUES ("Boruto", 2);
INSERT INTO notes (title, author_id) VALUES ("Tokyo Ghoul", 3);
INSERT INTO notes (title, author_id) VALUES ("Tokyo Ghoul:re", 3);
INSERT INTO notes (title, author_id) VALUES ("Boku no Hero Academia", 4);
INSERT INTO notes (title, author_id) VALUES ("One Punch Man", 5);
INSERT INTO notes (title, author_id) VALUES ("Mob Psycho 100", 5);

SELECT * FROM notes WHERE author_id IN (SELECT id
    FROM author WHERE name = "ONE");

SELECT author.name FROM notes, author 
    WHERE notes.id = 1
    AND notes.author_id = author.id;

SELECT author.name, COUNT(notes.id) FROM notes, author
    WHERE notes.author_id = author.id
    GROUP BY author.id;

-- DELETE FROM author where author.id > 3;
-- probably delete the related notes before trying to delete the author of those notes