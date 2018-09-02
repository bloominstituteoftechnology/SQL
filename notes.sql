--Create a database for taking notes.

-- ******************************************** COMMANDS TO CREATE ALL TABLES FOR NOTES DB ********************************************
.headers on
.mode column
PRAGMA foreign_keys=ON;
CREATE TABLE author (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(128) NOT NULL);
CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(255), content TEXT, author_id INTEGER REFERENCES author(id) ON DELETE CASCADE, created_at DATE DEFAULT datetime('now','localtime'), last_modified DATE DEFAULT NULL);
-- command to test last_modified: UPDATE note SET title = 'Iqra''s Note', last_modified = datetime('now','localtime') WHERE id = 1;
CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(255), content TEXT, author_id INTEGER REFERENCES author(id) ON DELETE CASCADE ON UPDATE CASCADE, created_at DATE DEFAULT (datetime('now','localtime')), last_modified DATE DEFAULT NULL);
--*************************************************************************************************************************************


-- What are the columns that a note table needs?
    id, title, content, author_id, created_at, last_modfied

-- If you have a timestamp field, how do you auto-populate it with the date?
    set default 

-- A note should have a foreign key pointing to an author in an author table.

-- What columns are needed for the author table?
    id, name

-- Write queries that:

-- Insert authors to the author table.
    see setupNotesDB.sql

-- Insert notes to the note table.
    see setupNotesDB.sql
-- Select all notes by an author's name.
    SELECT note.title FROM note, author  WHERE note.author_id=author.id AND author.name = 'Author1';

-- Select author for a particular note by note ID.
    SELECT author.name FROM author, note WHERE author.id=note.author_id AND note.id=10;

-- Select the names of all the authors along with the number of notes they each have. (Hint: `GROUP BY`.)
    SELECT COUNT(note.author_id), author.name FROM note, author WHERE note.author_id=author.id GROUP BY author.name;

-- Delete authors from the author table.
  -- Note that SQLite doesn't enforce foreign key constrains by default. You have
  -- to enable them by running `PRAGMA foreign_keys = ON;` before your queries.
    DELETE FROM author WHERE author.id=3;
  
  -- What happens when you try to delete an author with an existing note?
    Error: FOREIGN KEY constraint failed
  -- How can you prevent this?
    By adding ON DELETE CASCADE in the foreign key definition.
    --resource: https://stackoverflow.com/questions/15443913/sqlite3-foreign-key-constraint-failed
    

-- Submit a file `notes.sql` with the queries that build (`CREATE TABLE`/`INSERT`)
-- and query the database as noted above.