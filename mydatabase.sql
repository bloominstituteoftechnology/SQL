PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE album (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    release_year INTEGER
);
INSERT INTO album VALUES(1,'Super Awesome Album',1990);
INSERT INTO album VALUES(2,'Super Funky Album',NULL);
INSERT INTO album VALUES(3,'Super Disco Album',1978);
INSERT INTO album VALUES(4,'Super Hairband Album',1984);
INSERT INTO album VALUES(5,'Super Dubstep Album',NULL);
INSERT INTO album VALUES(6,'Super Awesome Album',1990);
INSERT INTO album VALUES(7,'Super Funky Album',NULL);
INSERT INTO album VALUES(8,'Super Disco Album',1978);
INSERT INTO album VALUES(9,'Super Hairband Album',1984);
INSERT INTO album VALUES(10,'Super Dubstep Album',NULL);
CREATE TABLE artist (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL
);
INSERT INTO artist VALUES(1,'Luke and the Droidtones');
INSERT INTO artist VALUES(2,'Leia and the Ewoks');
INSERT INTO artist VALUES(3,'Han Solo');
INSERT INTO artist VALUES(4,'Luke and the Droidtones');
INSERT INTO artist VALUES(5,'Leia and the Ewoks');
INSERT INTO artist VALUES(6,'Han Solo');
CREATE TABLE track (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    album_id   INTEGER, --foreign key
    FOREIGN KEY (album_id) REFERENCES album (id));
INSERT INTO track VALUES(1,'Super Awesome Track 1',1);
INSERT INTO track VALUES(2,'Super Awesome Track 2',1);
INSERT INTO track VALUES(3,'Super Awesome Track 3',1);
INSERT INTO track VALUES(4,'Super Awesome Track 4',1);
INSERT INTO track VALUES(5,'Super Awesome Track 5',1);
INSERT INTO track VALUES(6,'Super Funky Track 1',2);
INSERT INTO track VALUES(7,'Super Funky Track 2',2);
INSERT INTO track VALUES(8,'Super Funky Track 3',2);
INSERT INTO track VALUES(9,'Super Funky Track 4',2);
INSERT INTO track VALUES(10,'Super Disco Track 1',3);
INSERT INTO track VALUES(11,'Super Disco Track 2',3);
INSERT INTO track VALUES(12,'Super Disco Track 3',3);
INSERT INTO track VALUES(13,'Super Hairband Track 1',4);
INSERT INTO track VALUES(14,'Super Hairband Track 2',4);
INSERT INTO track VALUES(15,'Super Hairband Track 3',4);
INSERT INTO track VALUES(16,'Super Hairband Track 4',4);
INSERT INTO track VALUES(17,'Super Hairband Track 5',4);
INSERT INTO track VALUES(18,'Super Hairband Track 6',4);
INSERT INTO track VALUES(19,'Super Hairband Track 7',4);
INSERT INTO track VALUES(20,'Super Dubstep Track 1',5);
INSERT INTO track VALUES(21,'Super Dubstep Track 2',5);
INSERT INTO track VALUES(22,'Super Dubstep Track 3',5);
INSERT INTO track VALUES(23,'Super Dubstep Track 4',5);
INSERT INTO track VALUES(24,'Super Dubstep Track 5',5);
INSERT INTO track VALUES(25,'Super Awesome Track 1',1);
INSERT INTO track VALUES(26,'Super Awesome Track 2',1);
INSERT INTO track VALUES(27,'Super Awesome Track 3',1);
INSERT INTO track VALUES(28,'Super Awesome Track 4',1);
INSERT INTO track VALUES(29,'Super Awesome Track 5',1);
INSERT INTO track VALUES(30,'Super Funky Track 1',2);
INSERT INTO track VALUES(31,'Super Funky Track 2',2);
INSERT INTO track VALUES(32,'Super Funky Track 3',2);
INSERT INTO track VALUES(33,'Super Funky Track 4',2);
INSERT INTO track VALUES(34,'Super Disco Track 1',3);
INSERT INTO track VALUES(35,'Super Disco Track 2',3);
INSERT INTO track VALUES(36,'Super Disco Track 3',3);
INSERT INTO track VALUES(37,'Super Hairband Track 1',4);
INSERT INTO track VALUES(38,'Super Hairband Track 2',4);
INSERT INTO track VALUES(39,'Super Hairband Track 3',4);
INSERT INTO track VALUES(40,'Super Hairband Track 4',4);
INSERT INTO track VALUES(41,'Super Hairband Track 5',4);
INSERT INTO track VALUES(42,'Super Hairband Track 6',4);
INSERT INTO track VALUES(43,'Super Hairband Track 7',4);
INSERT INTO track VALUES(44,'Super Dubstep Track 1',5);
INSERT INTO track VALUES(45,'Super Dubstep Track 2',5);
INSERT INTO track VALUES(46,'Super Dubstep Track 3',5);
INSERT INTO track VALUES(47,'Super Dubstep Track 4',5);
INSERT INTO track VALUES(48,'Super Dubstep Track 5',5);
CREATE TABLE artist_album (
    artist_id INTEGER,
    album_id INTEGER,
    FOREIGN KEY(artist_id) REFERENCES artist(id),
    FOREIGN KEY(album_id) REFERENCES album(id)
);
INSERT INTO artist_album VALUES(1,5);
INSERT INTO artist_album VALUES(1,2);
INSERT INTO artist_album VALUES(2,1);
INSERT INTO artist_album VALUES(2,2);
INSERT INTO artist_album VALUES(3,3);
INSERT INTO artist_album VALUES(3,4);
INSERT INTO artist_album VALUES(1,5);
INSERT INTO artist_album VALUES(1,2);
INSERT INTO artist_album VALUES(2,1);
INSERT INTO artist_album VALUES(2,2);
INSERT INTO artist_album VALUES(3,3);
INSERT INTO artist_album VALUES(3,4);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('album',10);
INSERT INTO sqlite_sequence VALUES('artist',6);
INSERT INTO sqlite_sequence VALUES('track',48);
COMMIT;
