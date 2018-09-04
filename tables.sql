CREATE TABLE track (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    albumid INT REFERENCES album(id)
);

CREATE TABLE artist_album (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    albumid INT REFERENCES album(id),
    artistid INT REFERENCES artist(id)
);