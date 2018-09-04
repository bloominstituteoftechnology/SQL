-- CREATE `notes` TABLE
create table notes(
  id integer primary key autoincrement,
  title varchar(255) not null,
  content text,
  creation_date datetime default current_timestamp,
  author_id integer not null,
  foreign key(author_id) references author(id)
);
