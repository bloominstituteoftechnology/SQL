/* ### Exercises, Day 2 */

/* Create a database for taking notes. */

/* * What are the columns that a note table needs? */

/* * If you have a timestamp field, how do you auto-populate it with the date? */

/* * A note should have a foreign key pointing to an author in an author table. */

/* * What columns are needed for the author table? */
PRAGMA foreign_keys = ON;

CREATE TABLE note (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(128) NOT NULL,
  content VARCHAR(1024),
  author_id INTEGER REFERENCES author(id),
  created_on DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE author (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(128) NOT NULL
);

CREATE TABLE note_author (
  note_id INTEGER REFERENCES note(id),
  author_id INTEGER REFERENCES author(id)
);


/* Write queries that: */

/* * Insert authors to the author table. */
INSERT INTO author (name) VALUES ('Nikhil');
INSERT INTO author (name) VALUES ('Zephyr');
INSERT INTO author (name) VALUES ('Pickle');

/* * Insert notes to the note table. */
INSERT INTO note (title, content, author_id) VALUES ("Test Note 1 By Nikhil", "Nikhil's note 1 content would be here.", 1);
INSERT INTO note (title, content, author_id) VALUES ("Test Note 1 By Zephyr", "Zephyr's note 1 content would be here.", 2);
INSERT INTO note (title, content, author_id) VALUES ("Test Note 1 By Pickle", "Pickle's note 1 content would be here.", 3);
INSERT INTO note (title, content, author_id) VALUES ("Test Note 2 By Nikhil", "Nikhil's note 2 content would be here.", 1);
INSERT INTO note (title, content, author_id) VALUES ("Test Note 2 By Zephyr", "Zephyr's note 2 content would be here.", 2);
INSERT INTO note (title, content, author_id) VALUES ("Test Note 2 By Pickle", "Pickle's note 2 content would be here.", 3);

INSERT INTO note_author (note_id, author_id) VALUES (1, 1);
INSERT INTO note_author (note_id, author_id) VALUES (2, 2);
INSERT INTO note_author (note_id, author_id) VALUES (3, 3);
INSERT INTO note_author (note_id, author_id) VALUES (4, 1);
INSERT INTO note_author (note_id, author_id) VALUES (5, 2);
INSERT INTO note_author (note_id, author_id) VALUES (6, 3);


/* * Select all notes by an author's name. */
SELECT * FROM note, author 
WHERE note.author_id = author.id AND author.id = 1;

/* * Select author for a particular note by note ID. */
SELECT author.name, author.id FROM author, note 
WHERE note.author_id = author.id AND note.id = 2;

/* * Select the names of all the authors along with the number of notes they each have. (Hint: `GROUP BY`.) */
SELECT author.name, COUNT(note.id) FROM author, note 
WHERE note.author_id = author.id GROUP BY author.name;

/* * Delete authors from the author table. */
/*   > Note that SQLite doesn't enforce foreign key constrains by default. You have */
/*   > to enable them by running `PRAGMA foreign_keys = ON;` before your queries. */
  
/*   * What happens when you try to delete an author with an existing note? */
/*   * How can you prevent this? */
