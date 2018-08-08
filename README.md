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

* Create a table called `artist_album` to connect artists to albums. (Note that
  an artist might have several albums and an album might be created by multiple
  artists.)
  * Use foreign keys for this, as well.
 
* Run the queries in the file `setup.sql`. This will populate the tables.
  * Fix any errors at this point by making sure your tables are correct.
  * `DROP TABLE` can be used to delete a table so you can recreate it with
    `CREATE TABLE`.

* Write SQL `SELECT` queries that:
  * Show all albums.
  * Show all albums made between 1975 and 1990.
  * Show all albums whose names start with `Super D`.
  * Show all albums that have no release year.

* Write SQL `SELECT` queries that:
  * Show all track titles from `Super Funky Album`.
  * Same query as above, but rename the column from `title` to `Track_Title` in
    the output.

  * Select all album titles by `Han Solo`.

  * Select the average year all albums were released.

  * Select the average year all albums by `Leia and the Ewoks` were released.

  * Select the number of artists.

  * Select the number of tracks on `Super Dubstep Album`.

### Exercises, Day 2

Create a database for taking notes.

* What are the columns that a note table needs?
id(PK), title, content, author_id(FK(author(id))), datetime

* If you have a timestamp field, how do you auto-populate it with the date?
datetime TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,

* A note should have a foreign key pointing to an author in an author table.
FOREIGN KEY (author_id) REFERENCES author(id)

* What columns are needed for the author table?
id, name

Write queries that:

* Insert authors to the author table.
INSERT INTO author (name) VALUES ('Jack Kerouac');
INSERT INTO author (name) VALUES ('Ken Kesey');
INSERT INTO author (name) VALUES ('Douglas Adams');
INSERT INTO author (name) VALUES ('John Steinbeck');
INSERT INTO author (name) VALUES ('James Joyce');
INSERT INTO author (name) VALUES ('Dylan Thomas');

* Insert notes to the note table.
INSERT INTO notes (title, content, author_id) VALUES ('On the Road', '[...]the only people for me are the mad ones, the ones who are mad to live, mad to talk, mad to be saved, desirous of everything at the same time, the ones who never yawn or say a commonplace thing, but burn, burn, burn like fabulous yellow roman candles exploding like spiders across the stars and in the middle you see the blue centerlight pop and everybody goes “Awww!”', 1);
INSERT INTO notes (title, content, author_id) VALUES ('The Dharma Bums', 'One day I will find the right words, and they will be simple.', 1);
INSERT INTO notes (title, content, author_id) VALUES ('One Flew Over the Cuckoo''s Nest', 'If you don''t watch it people will force you one way or the other, into doing what they think you should do, or into just being mule-stubborn and doing the opposite out of spite.', 2);
INSERT INTO notes (title, content, author_id) VALUES ('Sometimes a Great Notion', 'For there is always a sanctuary more, a door that can never be forced, a last inviolable stronghold that can never be taken, whatever the attack; your vote can be taken, you name, you innards, or even your life, but that last stonghold can only be surrendered. And to surrender it for any reason other than love is to surrender love', 2);
INSERT INTO notes (title, content, author_id) VALUES ('The Electric Kool-Aid Acid Test', 'I''d rather be a lightning rod than a seismograph', 2);
INSERT INTO notes (title, content, author_id) VALUES (' The Hitchhiker''s Guide to the Galaxy', 'Don''t Panic.', 3);
INSERT INTO notes (title, content, author_id) VALUES ('The Restaurant at the End of the Universe', 'The story so far:
In the beginning the Universe was created.
This has made a lot of people very angry and been widely regarded as a bad move.', 3);
INSERT INTO notes (title, content, author_id) VALUES ('The Grapes of Wrath', 'You''re bound to get idears if you go thinkin'' about stuff.', 4);
INSERT INTO notes (title, content, author_id) VALUES ('Canney Row', 'It has always seemed strange to me...The things we admire in men, kindness and generosity, openness, honesty, understanding and feeling, are the concomitants of failure in our system. And those traits we detest, sharpness, greed, acquisitiveness, meanness, egotism and self-interest, are the traits of success. And while men admire the quality of the first they love the produce of the second.', 4);
INSERT INTO notes (title, content, author_id) VALUES ('A Portrait of the Artist as a Young Man', 'I will tell you what I will do and what I will not do. I will not serve that in which I no longer believe, whether it calls itself my home, my fatherland, or my church: and I will try to express myself in some mode of life or art as freely as I can and as wholly as I can, using for my defense the only arms I allow myself to use -- silence, exile, and cunning.', 5);
INSERT INTO notes (title, content, author_id) VALUES ('A Child''s Christmas in Wales', 'It was snowing. It was always snowing at Christmas. December, in my memory, is white as Lapland, though there were no reindeers. But there were cats', 6);

* Select all notes by an author's name.
SELECT * FROM notes where author_id IS (SELECT id FROM author WHERE name IS "Ken Kesey");

* Select author for a particular note by note ID.
SELECT * FROM author where id IS (SELECT author_id FROM notes WHERE id IS 6);

* Select the names of all the authors along with the number of notes they each have. (Hint: `GROUP BY`.)
SELECT name, COUNT(*) FROM notes, author
    WHERE notes.author_id = author.id
    GROUP BY author_id; 

* Delete authors from the author table.
  > Note that SQLite doesn't enforce foreign key constrains by default. You have
  > to enable them by running `PRAGMA foreign_keys = ON;` before your queries.
  
  * What happens when you try to delete an author with an existing note?
  * How can you prevent this?

Submit a file `notes.sql` with the queries that build (`CREATE TABLE`/`INSERT`)
and query the database as noted above.

