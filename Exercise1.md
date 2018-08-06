create table track (
    id integer primary key autoincrement,
    title varchar(128),
    album_id Integer -- "Foreign Key"
);

create table artist_album (
    artist_id Integer,
    album_id Integer,
    FOREIGN KEY(album_id) REFERENCES track(album_id)
);


create table album (
    title varchar(128),
    release_year Integer
);

create table artist (
    name varchar(128)
);



select * from album
select * from album where release_year >= 1970 AND release_year <= 1990;
select * from album where title like "Super D%";
select * from album where release_year is NULL;
select * from track where title like "Super Funky%";
select * from track.title where track, 