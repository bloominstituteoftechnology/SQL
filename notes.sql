-- CREATE `notes` TABLE
create table notes(
  id integer primary key autoincrement,
  title varchar(255) not null,
  content text,
  creation_date datetime default current_timestamp,
  author_id integer not null,
  foreign key(author_id) references author(id)
);

-- CREATE `author` TABLE
create table author(
  id integer primary key autoincrement,
  name varchar(255) not null,
  creation_date datetime default current_timestamp
);

-- INSERT AUTHORS INTO `author` TABLE
insert into author (name) values('Brandon');

-- INSERT NOTES IN `note` TABLE
insert into notes (title, content, author_id) values('Note 1', '', 1);

-- SELECT ALL NOTES BY AUTHORS NAME
select title, content from notes, author
where author.name is 'Brandon'
and author.id is notes.author_id;

-- SELECT AUTHOR FOR A PARTICULAR NOTE BY THE NOTE ID
select name from author, notes
where note.id is 2
and author.id is notes.author_id;

-- LIST THE NAME OF EACH AUTHOR AND HOW MANY NOTES THEY HAVE
select author.name, count(notes.id) from author, notes
where author.id is notes.author_id
group by author.name;