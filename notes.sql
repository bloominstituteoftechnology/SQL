
/* Create database for notes */
CREATE TABLE author (id INTEGER PRIMARY KEY AUTOINCREMENT, first_name VARCHAR(200) NOT NULL, last_name VARCHAR(255) NOT NULL);
CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(200) NOT NULL, content VARCHAR(255) NOT NULL, author_id INT REFERENCES author(id), created_at datetime default current_timestamp, last_modified datetime default current_timestamp);


/* add authors to database */
INSERT INTO author (first_name, last_name) VALUES ("Anne", "Courtney");
INSERT INTO author (first_name, last_name) VALUES ("Ryan", "Courtney");
INSERT INTO author (first_name, last_name) VALUES ("Coraline", "Courtney");

/* Add notes to database */
INSERT into note (title, content, author_id) values ("Test 1", "testing testing", 1);
INSERT into note (title, content, author_id) values ("Test 2", "testing again", 1);
INSERT into note (title, content, author_id) values ("Test 3", "final test i promise", 2);
INSERT into note (title, content, author_id) values ("Test 3", "final test i promise", 3);


/* Select all notes by an author's name */
SELECT note.title, note.content FROM note, author WHERE note.author_id = author.id AND author.first_name = "Anne";
SELECT note.title, note.content FROM note, author WHERE note.author_id = author.id AND author.first_name = "Ryan";
SELECT note.title, note.content FROM note, author WHERE note.author_id = author.id AND author.first_name = "Coraline";


/* Select author for a particular note by note ID */
SELECT author.first_name, author.last_name FROM note, author WHERE note.author_id = author.id AND note.id = 1;
SELECT author.first_name, author.last_name FROM note, author WHERE note.author_id = author.id AND note.id = 2;
SELECT author.first_name, author.last_name FROM note, author WHERE note.author_id = author.id AND note.id = 3;


/* Select names of all the authors along with the number of notes they have */
SELECT author.first_name, author.last_name, COUNT(author_id) FROM author, note WHERE note.author_id = author.id GROUP BY author.last_name;
SELECT author.first_name, author.last_name, COUNT(author_id) FROM author, note WHERE note.author_id = author.id GROUP BY author.first_name;

/* Delete authors from the author table */
DELETE FROM author WHERE id=3;

/* What happens when you try to delete an author with an existing note? */
/* Foreign key constraint error - it does not allow you to delete. */
/* Solution is changing the delete cascade */

/* Step one for me was opening notes.db so that my foreign_key constraints were turned off - .open notes.db */
begin transaction;
alter table note rename to _note_old_;
CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(200) NOT NULL, content VARCHAR(255) NOT NULL, author_id INT REFERENCES author(id) ON DELETE CASCADE, created_at datetime default current_timestamp, last_modified datetime default current_timestamp);
INSERT INTO note SELECT * from _note_old_;
commit;
.quit

/* sqlite3 notes.db */
drop table _note_old_;
DELETE FROM author where author.id = 4;