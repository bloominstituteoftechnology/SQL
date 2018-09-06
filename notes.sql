/* Create authors table */ 

CREATE TABLE authors (id INTEGER PRIMARY Key AUTOINCREMENT, first_name VARCHAR(200) NOT NULL, last_name VARCHAR(255) NOT NULL);

/* Create notes table */ 

CREATE TABLE notes (id INTEGER PRIMARY Key AUTOINCREMENT, title VARCHAR(200) NOT NULL, content VARCHAR(255) NOT NULL, author_id INTEGER REFERENCES authors(id), created_at DATETIME DEFAULT CURRENT_TIMESTAMP, last_modified DATETIME DEFAULT CURRENT_TIMESTAMP);

/* Create a trigger to update the timestamp for the last_modified field in a record when changes are made to it */ 

CREATE TRIGGER UPDATE_TIMESTAMP_TRIGGER
AFTER UPDATE ON notes
BEGIN
   UPDATE notes SET TIMESTAMP = STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW') WHERE id = NEW.id;
END;

/* Insert authors to the authors table. */ 

InSERT INTO authors (first_name, last_name) VALUES ('Edward', 'Gonzalez');
InSERT INTO authors (first_name, last_name) VALUES ('Bob', 'Dillan');
InSERT INTO authors (first_name, last_name) VALUES ('Maria', 'Stratus');
InSERT INTO authors (first_name, last_name) VALUES ('Tom', 'Smith');

/* Insert notes to the note table. */ 

InSERT INTO notes (title, content, authors_id) VALUES ('Title 1', 'Content 1', 5);
InSERT INTO notes (title, content, authors_id) VALUES ('Title 2', 'Content 2', 4);
InSERT INTO notes (title, content, authors_id) VALUES ('Title 3', 'Content 3', 2);
InSERT INTO notes (title, content, authors_id) VALUES ('Title 4', 'Content 4', 1);
InSERT INTO notes (title, content, authors_id) VALUES ('Title 5', 'Content 5', 1);

/*  Select all notes by an author's name. */ 

SELECT title, content FROM notes, authors WHERE authors.id = notes.authors_id AND authors.first_name = 'Edward';


/* Select author for a particular note by note ID. */ 

SELECT first_name, last_name FROM (SELECT notes.id as notes_id, authors.first_name, authors.last_name FROM authors, notes WHERE notes.authors_id = authors.id) WHERE notes_id = 3;

/* Select the names of all the authors along with the number of notes they each have. (Hint: GROUP BY.) */ 

SELECT count(notes_id) notes, first_name, last_name FROM (SELECT notes.id AS notes_id, authors.first_name, authors.last_name FROM authors, notes WHERE notes.authors_id = authors.id) group by first_name, last_name;

/* Delete authors from the author table.(Note that SQLite doesn't enforce foreign key constrains by default. You have to enable them by running PRAGMA foreign_keys = ON; before your queries.) */ 

DELETE FROM authors WHERE id = 4;

/* What happens when you try to delete an author with an existing note? */ 

/* The author id  4 will still be referenced in the notes table. */ 

/* How can you prevent this? */ 

PRAGMA foreign_keys = ON;

/* Since PRAGMA foreign_keys is on you will receive a an error such as "Error: FOREIGN Key constraint failed" when trying to delete an author that is referenced in the notes table. */ 
