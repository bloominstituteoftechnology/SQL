sqlite3 mydatabase.db
AGMA foreign_keys = ON;

.mode column
.header on
.print ""

DROP TABLE IF EXISTS note;
DROP TABLE IF EXISTS author;

CREATE TABLE note (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER REFERENCES author(id) ON DELETE CASCADE NOT NULL, -- A note should have a foreign key pointing to an author in an author table.
  title VARCHAR(128) NOT NULL,
  content VARCHAR(1024) NOT NULL,
  created_on DATETIME NOT NULL
);

CREATE TABLE author (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(128) NOT NULL
);

-- Insert authors to table
INSERT INTO author (name) VALUES ("Anne Lamott");
INSERT INTO author (name) VALUES ("Jordan Peterson");
INSERT INTO author (name) VALUES ("Cheryl Strayed");
INSERT INTO author (name) VALUES ("Jeanette Walls");

-- Insert notes to the note table.
INSERT INTO note (author_id, title, content, created_on)
  VALUES (1, "Hope", "Hope begins in the dark, the stubborn hope that if you just show up and try to do the right thing, the dawn will come. You wait and watch and work: you don't give up..", DATETIME('now'));
INSERT INTO note (author_id, title, content, created_on)
  VALUES (1, "God", "You can safely assume that you've created God in your own image when it turns out that God hates all the same people you do.", DATETIME('now'));
INSERT INTO note (author_id, title, content, created_on)
  VALUES (2, "Life is Suffering", "Love is the desire to see unnecessary suffering ameliorated
Truth is the handmaiden of love
Dialogue is the pathway to truth 
Humility is recognition of personal insufficiency and the willingness to learn 
To learn is to die voluntarily and be born again, in great ways and small", DATETIME('now'));
INSERT INTO note (author_id, title, content, created_on)
  VALUES (2, "Conciousness", "Consciousness is a mystery that faces the mystery of potential and transforms it into actuality. We do that with every choice we make. Our choices determine the destiny of the world. By making a choice, you alter the structure of reality.", DATETIME('now'));
INSERT INTO note (author_id, title, content, created_on)
  VALUES (3, "Experiences", "Whatever happens to you belongs to you. Make it yours. Feed it to yourself even if it feels impossible to swallow. Let it nurture you, because it will..", DATETIME('now'));

.print "Select all notes by an author's name. (Anne Lamott)"
SELECT title, content FROM note, author
  WHERE note.author_id = author.id AND
  author.name = "Anne Lamott";
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
DELETE FROM author WHERE name = "Cheryl Strayed";
-- ON DELETE CASCADE is set on the author_id column in the note table
-- Without this, "Error: FOREIGN KEY constraint failed" appears.