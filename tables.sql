CREATE TABLE album (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    release_year INTEGER
);

CREATE TABLE artist (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL
);

CREATE TABLE track (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    album_id INT REFERENCES album(id)
);

CREATE TABLE artist_album (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    album_id INT REFERENCES album(id),
    artist_id INT REFERENCES artist(id)
);