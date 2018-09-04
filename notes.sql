CREATE TABLE note(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(128) DEFAULT 'New Note',
  note_text TEXT,
  author_id INTEGER NOT NULL,
  date_created DATETIME DEFAULT CURRENT_DATE,
  FOREIGN KEY(author_id) REFERENCES author(id) ON DELETE CASCADE
);

CREATE TABLE author(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_name VARCHAR(64) NOT NULL
);

INSERT INTO author (id, author_name) VALUES (1, "Alfa");
INSERT INTO author (id, author_name) VALUES (2, "Bravo");
INSERT INTO author (id, author_name) VALUES (3, "Charlie");

INSERT INTO note (id, title, note_text, author_id) VALUES (
  1,
  'My friend Omega',
  'My friend, Omega, is the last word when it comes to friendship',
  1
);

INSERT INTO note (id, title, note_text, author_id) VALUES (
  2,
  'Lorem Ipsum',
  'Cras aliquam, diam ut pretium ultrices, quam lectus pretium nulla, at molestie lacus nisl sed eros. Aliquam vitae lacus quis quam eleifend mattis. Mauris tempor pulvinar facilisis.',
  1
);

INSERT INTO note (id, title, note_text, author_id) VALUES (
  3,
  'My favorite television channel',
  'My favorite television channel on cable is Lifetime. It is the best.',
  2
);

INSERT INTO note (id, title, note_text, author_id) VALUES (
  4,
  'Dissertation on Chocolate Factories',
  'Access to the means of chocolate production should not be reserved for the golden-tickted elite, but for the hungry and impoverished masses!',
  3
);

.headers ON
.mode column

SELECT *
  FROM note
  JOIN author ON author.id = note.author_id;

SELECT *
  FROM note
  WHERE note.id = 4;

SELECT author.author_name, COUNT(note.title) AS Num_of_Notes
  FROM note
  JOIN author ON author.id = note.author_id
  GROUP BY author.author_name;

PRAGMA foreign_keys = ON;

DELETE
  FROM author;