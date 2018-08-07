DROP TABLE IF EXISTS author;
CREATE TABLE author (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(128) NOT NULL
);

DROP TABLE IF EXISTS note;
CREATE TABLE note (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(128) NOT NULL,
  content VARCHAR(128) NOT NULL,
  timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
  author_id INTEGER REFERENCES author(id)
);


INSERT INTO author (name) VALUES ('Devon');
INSERT INTO author (name) VALUES ('Marjoerie');
INSERT INTO author (name) VALUES ('Ponzi');
INSERT INTO author (name) VALUES ('Taylor');

INSERT INTO note (title, content, author_id) VALUES ('Hello', 'World', 1);
INSERT INTO note (title, content, author_id) VALUES ('Testing', '1..2..3..', 1);
INSERT INTO note (title, content, author_id) VALUES ('You', 'An', 2);
INSERT INTO note (title, content, author_id) VALUES ('Aint', 'Shit', 3);
INSERT INTO note (title, content, author_id) VALUES ('Loves', 'Horses', 4);





