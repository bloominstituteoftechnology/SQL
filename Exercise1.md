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

<!-- select 2 -->
select title from track  where album_id is (select album_id from album where title is 'Super Funky Album');

select title as TRACK_TITLE from track  where album_id is (select album_id from album where title is 'Super Funky Album');

select title as Han_Solo_Tracks from track where album_id is (select album_id from artist_album where artist_id is (select artist_id from artist where name is 'Han Solo'));

select avg(release_year) AS Average_Release_Year from album;

select AVG(release_year) from album,artist_album, artist where artist_album.artist_id = artist_id and artist_album.album_id = album_id AND artist.name = "Leia and the Ewoks";

select count(name) as NUMBER_OF_ARTISTS from artist;

select count(title) as Number_Of_Tracks_On_Super_Dubstep_Album from track where album_id is(select album_id from album where title is'Super Dubstep Album');

SELECT AVG(release_year) FROM album,artist_album, artist WHERE artist_album.artist_id = artist.id AND artist_album.album_id = album.id AND artist.name = "Leia and the Ewoks";