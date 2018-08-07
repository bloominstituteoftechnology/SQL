# Day 1

### Table Creation

#### Enable Foreign Keys
```sql
PRAGMA foreign_keys = ON;
```
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

Many to many relationship if foreign keys are set up as below

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
```sql
SELECT * FROM album;
```
2. Show all albums made between 1975 and 1990.
```sql
SELECT * FROM album WHERE release_year <= 1990 AND release_year >= 1975;
```
```sql
SELECT * FROM album WHERE release_year BETWEEN 1975 AND 1990;
```
3. Show all albums whose names start with Super D.
```sql
SELECT * FROM album WHERE title like 'Super D%';
```
4. Show all albums that have no release year.
```sql
SELECT * FROM album WHERE release_year IS NULL;
```
5. Show all track titles from Super Funky Album.
```sql
SELECT track.title FROM track, album WHERE track.album_id = album.id AND album.title = "Super Funky Album";
```
6. Same query as above, but rename the column from title to Track_Title in the output.
```sql
SELECT track.title AS "Track_Title" FROM track, album WHERE track.album_id = album.id AND album.title = "Super Funky Album";
```
7. Select all album titles by Han Solo.
```sql
SELECT album.title FROM album, artist, artist_album
WHERE artist_album.album_id = album.id AND
artist_album.artist_id = artist.id AND
artist.name = "Han Solo";
```
8. Select the average year all albums were released.
```sql
SELECT AVG(release_year) FROM album;
```
9. Select the average year all albums by Leia and the Ewoks were released.
```sql
SELECT AVG(release_year) from album, artist_album, artist
WHERE artist_album.artist_id = artist.id AND
artist_album.album_id = album.id AND
artist.name = "Leia and the Ewoks";
```
10. Select the number of artists.
```sql
SELECT Count(*) AS "Total" FROM artist;
```
11. Select the number of tracks on Super Dubstep Album.
```sql
SELECT Count(*) FROM track, album WHERE track.album_id = album.id
AND album.title = "Super Dubstep Album";
```

```sql
SELECT Count(track.id) FROM track, album WHERE track.album_id = album.id
AND album.title = "Super Dubstep Album";
```
# Day 2

#### Note

```sql
CREATE TABLE note (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128),
    content VARCHAR(128),
    author_id INTEGER REFERENCES author(id),
    created_at TIMESTAMP
    DEFAULT CURRENT_TIMESTAMP
);
```

#### Author

```sql
CREATE TABLE author (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128),
    created_at TIMESTAMP
    DEFAULT CURRENT_TIMESTAMP
);
```

#### Insert authors to author table.

```sql
    INSERT INTO author (name) VALUES ("Fred");
    INSERT INTO author (name) VALUES ("Ben");
    INSERT INTO author (name) VALUES ("George");
    INSERT INTO author (name) VALUES ("Abraham");
    INSERT INTO author (name) VALUES ("Thomas");
```
#### Insert notes to the note table.

```sql
    INSERT INTO note (title, content, author_id) VALUES ("Title 1", "Text 1", 1);
    INSERT INTO note (title, content, author_id) VALUES ("Title 2", "Text 2", 2);
    INSERT INTO note (title, content, author_id) VALUES ("Title 3", "Text 3", 3);
    INSERT INTO note (title, content, author_id) VALUES ("Title 4", "Text 4", 4);
    INSERT INTO note (title, content, author_id) VALUES ("Title 5", "Text 5", 5);
```

#### Select notes by an author's name.

```sql
    SELECT note.title, note.content, author.name FROM note, author WHERE note.author_id = author.id AND author.name = "Fred";
```

#### Select author for a particular note by note ID
```sql
    SELECT author.name, note.title, note.content FROM note, author WHERE note.author_id = 3 AND author.id = 3;
```

### Select the names of all the authors along with the number of notes they each have. (Hint: `GROUP BY`.)
```sql
    SELECT COUNT(note.id), author.name FROM note LEFT JOIN author ON note.author_id = author.id GROUP BY author.name;
```

