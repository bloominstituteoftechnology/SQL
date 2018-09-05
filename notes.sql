sqlite3 22notes.db
PRAGMA foreign_keys = ON;
.mode column
.header ON

/* Create database for taking notes */

/*Make Author Table*/
CREATE TABLE author (id INTEGER PRIMARY KEY AUTOINCREMENT, first_name VARCHAR(256) NOT NULL, last_name VARCHAR(256) NOT NULL);

/*Make Note Table*/
CREATE TABLE note (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    title VARCHAR(128) NOT NULL, 
    content VARCHAR(1024) NOT NULL, 
    author_id INT REFERENCES author(id), 
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    last_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    );

/*Write Query to Insert Author*/
INSERT INTO author (first_name, last_name) VALUES ("AF", "AL");
INSERT INTO author VALUES (2, "BF", "BL");
INSERT INTO author (first_name, last_name) VALUES ("CF", "CL");
INSERT INTO author (first_name, last_name) VALUES ("DF", "DL");
INSERT INTO author VALUES (6, "EF", "EL");
INSERT INTO author (first_name, last_name) VALUES ("FF", "FL");
INSERT INTO author VALUES (5, "5F", "5L");
INSERT INTO author (first_name, last_name) VALUES ("GF", "GL");

/*Write Query to insert note*/
INSERT INTO note (title, content, author_id) VALUES ('ANoteTitle', 'ANoteContent', 1);
INSERT INTO note (title, content, author_id) VALUES ('BNoteTitle', 'BNoteContent', 2);
INSERT INTO note (title, content, author_id) VALUES ('CNoteTitle', 'CNoteContent', 3);
INSERT INTO note (title, content, author_id) VALUES ('DNoteTitle', 'DNoteContent', 4);
INSERT INTO note (title, content, author_id) VALUES ('ENoteTitle', 'ENoteContent', 5);
INSERT INTO note (title, content, author_id) VALUES ('AANoteTitle', 'AANoteContent', 1);

/*Select All notes by author name*/
SELECT note.title as Title, note.content as Content from note, author WHERE author.id = note.author_id and author.name = 'AF';

/*Select author by note.id*/
SELECT author.first_name, author.last_name from author, note WHERE note.id = 1 AND author.id = note.author_id;

/*Select the names of all the authors along with the number o fnotes they each have (hint: GROUP BY)*/
SELECT first_name, last_name, COUNT(*) FROM author, note WHERE author.id = note.author_id GROUP BY author.id;

/*Delete Authors from the author table*/
DELETE FROM author WHERE id=1;

/*What happens whtn you try to delete an author with an existing note?*/
Error: FOREIGN KEY constraint failed


/*How can you prevent this?*/
PRAGMA foreign_keys = OFF; to turn off protection

You can also delete notes associated with author first and then author - You should implement it as a transaction
begin transaction;
delete from notes where author_id is 1;
delete from author where id is 1;
commit;

You can also apply cascade to foreign key: author_id INT REFERENCES author(id) ON DELETE CASCADE