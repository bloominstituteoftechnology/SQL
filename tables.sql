CREATE TABLE album (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    release_year INTEGER
);

CREATE TABLE artist (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL
);

CREATE TABLE track (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    album_id INT REFERENCES album(id)
);

CREATE TABLE artist_album (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    album_id INT REFERENCES album(id),
    artist_id INT REFERENCES artist(id)
);


CREATE TABLE note (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128),
    content TEXT,
    created_on DATETIME,
    author_id INT REFERENCES author(id)
);

CREATE TABLE author (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128)
);

INSERT INTO author (name) VALUES ("Some Guy");
INSERT INTO author (name) VALUES ("Some Other Guy");
INSERT INTO author (name) VALUES ("Just This Guy, You Know?");
INSERT INTO author (name) VALUES ("Some Gal");
INSERT INTO author (name) VALUES ("Some Other Gal");

INSERT INTO note (author_id, title, content, created_on) VALUES (1, "HEY", "THIS IS A NOTE", CURRENT_TIMESTAMP);
INSERT INTO note (author_id, title, content, created_on) VALUES (2, "Shut up", "Stop yelling", CURRENT_TIMESTAMP);
INSERT INTO note (author_id, title, content, created_on) VALUES (3, "I like notes", "Notes are my friend", CURRENT_TIMESTAMP);
INSERT INTO note (author_id, title, content, created_on) VALUES (4, "I hate notes", "Notes are my foe", CURRENT_TIMESTAMP);
INSERT INTO note (author_id, title, content, created_on) VALUES (5, "What's brown and sticky?", "A stick", CURRENT_TIMESTAMP);