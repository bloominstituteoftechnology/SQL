# SQL

See [the Lambda page on Relational
Databases](https://github.com/LambdaSchool/Relational-Databases) for more
information. (Note that page is for PostgreSQL, but the SQL information is valid
here.)

## SQLite

SQLite is a popular, simple SQL database.

You can launch into a memory-only DB by running:

```
sqlite3
```

You can specify a persistent DB file with:

```
sqlite3 mydatabase.db
```

When you get to the prompt, you can type `.help` for commands.

Some helpful ones:

* `.mode column` turn on column output for `SELECT`.
* `.header on` turn on column headers for `SELECT`.
* `.read filename` execute the SQL in `filename`.
* `.open dbname` re-open a memory-only DB to a persistent file.
* `.quit` exit SQLite. (Note that if you're using a memory-only DB, all
  data is lost at this point.)

Another potentially useful third-party tool is [DB Browser for
SQLite](https://sqlitebrowser.org/), a GUI-based SQLite viewer and data
manipulator that can also run SQL queries.


## Create a Music Database

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
CREATE TABLE track(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(128) NOT NULL,
  album_id INTEGER NOT NULL,
  FOREIGN KEY(album_id) REFERENCES album(id)
);
```

* Create a table called `artist_album` to connect artists to albums. (Note that
  an artist might have several albums and an album might be created by multiple
  artists.)
  * Use foreign keys for this, as well.
 
 ```sql
 CREATE TABLE artist_album(
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   artist_id INTEGER NOT NULL,
   album_id INTEGER NOT NULL,
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
  SELECT * FROM album WHERE release_year BETWEEN 1975 AND 1990;
  ```
  * Show all albums whose names start with `Super D`.
  ```sql
  SELECT * FROM album WHERE title LIKE 'Super D%';
  ```
  * Show all albums that have no release year.
  ```sql
  SELECT * FROM album WHERE release_year IS NULL;
  ```

---

Great resources: 
* [sqlite-select](http://www.sqlitetutorial.net/sqlite-select/) 
* [sqlite-where](http://www.sqlitetutorial.net/sqlite-where/)
* [where-isnull](https://www.dofactory.com/sql/where-isnull)
* [sqlite-avg](http://www.sqlitetutorial.net/sqlite-avg/)
* [formatting sqlite shell output](https://dba.stackexchange.com/a/40672)

---

* Write SQL `SELECT` queries that:
  * Show all track titles from `Super Funky Album`.
  ```sql
  SELECT track.title 
    FROM track 
    JOIN album ON album.id = track.album_id 
    WHERE album.title IS 'Super Funky Album';
  ``` 
  * Same query as above, but rename the column from `title` to `Track_Title` in
    the output.
  ```sql
  SELECT track.title AS Track_Title 
    FROM track 
    JOIN album ON album.id = track.album_id 
    WHERE album.title IS 'Super Funky Album';
  ``` 
  * Select all album titles by `Han Solo`.
  ```sql
  SELECT artist.name AS Artist, album.title AS Album_Title 
    FROM album 
    JOIN artist_album ON artist_album.album_id = album.id 
    JOIN artist ON artist.id = artist_album.artist_id 
    WHERE artist.name IS 'Han Solo';
  ```
  * Select the average year all albums were released.
  ```sql
  SELECT avg(release_year) FROM album;
  ```

  * Select the average year all albums by `Leia and the Ewoks` were released.
  ```sql
  SELECT AVG(release_year)
    FROM album
    JOIN artist_album ON artist_album.album_id = album.id 
    JOIN artist ON artist.id = artist_album.artist_id 
    WHERE artist.name IS 'Leia and the Ewoks';
  ```

  * Select the number of artists.
  ```sql
  SELECT COUNT(*) AS Number_of_Artists FROM artist;
  ```

  * Select the number of tracks on `Super Dubstep Album`.
  ```sql
  SELECT COUNT(*) AS Number_of_Tracks
    FROM track
    JOIN album ON album.id = track.album_id
    WHERE album.title IS 'Super Dubstep Album';
  ```

### Exercises, Day 2

Create a database for taking notes.

* What are the columns that a note table needs?

|Columns      |Relation |
|:---:        |:---:    |
|id           |Primary  |
|title        |         |
|note_text    |         |
|date_created |         |
|author_id    |Foreign  |

* If you have a timestamp field, how do you auto-populate it with the date?

Per this [StackOverflow answer](https://stackoverflow.com/a/14462319), use `CURRENT_TIMESTAMP` 
as the default value.

* A note should have a foreign key pointing to an author in an author table.

* What columns are needed for the author table?

|Columns      |Relation |
|:---:        |:---:    |
|id           |Primary  |
|author_name  |         |

Write queries that:

* Insert authors to the author table.

* Insert notes to the note table.

* Select all notes by an author's name.

* Select author for a particular note by note ID.

* Select the names of all the authors along with the number of notes they each have. (Hint: `GROUP BY`.)

* Delete authors from the author table.
  > Note that SQLite doesn't enforce foreign key constrains by default. You have
  > to enable them by running `PRAGMA foreign_keys = ON;` before your queries.
  
  * What happens when you try to delete an author with an existing note?<br/>
  `FOREIGN KEY constraint failed`<br/>
  This happens because we are trying to authors, but will end up leaving notes with foreign keys pointing to nowhere if we do so, so the deletion is stopped.

  * How can you prevent this?
  We can set `ON DELETE CASCADE`, which will delete all related rows with a foreign key matching the author being deleted.
  
Submit a file `notes.sql` with the queries that build (`CREATE TABLE`/`INSERT`)
and query the database as noted above.

