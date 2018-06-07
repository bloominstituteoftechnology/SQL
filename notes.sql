PRAGMA foreign_keys = ON;

.mode column
.header on
.print ""

DROP TABLE IF EXISTS note;
DROP TABLE IF EXISTS author;

-- What are the columns that a note table needs?
CREATE TABLE note (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER REFERENCES author(id) NOT NULL, -- A note should have a foreign key pointing to an author in an author table.
  title VARCHAR(128) NOT NULL,
  content VARCHAR(1024) NOT NULL,
  created_on DATETIME NOT NULL
);

-- If you have a timestamp field, how do you auto-populate it with the date?
-- INSERT INTO note (created_on) VALUES (DATE('now'))
-- Note that this is SQLite syntax for the date.

-- What columns are needed for the author table?
CREATE TABLE author (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(128) NOT NULL
);

-- Insert authors to the author table.
INSERT INTO author (name) VALUES ("Lando Calrissian");
INSERT INTO author (name) VALUES ("Yoda");

-- Insert notes to the note table.
INSERT INTO note (author_id, title, content, created_on)
  VALUES (1, "Note One", "Betray Han Solo.", DATETIME('now'));