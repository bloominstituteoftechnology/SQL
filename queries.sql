PRAGMA foreign_keys = ON; -- this is for SQLite only

DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS room;

CREATE TABLE player (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL,
    room_id INTEGER REFERENCES room(id) -- this is a foreign key
);

CREATE TABLE object (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL,
);

CREATE TABLE room (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(128) NOT NULL,
  description VARCHAR(1024),
  w_to INT REFERENCES room(id),
  e_to INT REFERENCES room(id),
  s_to INT REFERENCES room(id),
  n_to INT REFERENCES room(id)
);

CREATE TABLE room_object (
  room_id INT REFERENCES room(id),
  object_id INT REFERENCES object(id)
); -- this is a JOIN table..full of FKs only

INSERT INTO room (name, description) VALUES ("Foyer", "This is where it all begins!");
INSERT INTO room (name, description) VALUES ("Hallway", "Between Foyer and rest of the house");

UPDATE room SET n_to=2 WHERE id=1;
UPDATE room SET n_to=1 WHERE id=2;

INSERT INTO player (name, room_id) VALUES ("Beej", 1);

INSERT INTO object (name) VALUES ("Plastic sword");
INSERT INTO object (name) VALUES ("Plastic shield");

INSERT INTO room_object (room_id, object_id) VALUES (1,1); -- sword in the foyer
INSERT INTO room_object (room_id, object_id) VALUES (2,1); -- sword in the hallway
INSERT INTO room_object (room_id, object_id) VALUES (2,2); -- shield in the hallway

SELECT name, room_id FROM player;
-- SELECT room_id FROM player;

SELECT player.name AS "Playa!", room.name, description FROM player, room 
  WHERE player.room_id = room.id AND --this is the JOIN
  player.id = 1;


