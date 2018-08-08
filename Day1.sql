PRAGMA foreign_keys = ON; --enable foreign key constraints for sqlite

CREATE TABLE track (id INT NOT NULL AUTOINCREMENT PRIMARY KEY, title VARCHAR(128) NOT NULL, album_id INT, FOREIGN KEY(album_id) REFERENCES album(title) ON DELETE CASCADE);

CREATE TABLE artist_album (artist_id INT REFERENCES artist(id), album_id INT REFERENCES album(id));

CREATE TABLE album (id INT NOT NULL AUTOINCREMENT PRIMARY KEY, title VARCHAR(128), release_year INT)

CREATE TABLE artist(id INT NOT NULL AUTOINCREMENT PRIMARY KEY, name VARCHAR(128) NOT NULL)