# SQL

Solution branch. See the `master` branch for the assignment.

Make an albums table to hold album information:

```sql
CREATE TABLE album (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    release_year INTEGER
);
```

Make an artists table to hold artist information:

```sql
CREATE TABLE artist (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL
);
```

### Exercises, Day 1

Before you begin, look at the queries in `setup.sql` to get a hint as to the
column names in the following tables. We'll use `setup.sql` later.

* Create a table called `track` that holds information about a music track. It should contain:
  * An autoincrementing `id`
  * A title (of type `VARCHAR`, probably)
  * A reference to an `id` in table `album` (the album the track is on). This
    should be a _foreign key_.
  ```sql
  CREATE TABLE track (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title VARCHAR(128),
      album_id INTEGER,
      FOREIGN KEY(album_id) REFERENCES album(id)
  );
  ```

* Create a table called `artist_album` to connect artists to albums. (Note that
  an artist might have several albums and an album might be created by multiple
  artists.)
  * Use foreign keys for this, as well.
 
  ```sql
  CREATE TABLE artist_albums (
      artist_id INTEGER,
      album_id INTEGER,
      FOREIGN KEY(artist_id) REFERENCES artist(id),
      FOREIGN KEY(album_id) REFERENCES album(id)
  );
  ```
* Run the queries in the file `setup.sql`. This will populate the tables.
  * Fix any errors at this point by making sure your tables are correct.
  * `DROP TABLE` can be used to delete a table so you can recreate it with
    `CREATE TABLE`.

* Write SQL `SELECT` queries that:
  * Show all albums.
    ```sql
    SELECT * FROM album;
    ```
  * Show all albums made between 1975 and 1990.
    ```sql
    SELECT * FROM album WHERE release_year >= 1975 AND release_year < 1990;
    ```
  * Show all albums whose names start with `Super D`.
    ```sql
    SELECT * FROM album WHERE title LIKE "Super D%";
    ```
  * Show all albums that have no release year.
    ```sql
    SELECT * FROM album WHERE release_year IS NULL;
    ```

* Write SQL `SELECT` queries that:
  * Show all track titles from `Super Funky Album`.
    ```sql
    SELECT track.title FROM track, album
        WHERE track.album_id = album.id AND album.title = "Super Funky Album";
    ```
  * Same query as above, but rename the column from `title` to `Track_Title` in
    the output.
    ```sql
    SELECT track.title AS "Track Title" FROM track, album
        WHERE track.album_id = album.id AND album.title = "Super Funky Album";
    ```

  * Select all album titles by `Han Solo`.
    ```sql
    SELECT album.title FROM album, artist_album, artist
        WHERE artist_album.album_id = album.id AND
        artist_album.artist_id = artist.id AND
        artist.name = "Han Solo";
    ```

  * Select the average year all albums were released.
    ```sql
    SELECT AVG(release_year) FROM album;
    ```

  * Select the average year all albums by `Leia and the Ewoks` were released.
    ```sql
    SELECT AVG(release_year) FROM album, artist_album, artist
        WHERE artist_album.album_id = album.id AND
        artist_album.artist_id = artist.id AND
        artist.name = "Leia and the Ewoks";
    ```

  * Select the number of artists.
    ```sql
    SELECT COUNT(*) FROM artist;
    ```

  * Select the number of tracks on `Super Dubstep Album`.
    ```sql
    SELECT COUNT(*) FROM track, album
        WHERE track.album_id = album.id AND
        album.title = "Super Dubstep Album";
    ```

### Exercises, Day 2

Create a database for taking notes.

* What are the columns that a note table needs?
  ```
  id PRIMARY KEY AUTOINCREMENT
  author_id INTEGER(foreign key to author table)
  title VARCHAR
  content TEXT or VARCHAR
  created_on DATETIME
  ```
* If you have a timestamp field, how do you auto-populate it with the date?
  ```sql
  INSERT INTO note (created_on) VALUES (CURRENT_TIMESTAMP);
  ```
* A note should have a foreign key pointing to an author in an author table.
* What columns are needed for the author table?
  ```
  id PRIMARY KEY AUTOINCREMENT
  name
  ```

Write queries that:

* Insert authors to the author table.
* Insert notes to the note table.
* Select all notes by an author's name.
  ```sql
  SELECT title, content FROM note, author
      WHERE note.author_id = author.id AND
      author.name = "Author Name 5";
  ```

* Select author for a particular note by note ID.
  ```sql
  SELECT name FROM note, author
      WHERE note.author_id = author.id AND
      note.id = 6;
  ```

* Select the names of all the authors along with the number of notes they each have. (Hint: `GROUP BY`.)
  ```sql
  SELECT name, COUNT(*) FROM note, author
      WHERE note.author_id = author.id
      GROUP BY author_id;
  ```
* Delete authors from the author table.
  > Note that SQLite doesn't enforce foreign key constrains by default. You have
  > to enable them by running `PRAGMA foreign_keys = ON;` before your queries.
  
  * What happens when you try to delete an author with an existing note?
    ```
    Foreign key constraint failure.
    ```
    How can you prevent this?
    ```
    Delete author's notes first, or use ON DELETE CASCADE.
    ```

Submit a file `notes.sql` with the queries that build (`CREATE TABLE`/`INSERT`)
and query the database as noted above.

