-- Formatting

    .mode column
    .header on

-- Enable Foreign Keys

    PRAGMA foreign_keys = ON;

-- Create Tables

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

    INSERT INTO author (name) VALUES ("First");
    INSERT INTO author (name) VALUES ("Second");
    INSERT INTO author (name) VALUES ("Third");
    INSERT INTO note (title, content, author_id) values ('One', 'This is a first note', 1);
    INSERT INTO note (title, content, author_id) values ('Two', 'This is a second note', 2);
    INSERT INTO note (title, content, author_id) values ('Three', 'This is a third note', 3);

-- Select all notes by an author's name.

    SELECT * FROM note, author WHERE author_id = author.id AND author.id = 1;

-- Select author for a particular note by note ID.

    SELECT name FROM note, author WHERE note.author_id = author.id AND node.id = 1

-- Select the names of all the authors along with the number of notes they each have.

    SELECT name, COUNT(*) as "total" FROM note, author WHERE note.author_id = author.id GROUP BY author_id;

-- Delete authors from the author table.

    DELETE FROM author WHERE name = "Second"; 