pragma foreign_keys = on;

.mode column
.header on

drop table notes if exist notes;

create table author (
  id integer primary key autoincrement,
  name varchar(128) not null,
);
create table notes (
  id integer primary key autoincrement,
  title varchar(128) not null,
  content varchar(1024),
  date_created datetime not null default(getdate())
  author_id integer references author(id)
);
