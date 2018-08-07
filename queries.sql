-- Day01


-- mode column
-- header on

CREATE TABLE track (
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   title VARCHAR(128) NOT NULL,
   album_id   INTEGER, --foreign key
   FOREIGN KEY (album_id) REFERENCES album (id)
);


 PRAGMA foreign_keys = ON;




 CREATE TABLE artist_album (
    artist_id INTEGER,
    album_id INTEGER,
    FOREIGN KEY(artist_id) REFERENCES artist(id),
    FOREIGN KEY(album_id) REFERENCES album(id)
);

-- or

CREATE TABLE artist_album (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  artist_id INTEGER references artist(id),
  album_id INTEGER references album(id)
);


--Write SQL SELECT queries that:

-- Show all albums.
    SELECT * FROM album WHERE album.release_year BETWEEN 1975 AND 1990;
-- Show all albums made between 1975 and 1990.
    SELECT * FROM album WHERE release_year <= 1990 AND release_year >= 1975;
-- Show all albums whose names start with Super D.'%s%', 
    select * from album where title like 'Super D%';
-- Show all albums that have no release year.
--

-- Write SQL SELECT queries that:

-- Show all track titles from Super Funky Album.
    SELECT track.title FROM track, album WHERE track.album_id = album.id AND album.title = "Super Funky Album";

-- Same query as above, but rename the column from title to Track_Title in the output.
    SELECT track.title AS Track_Title FROM track, album WHERE track.album_id = album.id AND album.title = "Super Funky Album";

-- Select all album titles by Han Solo.
    select album.title from album, artist_album, artist where artist_album.album_id = album.id and
    artist_album.artist_id = artist.id and
    artist.name = "Han Solo";
-- or
    select title from album where id in (select album_id from artist_album where artist_id = (select id from artist where name = "Han Solo"));
-- Select the average year all albums were released.
    SELECT AVG(release_year) FROM album;

-- Select the average year all albums by Leia and the Ewoks were released.
    SELECT AVG(release_year) FROM album, artist, artist_album WHERE artist_album.artist_id = artist.id AND artist_album.album_id = album.id AND artist.name = "Leia and the Ewoks";
    -- or
    select AVG(release_year) from (select release_year from album where id in (select album_id from artist_album where artist_id = (select id from artist where name = "Leia and the Ewoks")));
    -- or
    select AVG(release_year) from album, artist_album, artist
    where artist_album.artist_id = artist.id and
    artist_album.album_id = album.id and
    artist.name = "Leia and the Ewoks";

-- Select the number of artists.
    select count(*) as "total" from artist;

-- Select the number of tracks on Super Dubstep Album.
    SELECT COUNT(track.id) FROM track, album WHERE track.album_id = album.id AND album.title = 'Super Dubstep Album';


    day02: 

-- sqlite3 notedb
    -- .open notedb.db

CREATE TABLE author (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        author_name VARCHAR(128) NOT NULL,
        creation_date TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE notes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    content VARCHAR NOT NULL,
    author_id INT REFERENCES author(id), 
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Write queries that:

-- * Insert authors to the author table.
INSERT INTO author (author_name) VALUES ("imran");


-- * Insert notes to the note table.
INSERT INTO notes (title, content, author_id) VALUES ("test note1", "hi this is a test note", 1);


-- * Select all notes by an author's name.
SELECT * FROM notes,author WHERE notes.author_id = author.id AND author.author_name='imran';

-- * Select author for a particular note by note ID.
SELECT author_name FROM notes,author WHERE notes.author_id = author.id AND notes.id=1;

-- SELECT author_name FROM notes,author WHERE notes.author_id = author.id AND notes.title='test note1';

-- * Select the names of all the authors along with the number of notes they each have. (Hint: `GROUP BY`.)

SELECT author_name, COUNT(*) as "total" FROM notes, author WHERE notes.author_id = author.id GROUP BY author_id;

-- * Delete authors from the author table.
--   > Note that SQLite doesn't enforce foreign key constrains by default. You have
--   > to enable them by running `PRAGMA foreign_keys = ON;` before your queries.
  
--   * What happens when you try to delete an author with an existing note?
--   * How can you prevent this?
-- sqlite> delete from author where author_name='imran2';
-- Error: FOREIGN KEY constraint failed

-- Submit a file `notes.sql` with the queries that build (`CREATE TABLE`/`INSERT`)
-- and query the database as noted above.