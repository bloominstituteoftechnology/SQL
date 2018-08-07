INSERT INTO note (title, content) VALUES ("Week 12: Front-end Dev.", "There are various libraries you can utilize to build front-end of your website. Some includes bootstrap, React, etc.");
INSERT INTO note (title, content) VALUES ("Random title", "Random notes. Just scribling randomly.");
INSERT INTO note (title, content) VALUES ("Another random title", "Just another random writing to test the function of sqlite.");
INSERT INTO note (title, content) VALUES ("123", "4567890");

INSERT INTO author (name) VALUES ("Guy");
INSERT INTO author (name) VALUES ("Another Guy");
INSERT INTO author (name) VALUES ("Keanu Reaves");

SELECT * FROM note, author WHERE note.author = author.name AND author.name = 'Guy'