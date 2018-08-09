-- What columns are needed for the author table?
-- ANSWER:  an author table needs columns for an id, first name and last name

-- authors TABLE 
-- CREATE TABLE Authors (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     first_name VARCHAR(128),
--     last_name VARCHAR(128)
-- );

-- Write queries that insert authors to the author table:
INSERT INTO Authors(first_name, last_name) VALUES ('George', 'Martin');
INSERT INTO Authors(first_name, last_name) VALUES ('Stephen', 'King');
INSERT INTO Authors(first_name, last_name) VALUES ('Brandon', 'Sanderson');
INSERT INTO Authors(first_name, last_name) VALUES ('Nicholas', 'Sparks');

-- Write queries that delete authors from the author table:
DELETE FROM Authors WHERE Authors.id = 4;

-- Write queries that select author for a particular note by note ID: 
SELECT first_name, last_name FROM Authors, Notes
    WHERE Notes.author_id = Authors.id 
    AND Notes.id = 1;

-- Write queries that select the names of all the authors along with the number of notes they each have (HINT: GROUP BY): 
SELECT first_name, last_name, COUNT(*) FROM Authors, Notes
    WHERE Authors.id = Notes.author_id 
    GROUP BY Authors.id;
    