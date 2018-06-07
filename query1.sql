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
select * from album where title like "Super D%";
.print ""

.print "albums that have no release year: "
select * from album where release_year is null;
.print ""

.print "all track titles from Super Funky Album: "
select title from track where album_id = 2;
.print ""

.print "all track titles from Super Funky Album with Track_Title as column name: "
select title as Track_Title from track where album_id = 2;
.print ""

.print "album titles by Han Solo: "
select title from album, artist_album, artist
  where album_id = album.id and artist_id = artist.id and artist_id = 3;
.print ""

.print "Average year all albums released:"
select avg(release_year) as "average" from album;
.print ""

.print "Average year all albums by Leia and the Ewoks released:"
select avg(release_year) as "average" from album, artist_album, artist
  where album_id = album.id and artist_id = artist.id and artist_id = 2;
.print ""

.print "# of artists:"
select count(*) as "count" from artist;
.print ""

.print "# of tracks on Super Dubstep Album:"
select count(*) as "count" from track, album where album_id = album.id and album.id = 5;