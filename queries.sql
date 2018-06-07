pragma foreign_keys = on;

drop table album if EXISTS album;
drop table artist if EXISTS artist;

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
  artist_id integer references artist(id),
  album_id integer references album(id)
);
