PRAGMA foreign_keys= ON; -- Set foreign key constraing MUST BE DO.

-- IMPROVE PRINT: Set to divede in columns and show Headers
.mode column
.headers ON

CREATE TABLE notes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(256) NOT NULL,
  content TEXT NOT NULL,
  author_id VARCHAR(128),
  date_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (author_id) REFERENCES authors (id)
);

CREATE TABLE authors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(128) NOT NULL
);


-- INSERT AUTHORS
INSERT INTO authors (name) VALUES ("Author_1");
INSERT INTO authors (name) VALUES ("Author_2");
INSERT INTO authors (name) VALUES ("Author_3");
INSERT INTO authors (name) VALUES ("Author_4");
-- sqlite> SELECT * FROM authors
--    ...> ;
-- id          name
-- ----------  ----------
-- 1           Author_1
-- 2           Author_2
-- 3           Author_3
-- 4           Author_4


-- INSERT NOTES
INSERT INTO notes (author_id, title, content) VALUES (1, "note_1", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae tempor neque. Pellentesque tincidunt nisl in aliquet luctus. Nam scelerisque, turpis in sodales ultricies, purus libero commodo risus, ac porta nibh nibh eu eros. Morbi augue nunc, finibus at porttitor in, eleifend et nunc. Vivamus porta dapibus lacus, ac cursus risus aliquam sit amet. Praesent vestibulum metus quis dolor interdum egestas a nec diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In dapibus metus vel blandit sodales. Curabitur eleifend ullamcorper lobortis.");
INSERT INTO notes (author_id, title, content) VALUES (1, "note_2", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae tempor neque. Pellentesque tincidunt nisl in aliquet luctus. Nam scelerisque, turpis in sodales ultricies, purus libero commodo risus, ac porta nibh nibh eu eros. Morbi augue nunc, finibus at porttitor in, eleifend et nunc. Vivamus porta dapibus lacus, ac cursus risus aliquam sit amet. Praesent vestibulum metus quis dolor interdum egestas a nec diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In dapibus metus vel blandit sodales. Curabitur eleifend ullamcorper lobortis.");
INSERT INTO notes (author_id, title, content) VALUES (2, "note_2", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae tempor neque. Pellentesque tincidunt nisl in aliquet luctus. Nam scelerisque, turpis in sodales ultricies, purus libero commodo risus, ac porta nibh nibh eu eros. Morbi augue nunc, finibus at porttitor in, eleifend et nunc. Vivamus porta dapibus lacus, ac cursus risus aliquam sit amet. Praesent vestibulum metus quis dolor interdum egestas a nec diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In dapibus metus vel blandit sodales. Curabitur eleifend ullamcorper lobortis.");
INSERT INTO notes (author_id, title, content) VALUES (3, "note_1", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae tempor neque. Pellentesque tincidunt nisl in aliquet luctus. Nam scelerisque, turpis in sodales ultricies, purus libero commodo risus, ac porta nibh nibh eu eros. Morbi augue nunc, finibus at porttitor in, eleifend et nunc. Vivamus porta dapibus lacus, ac cursus risus aliquam sit amet. Praesent vestibulum metus quis dolor interdum egestas a nec diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In dapibus metus vel blandit sodales. Curabitur eleifend ullamcorper lobortis.");
INSERT INTO notes (author_id, title, content) VALUES (3, "note_2", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae tempor neque. Pellentesque tincidunt nisl in aliquet luctus. Nam scelerisque, turpis in sodales ultricies, purus libero commodo risus, ac porta nibh nibh eu eros. Morbi augue nunc, finibus at porttitor in, eleifend et nunc. Vivamus porta dapibus lacus, ac cursus risus aliquam sit amet. Praesent vestibulum metus quis dolor interdum egestas a nec diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In dapibus metus vel blandit sodales. Curabitur eleifend ullamcorper lobortis.");
INSERT INTO notes (author_id, title, content) VALUES (4, "note_1", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae tempor neque. Pellentesque tincidunt nisl in aliquet luctus. Nam scelerisque, turpis in sodales ultricies, purus libero commodo risus, ac porta nibh nibh eu eros. Morbi augue nunc, finibus at porttitor in, eleifend et nunc. Vivamus porta dapibus lacus, ac cursus risus aliquam sit amet. Praesent vestibulum metus quis dolor interdum egestas a nec diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In dapibus metus vel blandit sodales. Curabitur eleifend ullamcorper lobortis.");
INSERT INTO notes (author_id, title, content) VALUES (4, "note_2", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae tempor neque. Pellentesque tincidunt nisl in aliquet luctus. Nam scelerisque, turpis in sodales ultricies, purus libero commodo risus, ac porta nibh nibh eu eros. Morbi augue nunc, finibus at porttitor in, eleifend et nunc. Vivamus porta dapibus lacus, ac cursus risus aliquam sit amet. Praesent vestibulum metus quis dolor interdum egestas a nec diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In dapibus metus vel blandit sodales. Curabitur eleifend ullamcorper lobortis.");
-- sqlite> SELECT id, title, date_stamp FROM notes
--    ...>
--    ...> ;
-- id          title       date_stamp
-- ----------  ----------  -------------------
-- 1           note_1      2018-09-03 12:32:49
-- 2           note_1      2018-09-03 12:38:01
-- 3           note_2      2018-09-03 12:38:02


-- QUERIES:
-- Select all notes by an author's name.
SELECT * FROM notes, authors WHERE notes.author_id=authors.id AND authors.name="Authors.name";  -- GENERAL QUERY
SELECT notes.id, title, date_stamp  FROM notes, authors WHERE notes.author_id=authors.id AND authors.name="Author_1";
-- sqlite> SELECT notes.id, title, date_stamp  FROM notes, authors WHERE notes.author_id=authors.id AND authors.name="Author_1";
-- id          title       date_stamp
-- ----------  ----------  -------------------
-- 1           note_1      2018-09-03 12:32:49
-- 2           note_1      2018-09-03 12:38:01
-- 3           note_2      2018-09-03 12:38:02


-- Select author for a particular note by note ID.
SELECT authors.name FROM authors, notes WHERE notes.author_id=authors.id AND notes.id="Note.id";  -- GENERAL QUERY
SELECT authors.name FROM authors, notes WHERE notes.author_id=authors.id AND notes.id=2;
-- sqlite> SELECT authors.name FROM authors, notes WHERE notes.author_id=authors.id AND notes.id=2;
-- name
-- ----------
-- Author_1


-- Select the names of all the authors along with the number of notes they each have. (Hint: GROUP BY.)
SELECT COUNT(notes.id), authors.name FROM authors, notes WHERE notes.author_id=authors.id GROUP BY authors.name;
-- sqlite> select id, title, author_id, date_stamp from notes;
-- id          title       author_id   date_stamp
-- ----------  ----------  ----------  -------------------
-- 1           note_1      1           2018-09-03 15:45:39
-- 2           note_2      1           2018-09-03 15:46:55
-- 3           note_2      2           2018-09-03 15:47:03
-- 4           note_1      3           2018-09-03 15:47:17
-- 5           note_2      3           2018-09-03 15:47:24
-- 6           note_1      4           2018-09-03 15:47:32
-- 7           note_2      4           2018-09-03 15:47:39
-- sqlite>
-- sqlite>
-- sqlite> SELECT COUNT(notes.id), authors.name FROM authors, notes WHERE notes.author_id=authors.id GROUP BY authors.name;
-- COUNT(notes.id)  name
-- ---------------  ----------
-- 2                Author_1
-- 1                Author_2
-- 2                Author_3
-- 2                Author_4


-- Delete authors from the author table.
DELETE FROM authors WHERE id=1; -- WITH: PRAGMA foreign_keys= ON;
DELETE FROM authors WHERE name="Author_1"; -- WITH: PRAGMA foreign_keys= ON;
    -- sqlite> DELETE FROM authors WHERE name="Author_1";
    -- Error: FOREIGN KEY constraint failed

DELETE FROM authors WHERE id=1; -- WITH: PRAGMA foreign_keys= OFF;
DELETE FROM authors WHERE name="Author_1"; -- WITH: PRAGMA foreign_keys= OFF;
  -- sqlite> DELETE FROM authors WHERE name="Author_1";
  -- sqlite> select * from authors
  --  ...> ;
  -- id          name
  -- ----------  ----------
  -- 2           Author_2
  -- 3           Author_3
  -- 4           Author_4
  -- sqlite> select id, author_id from notes;
  -- id          author_id
  -- ----------  ----------
  -- 1           1
  -- 2           1
  -- 3           2
  -- 4           3
  -- 5           3
  -- 6           4
  -- 7           4
    
--      Note that SQLite doesn't enforce foreign key constrains by default. You have to enable them by running PRAGMA foreign_keys = ON; before your queries.
--      What happens when you try to delete an author with an existing note?
  -- WITH: PRAGMA foreign_keys= ON;
    --Is not possible to 'delete' the 'authors', due to a 'foreign key constrain'
  -- WITH: PRAGMA foreign_keys= OFF;
    -- Is possible to 'delete' the author, but the DB enters in an delte-inconsistency, now the 'notes' tables has some notes that refer to an author that do not exist more in the DB.
--      How can you prevent this?
  -- Wiht SQLite it is neccesary to run the command: PRAGMA foreign_keys= ON
