-- Create a database for taking notes.
-- What are the columns that a note table needs?
-- ANSWER: a note table needs columns for an id, title, content and date/time area

-- notes TABLE
-- CREATE TABLE Notes (
--     id INTEGER PRIMARY KEY AUTOINCREMENT, 
--     author_id INTEGER REFERENCES authors(id),
--     title VARCHAR(128),
--     content TEXT,
--     created_on DATETIME DEFAULT CURRENT_TIMESTAMP
-- );

-- Write queries that insert notes to the note table:
INSERT INTO Notes(author_id, title, content) VALUES (1, 'My First Note', 'Test 1');
INSERT INTO Notes(author_id, title, content) VALUES (2, 'My Second Note', 'Test 2');
INSERT INTO Notes(author_id, title, content) VALUES (3, 'My Third Note', 'Test 3');
INSERT INTO Notes(author_id, title, content) VALUES (4, 'My Fourth Note', 'Test 4');

-- Write queries that select all notes by an author's name:
SELECT title, content FROM Notes, Authors
    WHERE Notes.author_id = Authors.id
    AND Authors.first_name = 'George'
    AND Authors.last_name = 'Martin'

-- Write queries that select author for a particular note by note ID: 
SELECT first_name, last_name FROM Authors, Notes
    WHERE Notes.author_id = Authors.id 
    AND Notes.id = 1;

-- Write queries that select the names of all the authors along with the number of notes they each have (HINT: GROUP BY): 
SELECT first_name, last_name, COUNT(*) FROM Authors, Notes
    WHERE Authors.id = Notes.author_id 
    GROUP BY Authors.id;

