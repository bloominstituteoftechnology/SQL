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