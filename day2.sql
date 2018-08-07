pragma foreign_keys = on;


create table author (
  id integer primary key autoincrement,
  name varchar(128) not null
);
create table note (
  id integer primary key autoincrement,
  title varchar(128) not null,
  content varchar(1024),
  created_on datetime not null default(date('now')),
  author_id integer references author(id)
);

-- Insert authors to the author table.

INSERT INTO author (name) VALUES ("Stephen King");
INSERT INTO author (name) VALUES ("Neil Gaiman");
INSERT INTO author (name) VALUES ("Brandon Sanderson");

INSERT INTO note (title, content, author_id) values ('note1', 'test note for author1', 1);
INSERT INTO note (title, content, author_id) values ('note2', 'test note for author2', 2);
INSERT INTO note (title, content, author_id) values ('note3', 'test note for author3', 3);

-- Select all notes by an author's name.

SELECT * FROM note, author WHERE author_id = author.id AND author.id = 1;

-- Select author for a particular note by note ID.

SELECT name FROM note, author WHERE note.author_id = author.id AND node.id = 1

-- Select the names of all the authors along with the number of notes they each have.

SELECT name, COUNT(*) as "total" FROM note, author WHERE note.author_id = author.id GROUP BY author_id;

-- Delete authors from the author table.

DELETE FROM author WHERE name = "Brandon Sanderson";