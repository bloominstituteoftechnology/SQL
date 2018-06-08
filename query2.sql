pragma foreign_keys = on;

.mode column
.header on

drop table if exists author;
drop table if exists note;

create table author (
  id integer primary key autoincrement,
  name varchar(128) not null
);
create table note (
  id integer primary key autoincrement,
  title varchar(128) not null,
  content varchar(1024),
  author_id integer references author(id),
  date_created datetime not null default(date('now'))
);

insert into author (name) values ("Dostoyevsky");
insert into author (name) values ("Murakami");

insert into note (title, content, author_id) values ('testing', 'this is a test note for D', 1);
insert into note (title, content, author_id) values ('also testing', 'this is a test note for M', 2);

.print "all notes by author's name"
select * from note, author where author_id = author.id;
.print ""

