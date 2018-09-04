PRAGMA foreign_keys = ON;

CREATE TABLE note (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128),
    content TEXT,
    author_id INTEGER REFERENCES author(id) ON DELETE CASCADE,
    created_at TIMESTAMP
);

CREATE TABLE author (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(32) NOT NULL
);

INSERT INTO author (name) VALUES ("Braden");
INSERT INTO author (name) VALUES ("Beej");
INSERT INTO author (name) VALUES ("Maverick");

INSERT INTO note (title, content, author_id, created_at) VALUES ("bradenTest1", "Here's a test for a note by Braden", 1, CURRENT_TIMESTAMP);
INSERT INTO note (title, content, author_id, created_at) VALUES ("beejTest1", "Here's a test for a note by Beej", 2, CURRENT_TIMESTAMP);
INSERT INTO note (title, content, author_id, created_at) VALUES ("maverickTest1", "Here's a test for a note by Maverick", 3, CURRENT_TIMESTAMP);
INSERT INTO note (title, content, author_id, created_at) VALUES ("beejTest2", "Here's another by Beej", 2, CURRENT_TIMESTAMP);
INSERT INTO note (title, content, author_id, created_at) VALUES ("maverickTest2", "Here's another by Maverick", 3, CURRENT_TIMESTAMP);
INSERT INTO note (title, content, author_id, created_at) VALUES ("bradenTest2", "Here's another by Braden", 1, CURRENT_TIMESTAMP);