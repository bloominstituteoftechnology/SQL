`sqlite3` to open shell
`.tables` to show tables
`CREAT TABLE tableName ();` to create a table
`sqlite3 fileName` to create a file
`Day 1:`

CREATE TABLE album (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128),
    release_year INTEGER
);

CREATE TABLE artist(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL
);

CREATE TABLE track (
    title VARCHAR(256),
    album_id INTEGER,
    FOREIGN KEY(album_id) REFERENCES artist(id)
);

CREATE TABLE artist_album (
    title VARCHAR(256),
    artist_id INTEGER,
    album_id INTEGER,
    FOREIGN KEY(artist_id) REFERENCES artist(id),
    FOREIGN KEY(album_id) REFERENCES album(id)
);

