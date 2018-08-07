# Table Creation

# Enable Foreign Keys
PRAGMA foreign_keys = ON;

#### Album

```sql
CREATE TABLE album (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    release_year INTEGER
);
```
#### Artist

```sql
CREATE TABLE artist (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL
);
```

#### Track
One to many if foreign key is set up as below

```sql
CREATE TABLE track (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128),
    album_id INTEGER,
    FOREIGN KEY (album_id) REFERENCES album(id)
);
```

#### Artist Album
- Many to many relationship if foreign keys are set up as below

```sql
CREATE TABLE artist_album (
    artist_id INTEGER,
    album_id INTEGER,
    FOREIGN KEY(artist_id) REFERENCES artist(id),
    FOREIGN KEY(album_id) REFERENCES album(id)
);
```
# Queries

1. Show all albums.

SELECT * FROM album;

2. Show all albums made between 1975 and 1990.

SELECT * FROM album WHERE release_year <= 1990 AND release_year >= 1975;

SELECT * FROM album WHERE release_year BETWEEN 1975 AND 1990;

3. Show all albums whose names start with Super D.

SELECT * FROM album WHERE title like 'Super D%';

4. Show all albums that have no release year.

SELECT * FROM album WHERE release_year IS NULL;

5. Show all track titles from Super Funky Album.

SELECT track.title FROM track, album WHERE track.album_id = album.id AND album.title = "Super Funky Album";

6. Same query as above, but rename the column from title to Track_Title in the output.

SELECT track.title AS "Track_Title" FROM track, album WHERE track.album_id = album.id AND album.title = "Super Funky Album";

7. Select all album titles by Han Solo.

SELECT album.title FROM album, artist, artist_album
WHERE artist_album.album_id = album.id AND
artist_album.artist_id = artist.id AND
artist.name = "Han Solo";

8. Select the average year all albums were released.

SELECT AVG(release_year) FROM album;

9. Select the average year all albums by Leia and the Ewoks were released.

SELECT AVG(release_year) from album, artist_album, artist
WHERE artist_album.artist_id = artist.id AND
artist_album.album_id = album.id AND
artist.name = "Leia and the Ewoks";

10. Select the number of artists.
SELECT Count(*) AS "Total" FROM artist;

11. Select the number of tracks on Super Dubstep Album.
SELECT Count(*) FROM track, album WHERE track.album_id = album.id
AND album.title = 'Super Dubstep Album';

SELECT Count(track.id) FROM track, album WHERE track.album_id = album.id
AND album.title = 'Super Dubstep Album';