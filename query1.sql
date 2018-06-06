pragma foreign_keys = on; -- SQLite ONLY!

.mode column
.header on

drop table album if exists album;
drop table artist if exists artist;

create table album (
  id integer primary key AUTOINCREMENT,
  title varchar(128) not null,
  release_year integer
);

create table artist (
  id integer primary key AUTOINCREMENT,
  name varchar(128) not null
);

create table track (
  id integer primary key AUTOINCREMENT,
  title varchar(128) not null,
  album_id integer references album(id)
);

create table artist_album (
  id integer primary key AUTOINCREMENT,
  artist_id integer references artist(id),
  album_id integer references album(id)
);

.print "albums: "
select * from album;
.print ""

.print "albums made between 1975 and 1990: "
select * from album where release_year > 1975 and release_year < 1990;
.print ""

.print "albums whose name starts with Super D: "
SELECT * FROM album WHERE title LIKE "Super D%";
.print ""

.print "albums that have no release year: "
SELECT * FROM album WHERE release_year IS NULL;
.print ""

.print "all track titles from Super Funky Album: "
SELECT title FROM track WHERE album_id = 2;
.print ""

.print "all track titles from Super Funky Album with Track_Title as column name: "
SELECT title AS Track_Title FROM track WHERE album_id = 2;
.print ""

.print "album titles by Han Solo: "
SELECT title FROM album, artist_album, artist
  WHERE album_id = album.id AND artist_id = artist.id AND artist_id = 3;
.print ""

.print "Average year all albums released:"
SELECT AVG(release_year) AS "average" FROM album;
.print ""

.print "Average year all albums by Leia and the Ewoks released:"
SELECT AVG(release_year) AS "average" FROM album, artist_album, artist
  WHERE album_id = album.id AND artist_id = artist.id AND artist_id = 2;
.print ""

.print "# of artists:"
SELECT COUNT(*) AS "count" FROM artist;
.print ""

.print "# of tracks on Super Dubstep Album:"
SELECT COUNT(*) AS "count" FROM track, album WHERE album_id = album.id AND album.id = 5;