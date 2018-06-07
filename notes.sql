PRAGMA foreign_keys = ON;

.mode column
.header on
.print ""

DROP TABLE IF EXISTS note;
DROP TABLE IF EXISTS author;

-- What are the columns that a note table needs?
CREATE TABLE note (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER REFERENCES author(id) ON DELETE CASCADE NOT NULL, -- A note should have a foreign key pointing to an author in an author table.
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
INSERT INTO author (name) VALUES ("Mon Mothma");

-- Insert notes to the note table.
INSERT INTO note (author_id, title, content, created_on)
  VALUES (1, "Lando Note One", "Betray Han Solo.", DATETIME('now'));
INSERT INTO note (author_id, title, content, created_on)
  VALUES (1, "Lando Note Two", "Betray the Empire.", DATETIME('now'));
INSERT INTO note (author_id, title, content, created_on)
  VALUES (2, "Yoda Note One", "Live on a swamp planet for decades.", DATETIME('now'));
INSERT INTO note (author_id, title, content, created_on)
  VALUES (2, "Yoda Note Two", "Be pointlessly cryptic when Luke finds me.", DATETIME('now'));
INSERT INTO note (author_id, title, content, created_on)
  VALUES (2, "Yoda Note Three", "Tell Luke he fails, then keep training him anyway.", DATETIME('now'));
INSERT INTO note (author_id, title, content, created_on)
  VALUES (3, "Mon Note One", "Send Bothans to their deaths.", DATETIME('now'));

.print "Select all notes by an author's name. (Lando Calrissian)"
SELECT title, content FROM note, author
  WHERE note.author_id = author.id AND
  author.name = "Lando Calrissian";
.print ""

.print "Select author for a particular note by note ID. (3, should be Yoda)"
SELECT name FROM note, author
  WHERE note.author_id = author.id AND note.id = 3;
.print ""

.print "Select the names of all the authors along with the number of notes they each have."
SELECT name, COUNT(*) AS "count" FROM note, author
  WHERE note.author_id = author.id GROUP BY author_id;
.print ""

-- Delete authors from the author table.
DELETE FROM author WHERE name = "Lando Calrissian";
-- ON DELETE CASCADE is set on the author_id column in the note table