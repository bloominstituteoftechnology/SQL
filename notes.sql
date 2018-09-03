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
INSERT INTO notes (author_id, title, content) VALUES (2, "note_2", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae tempor neque. Pellentesque tincidunt nisl in aliquet luctus. Nam scelerisque, turpis in sodales ultricies, purus libero commodo risus, ac porta nibh nibh eu eros. Morbi augue nunc, finibus at porttitor in, eleifend et nunc. Vivamus porta dapibus lacus, ac cursus risus aliquam sit amet. Praesent vestibulum metus quis dolor interdum egestas a nec diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In dapibus metus vel blandit sodales. Curabitur eleifend ullamcorper lobortis.");
INSERT INTO notes (author_id, title, content) VALUES (3, "note_1", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae tempor neque. Pellentesque tincidunt nisl in aliquet luctus. Nam scelerisque, turpis in sodales ultricies, purus libero commodo risus, ac porta nibh nibh eu eros. Morbi augue nunc, finibus at porttitor in, eleifend et nunc. Vivamus porta dapibus lacus, ac cursus risus aliquam sit amet. Praesent vestibulum metus quis dolor interdum egestas a nec diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In dapibus metus vel blandit sodales. Curabitur eleifend ullamcorper lobortis.");
INSERT INTO notes (author_id, title, content) VALUES (3, "note_2", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae tempor neque. Pellentesque tincidunt nisl in aliquet luctus. Nam scelerisque, turpis in sodales ultricies, purus libero commodo risus, ac porta nibh nibh eu eros. Morbi augue nunc, finibus at porttitor in, eleifend et nunc. Vivamus porta dapibus lacus, ac cursus risus aliquam sit amet. Praesent vestibulum metus quis dolor interdum egestas a nec diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In dapibus metus vel blandit sodales. Curabitur eleifend ullamcorper lobortis.");
INSERT INTO notes (author_id, title, content) VALUES (4, "note_1", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae tempor neque. Pellentesque tincidunt nisl in aliquet luctus. Nam scelerisque, turpis in sodales ultricies, purus libero commodo risus, ac porta nibh nibh eu eros. Morbi augue nunc, finibus at porttitor in, eleifend et nunc. Vivamus porta dapibus lacus, ac cursus risus aliquam sit amet. Praesent vestibulum metus quis dolor interdum egestas a nec diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In dapibus metus vel blandit sodales. Curabitur eleifend ullamcorper lobortis.");
INSERT INTO notes (author_id, title, content) VALUES (4, "note_2", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae tempor neque. Pellentesque tincidunt nisl in aliquet luctus. Nam scelerisque, turpis in sodales ultricies, purus libero commodo risus, ac porta nibh nibh eu eros. Morbi augue nunc, finibus at porttitor in, eleifend et nunc. Vivamus porta dapibus lacus, ac cursus risus aliquam sit amet. Praesent vestibulum metus quis dolor interdum egestas a nec diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In dapibus metus vel blandit sodales. Curabitur eleifend ullamcorper lobortis.");