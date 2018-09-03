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

