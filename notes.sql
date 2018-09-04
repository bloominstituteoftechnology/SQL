sqlite3 notes.db
PRAGMA foreign_keys = ON
.header on
.mode column

CREATE TABLE note(id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(128) NOT NULL, content VARCHAR(255) NOT NULL, author_id INT REFERENCES author(id), created_on DATETIME DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE author(id INTEGER PRIMARY KEY AUTOINCREMENT, first_name VARCHAR(128) NOT NULL, last_name VARCHAR(128) NOT NULL)

/*Queries*/
/*Insert authors to the author table.*/
INSERT INTO author (first_name, last_name) VALUES ('C. Auguste','Dupin');
INSERT INTO author (first_name, last_name) VALUES ('Hester','Prynne');

/*Insert notes to the note table.*/
INSERT INTO note (title, content, author_id) VALUES ('Seventh Note','Can Never Have Too Much Content',5);
INSERT INTO note (title, content, author_id) VALUES ('Eighth Note','Content Not Available Without Prescription',6);

/*Select all notes by an author's name.*/
SELECT note.title, note.content FROM note, author WHERE note.author_id = author.id AND author.first_name = 'Dolores';
title        content
-----------  ----------------------
Fourth Note  Running Out of Content

SELECT note.title, note.content FROM note, author WHERE note.author_id = author.id AND author.first_name = 'Snidely';

title       content         
----------  ----------------
First Note  Exciting Content
Fifth Note  Just Making Cont

/*Select author for a particular note by note ID.*/

SELECT first_name, last_name FROM note, author WHERE author.id = note.author_id AND note.id = 1;
first_name  last_name
----------  ----------
Snidely     Whiplash

SELECT first_name, last_name FROM note, author WHERE author.id = note.author_id AND note.id = 7
first_name  last_name
----------  ----------
C. Auguste  Dupin

/*Select the names of all the authors along with the number of notes they each have. (Hint: GROUP BY.)*/
SELECT first_name, last_name, COUNT(*) FROM author, note WHERE author.id = note.author_id GROUP BY author.id;
first_name  last_name   COUNT(*)
----------  ----------  ----------
Snidely     Whiplash    2
J. Alfred   Prufrock    1
Captain     Kangaroo    2
Dolores     Haze        1
C. Auguste  Dupin       1
Hester      Prynne      1


/*Delete authors from the author table.*/
 DELETE FROM author WHERE id=1;
Error: FOREIGN KEY constraint failed
/* Note - will not let you delete authors if a note is attached if you have PRAGMA foreign_keys = ON. I turned it off and then it worked fine.*/

PRAGMA foreign_keys = OFF;
DELETE FROM author WHERE id=1;

SELECT first_name, last_name, COUNT(*) FROM author, note WHERE author.id = note.author_id GROUP BY author.id;
first_name  last_name   COUNT(*)
----------  ----------  ----------
J. Alfred   Prufrock    1
Captain     Kangaroo    2
Dolores     Haze        1
C. Auguste  Dupin       1
Hester      Prynne      1


