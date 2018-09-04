sqlite3 notes.db
PRAGMA foreign_keys = ON
.header on
.mode column

CREATE TABLE note(id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(128) NOT NULL, content VARCHAR(255) NOT NULL, author_id INT REFERENCES author(id), created_on DATETIME DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE author(id INTEGER PRIMARY KEY AUTOINCREMENT, first_name VARCHAR(128) NOT NULL, last_name VARCHAR(128) NOT NULL)

/*Queries*/
/*Insert authors to the author table.*/
INSERT INTO author (first_name, last_name) VALUES ('','');
INSERT INTO author (first_name, last_name) VALUES ('','');
/*Insert notes to the note table.*/
/*Select all notes by an author's name.*/
/*Select author for a particular note by note ID.*/
/*Select the names of all the authors along with the number of notes they each have. (Hint: GROUP BY.)*/
/*Delete authors from the author table.*/


/*What happens when you try to delete an author with an existing note? How can you prevent this?*/

