.mode column
.header on
-- * Insert authors to the author table.
INSERT INTO user (username, password)VALUES('moises', 'lambda12345');
INSERT INTO user (username, password)VALUES('jackee', 'lambda12345');
INSERT INTO user (username, password)VALUES('mark', 'lambda12345');

-- * Insert notes to the note table.
INSERT INTO note (title,content,userId)VALUES('Moises Note', 'This note is to remind me of my password Lambda from 1 to 5', 1);
INSERT INTO note (title,content,userId)VALUES('Jackees Note', 'This note to test multiple notes in the DB', 2);

-- * Select all notes by an author's name.
SELECT * FROM note WHERE userId IS (SELECT id FROM user WHERE username IS 'moises');

-- * Select author for a particular note by note ID.
SELECT * FROM user WHERE userId = 1;

-- * Select the names of all the authors along with the number of notes they each have. (Hint: `GROUP BY`.)
SELECT COUNT(userId) AS "TotalNotes", title AS "Title", userId AS "UserID" FROM note GROUP BY userId;

-- * Delete authors from the author table.
-- Display Users Before Deletion: Seeing is Believing
PRAGMA foreign_keys = OFF;

SELECT * FROM user;
DELETE FROM user WHERE username = 'mark';
DELETE FROM user WHERE username = 'moises';

-- Display Users After Deletion: Seeing is Believing
SELECT * FROM user;
--   > Note that SQLite doesn't enforce foreign key constrains by default. You have
--   > to enable them by running `PRAGMA foreign_keys = ON;` before your queries.
--   * What happens when you try to delete an author with an existing note?
--   * How can you prevent this?

-- SELECT * from user;