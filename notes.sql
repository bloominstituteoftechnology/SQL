/*
Create a database for taking notes.

What are the columns that a note table needs?
    - An autoincrement id
    - A title (of type VARCHAR(128), should be enough??)
    - A content (of type TEXT, with 65,535 characters - 64 KB should be sufficiently capable of handling typical long-form text content.)
    - Author_id is reference to an id in author table (foreign key).
    - Created_at as timestamp when a note is created.

If you have a timestamp field, how do you auto-populate it with the date?
    - DATETIME NOT NULL DEFAULT(GETDATE()) 
    ---> get an error "unknown function: GETDATE()"

    - created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP 
    ---> generate column and print date and time stamp as I wish.
    `https://www.w3schools.com/sql/sql_ref_mysql.asp`

A note should have a foreign key pointing to an author in an author table.

What columns are needed for the author table?
    - An autoincrement id
    - Author's first name and last name
*/

/********* set up database *********/
-- sqlite3 notedatabase.db
-- PRAGMA foreign_keys = ON;
-- .mode column
-- .header on


/********* CREATE TABLES ********/
CREATE TABLE note (
id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
author_id INTEGER REFERENCES author(id),
-- can write FOREIGN KEY(author_id) REFERENCES author(id),
title VARCHAR(128) NOT NULL,
content TEXT,
created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE author (
id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
firstname VARCHAR(128),
lastname VARCHAR(128)
);


/********* POPULATE TABLES ********/
INSERT INTO author (firstname, lastname) VALUES ("Harry", "Potter");
INSERT INTO author (firstname, lastname) VALUES ("Ron", "Weasley");
INSERT INTO author (firstname, lastname) VALUES ("Hermione", "Granger");
/*
SELECT * FROM author;

id          firstname   lastname  
----------  ----------  ----------
1           Harry       Potter    
2           Ron         Weasley   
3           Hermione    Granger  
*/

INSERT INTO note (author_id, title, content) VALUES (1, "Note One", "Content One");
INSERT INTO note (author_id, title, content) VALUES (1, "Note Two", "Content Two");
INSERT INTO note (author_id, title, content) VALUES (1, "Note Three", "Content Three");

INSERT INTO note (author_id, title, content) VALUES (2, "Note 1 by Ron", "Content 1 by Ron");
INSERT INTO note (author_id, title, content) VALUES (2, "Note 2 by Ron", "Content 2 by Ron");
INSERT INTO note (author_id, title, content) VALUES (2, "Note 3 by Ron", "Content 3 by Ron");

INSERT INTO note (author_id, title, content) VALUES (3, "Note A", "Content A by Hermione");
INSERT INTO note (author_id, title, content) VALUES (3, "Note B", "Content B by Hermione");
INSERT INTO note (author_id, title, content) VALUES (3, "Note C", "Content C by Hermione");
/*
SELECT * FROM note;

id          author_id   title       content      created_at         
----------  ----------  ----------  -----------  -------------------
1           1           Note One    Content One  2018-09-03 20:07:39
2           1           Note Two    Content Two  2018-09-03 20:09:20
3           1           Note Three  Content Thr  2018-09-03 20:09:42
4           2           Note 1 by   Content 1 b  2018-09-03 20:12:43
5           2           Note 2 by   Content 2 b  2018-09-03 20:13:06
6           2           Note 3 by   Content 3 b  2018-09-03 20:13:27
7           3           Note A      Content A b  2018-09-03 20:14:04
8           3           Note B      Content B b  2018-09-03 20:14:23
9           3           Note C      Content C b  2018-09-03 20:14:38
*/


/********* Select all notes by an author's name *********/
SELECT title, content FROM note, author
WHERE note.author_id = author.id
AND author.firstname = "Harry"
AND author.lastname = "Potter";
/*
title       content    
----------  -----------
Note One    Content One
Note Two    Content Two
Note Three  Content Thr
*/


/********* Select author for a particular note by note ID *********/
SELECT firstname, lastname FROM note, author
WHERE note.id = 9
AND note.author_id = author.id;
/*
firstname   lastname  
----------  ----------
Hermione    Granger  
*/


/********* Select the names of all the authors along with the number of notes they each have ********/
SELECT firstname, lastname, COUNT(note.id)
FROM note, author
WHERE author.id = note.author_id
GROUP BY author.id;
/*
firstname   lastname    COUNT(note.id)
----------  ----------  --------------
Harry       Potter      3             
Ron         Weasley     3             
Hermione    Granger     3 
*/


/********* Delete authors from the author table *********/
DELETE FROM author
WHERE author.id = 3;
/*
Error: FOREIGN KEY constraint failed

What happens when you try to delete an author with an existing note?
    Foreign key constraint don't allow the data that have the relationship with other tables delete or edit.

How can you prevent this?
    Add `ON DELETE CASCADE` clause to the foreign key for example 
    `FOREIGN KEY(author_id) REFERENCES author(id) ON DELETE CASCADE`.

    refer to https://www.sqlite.org/foreignkeys.html 
    A "CASCADE" action propagates the delete or update operation on the parent key to each dependent child key. For an "ON DELETE CASCADE" action, this means that each row in the child table that was associated with the deleted parent row is also deleted. For an "ON UPDATE CASCADE" action, it means that the values stored in each dependent child key are modified to match the new parent key values.
*/
