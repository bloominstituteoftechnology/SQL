PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE author (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(128) NOT NULL
);
INSERT INTO author VALUES(1,'Bob');
INSERT INTO author VALUES(2,'testauthor');
INSERT INTO author VALUES(3,'ninja');
CREATE TABLE note (
id INTEGER PRIMARY KEY AUTOINCREMENT,
author_id INTEGER,
title VARCHAR(128),
content TEXT,
created_on DATETIME,
FOREIGN KEY(author_id) REFERENCES author(id));
INSERT INTO note VALUES(1,NULL,NULL,NULL,'2018-08-07 22:52:42');
INSERT INTO note VALUES(2,1,'A NOTE BY BOB','This is the first note made by Bob.',NULL);
INSERT INTO note VALUES(3,1,'ANOTHER NOTE BY BOB','Bob wanted to make another note.',NULL);
INSERT INTO note VALUES(4,2,'This is a note title','This is some content.',NULL);
INSERT INTO note VALUES(5,3,'SNEAKY TITLE','SNEAKY CONTENT.',NULL);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('note',5);
INSERT INTO sqlite_sequence VALUES('author',3);
COMMIT;
