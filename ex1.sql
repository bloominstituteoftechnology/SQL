CREATE TABLE album (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(128) NOT NULL, release_year INTEGER);
CREATE TABLE artist (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(128) NOT NULL);

/* Exercises, Day 1 */ 

/* 1. Create a table called track that holds information about a music track. It should contain: */ 

	/* - An autoincrementing id */ 
	/*  A title (of type varchar, probably) */ 
	/* A reference to an id in table album (the album the track is on). This should be a foreign key. */ 

    CREATE TABLE track (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(128) NOT NULL, album_id INTEGER NOT NULL REFERENCES album(id));

/* 2. Create a table called artist_album to connect artists to albums. (Note that an artist might have several albums AND an album might be created by multiple artists.) */ 

	/* - Use foreign keys for this, as well. */ 

    CREATE TABLE artist_album (artist_id INTEGER NOT NULL REFERENCES artist(id), album_id INTEGER NOT NULL REFERENCES album(id));

/* 3. Run the queries in the file setup.sql. This will populate the tables. */ 

	/* - Fix any errors at this point by making sure your tables are correct. */ 
	/* - DROP TABLE can be used to delete a table so you can recreate it with CREATE TABLE. */ 

/* 4. Write SQL SELECT queries that: */ 

	/* - Show all albums. */ 

    SELECT * FROM album;
	
    /* - Show all albums made between 1975 and 1990. */ 
	
    SELECT * FROM album WHERE release_year >= 1975 AND release_year <= 1990;    
    
    /* - Show all albums whose names start with Super D. */ 

    SELECT * FROM album WHERE title LIKE 'Super D%'; 
	
    /* - Show all albums that have no release year. */ 

    SELECT * FROM album WHERE release_year is NULL;

/* 5. Write SQL SELECT queries that: */ 

	/* - Show all track titles FROM Super Funky Album. */ 

    SELECT title FROM track WHERE title LIKE 'Super Funky%';

	/* - Same query as above, but rename the column FROM title to Track_Title in the output. */ 
	
    SELECT title AS Track_Title FROM track WHERE title LIKE 'Super Funky%';

    /* - Select all album titles by Han Solo. */ 
    
    SELECT title FROM (SELECT album.title, artist.name FROM album, artist, artist_album WHERE album.id = artist_album.album_id AND artist.id = artist_album.artist_id) 
        WHERE name = 'Han Solo';
	
    /* - Select the average year all albums were released. */ 

    SELECT AVG(release_year) FROM album;

	/* - Select the average year all albums by Leia AND the Ewoks were released. */ 

    SELECT AVG(release_year) FROM (SELECT album.title, album.release_year, artist.name FROM album, artist, artist_album WHERE album.id = artist_album.album_id AND artist.id = artist_album.artist_id) 
        WHERE name = 'Leia AND the Ewoks';

	/* - Select the number of artists. */ 

    SELECT Count(id) FROM artist;

	/* - Select the number of tracks on Super Dubstep Album. */ 

    SELECT Count(id) FROM track WHERE title LIKE 'Super Dubstep%';