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
