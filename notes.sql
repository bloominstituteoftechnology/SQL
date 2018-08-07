CREATE TABLE notes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(128),
  content VARCHAR(1024),
  author_id INTEGER,
  datetime TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE author (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(128)
);

INSERT INTO author (name) VALUES ('E. A. Poe');
INSERT INTO author (name) VALUES ('John Doe');
INSERT INTO author (name) VALUES ('Jack Frost');
INSERT INTO author (name) VALUES ('Anthony Horowitz');
INSERT INTO author (name) VALUES ('Lois Lowry');

INSERT INTO notes (title, content, author_id) VALUES ('Deaths', 'Need to write more depressing books', 1);
INSERT INTO notes (title, content, author_id) VALUES ('Gifts', 'Need to give kids more gifts', 3);
INSERT INTO notes (title, content, author_id) VALUES ('Series', 'Need to finish Alan Walker series', 4);
INSERT INTO notes (title, content, author_id) VALUES ('Triplet', 'Need to hardback my triplet series', 5);
INSERT INTO notes (title, content, author_id) VALUES ('Christmas', 'Make it Snow', 3);
INSERT INTO notes (title, content, author_id) VALUES ('Anon', 'Stay Anonymous', 2);
INSERT INTO notes (title, content, author_id) VALUES ('Giving', 'I wrote The Giver', 5);