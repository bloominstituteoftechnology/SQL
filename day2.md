Create a database for taking notes.

* What are the columns that a note table needs?
id, title, body, author, timestamp,

* If you have a timestamp field, how do you auto-populate it with the date?
DATETIME used with GETDATE()

* A note should have a foreign key pointing to an author in an author table.


* What columns are needed for the author table?
id, name, 

Write queries that:

* Insert authors to the author table.
insert into author (name) values ('Bob');
insert into author (name) values ('jim');
insert into author (name) values ('jim bob');

* Insert notes to the note table.
insert into note (title, author_id, body) values ("Test note1", 1, "This is a test note!");
insert into note (title, author_id, body) values ("Test note2", 2, "I am your master");
insert into note (title, author_id, body) values ("Test note1", 3, "This jim bob notes");
insert into note (title, author_id, body) values ("Test note1", 1, "This is a test again!");
insert into note (title, author_id, body) values ("Test note1", 1, "This is a test twice!");
insert into note (title, author_id, body) values ("Test note1", 3, "Whos is this possible jim bob");

* Select all notes by an author's name.
select * from note, author where author_id = author.id AND author.name = 'Bob'; 

* Select author for a particular note by note ID.
select author.name from author, note where note.id = 1;

* Select the names of all the authors along with the number of notes they each have. (Hint: `GROUP BY`.)
select *, count(*) from note group by note.author_id;

* Delete authors from the author table.
  > Note that SQLite doesn't enforce foreign key constrains by default. You have
  > to enable them by running `PRAGMA foreign_keys = ON;` before your queries.
  
  * What happens when you try to delete an author with an existing note?
  it keeps incrementing each time you add in a new value. so instead of starting at a new index its always missing that one anytime you pull records. 

  * How can you prevent this?
  reseed the value

Submit a file `notes.sql` with the queries that build (`CREATE TABLE`/`INSERT`)
and query the database as noted above.