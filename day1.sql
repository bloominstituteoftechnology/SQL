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
  album_id INTEGER references album(id)
);

CREATE TABLE artist_album (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  artist_id INTEGER references artist(id),
  album_id INTEGER references album(id)
);

/* Show all albums */
select * from album;


-- show albums made between 1975 and 1990
select * from album where release_year > 1975 and release_year < 1990;


-- Show all albums whose names start with Super D.
select * from album where title like "Super D%";


-- Show all albums that have no release year.
select * from album where release_year is null;


-- Show all track titles from Super Funky Album.
select title from track where album_id = 2;



select title as Track_Title from track where album_id = 2;


-- Select all album titles by Han Solo.
select title from album, artist_album, artist
  where album_id = album.id and artist_id = artist.id and artist_id = 3;



-- Select the average year all albums were released.
select avg(release_year) as "average" from album;


-- Select the average year all albums by Leia and the Ewoks were released.
select avg(release_year) as "average" from album, artist_album, artist
  where album_id = album.id and artist_id = artist.id and artist_id = 2;


-- Select the number of artists.
select count(*) as "total" from artist;


-- Select the number of tracks on Super Dubstep Album.
select count(*) as "total" from track, album where album_id = album.id and album.id = 5;