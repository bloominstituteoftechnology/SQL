-- Formatting

    .mode column
    .header on

-- Enable Foreign Keys

    PRAGMA foreign_keys = ON;

-- Create Tables

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
    album_id   INTEGER, --foreign key
    FOREIGN KEY (album_id) REFERENCES album (id)
    );

    CREATE TABLE artist_album (
        artist_id INTEGER,
        album_id INTEGER,
        FOREIGN KEY(artist_id) REFERENCES artist(id),
        FOREIGN KEY(album_id) REFERENCES album(id)
    );

-- Add Data

    .read setup.db

-- All albums

    SELECT * FROM album

-- All albums between 1975 and 1990

    SELECT * FROM album WHERE release_year <= 1990 AND release_year >= 1975;
    SELECT * FROM album WHERE release_year BETWEEN 1975 AND 1990;

-- All the start with "Super D"

    SELECT * FROM album WHERE title like 'Super D%';

-- All albums with no release date

    SELECT * FROM album WHERE release_year is NULL;

-- All tracks from Super Funky Album

    SELECT track.title
        FROM track, album
        WHERE track.album_id = album.id
        AND album.title = "Super Funky Album";

-- Same query as above, but rename the column from title to Track_Title in the output.

    SELECT track.title AS Track_Title
        FROM track, album
        WHERE track.album_id = album.id
        AND album.title = "Super Funky Album";

-- All album titles from artist Han Solo

    SELECT album.title
        FROM album, artist_album, artist
        WHERE artist_album.album_id = album.id
        AND artist_album.artist_id = artist.id
        AND artist.name = "Han Solo";

-- Average of albums' release years

    SELECT AVG(release_year) FROM album;

-- Average release year for albums by Leia and the Ewoks

    SELECT AVG(release_year) FROM album, artist_album, artist
        WHERE artist_album.artist_id = artist.id
        AND artist_album.album_id = album.id
        AND artist.name = "Leia and the Ewoks";

-- Count artists

    SELECT COUNT(*) FROM artist;

-- Count of tracks on Super Dubstep Album

    SELECT COUNT(*) FROM track, album WHERE track.album_id = album.id AND album.title = 'Super Dubstep Album';  
