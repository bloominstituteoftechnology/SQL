.mode column
.header on

INSERT INTO author (name) VALUES ("Super Awesome Author 1");
INSERT INTO author (name) VALUES ("Super Awesome Author 2");
INSERT INTO author (name) VALUES ("Super Awesome Author 3");
INSERT INTO author (name) VALUES ("Super Awesome Author 4");
INSERT INTO author (name) VALUES ("Super Awesome Author 5");
INSERT INTO author (name) VALUES ("Super Awesome Author 6");

INSERT INTO note (author_id, title, content, created_on) VALUES (1, "NOTE 1", "WHAT", CURRENT_TIMESTAMP);
INSERT INTO note (author_id, title, content, created_on) VALUES (2, "NOTE 2", "WHAT", CURRENT_TIMESTAMP);
INSERT INTO note (author_id, title, content, created_on) VALUES (3, "NOTE 3", "WHAT", CURRENT_TIMESTAMP);
INSERT INTO note (author_id, title, content, created_on) VALUES (4, "NOTE 4", "WHAT", CURRENT_TIMESTAMP);
INSERT INTO note (author_id, title, content, created_on) VALUES (5, "NOTE 5", "WHAT", CURRENT_TIMESTAMP);
INSERT INTO note (author_id, title, content, created_on) VALUES (6, "NOTE 6", "WHAT", CURRENT_TIMESTAMP);