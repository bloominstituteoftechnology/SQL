PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE album (id integer primary key autoincrement, title varchar(128) not null, release_year integer);
CREATE TABLE aritist ( id integer primary key autoincrement, name varchar(128) not null);
COMMIT;
