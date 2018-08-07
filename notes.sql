INSERT INTO author (name) VALUES ("Fred");
INSERT INTO author (name) VALUES ("Ben");
INSERT INTO author (name) VALUES ("George");
INSERT INTO author (name) VALUES ("Abraham");
INSERT INTO author (name) VALUES ("Thomas");

INSERT INTO note (title, content, author_id) VALUES ("Title 1", "Text 1", 1);
INSERT INTO note (title, content, author_id) VALUES ("Title 2", "Text 2", 2);
INSERT INTO note (title, content, author_id) VALUES ("Title 3", "Text 3", 3);
INSERT INTO note (title, content, author_id) VALUES ("Title 4", "Text 4", 4);
INSERT INTO note (title, content, author_id) VALUES ("Title 5", "Text 5", 5);

SELECT note.title, note.content, author.name FROM note, author WHERE note.author_id = author.id AND author.name = "Fred";

SELECT author.name, note.title, note.content FROM note, author WHERE note.author_id = 3 AND author.id = 3;

SELECT COUNT(note.title), author.name FROM note LEFT JOIN author ON note.author_id = author.id GROUP BY author.name;

DELETE FROM author WHERE author.name = "Thomas";