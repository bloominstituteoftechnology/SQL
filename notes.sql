CREATE TABLE notes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(128),
  content VARCHAR(1024),
  author_id INTEGER,
  datetime TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE author (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(128)
);


insert into author(name) values ("Cristian");
insert into author(name) values ("Reece");
insert into author(name) values ("Kaleb");

insert into notes(title, content, author_id) values ("Series", "Avatar the last airbender", 1);
insert into notes(title, content, author_id) values ("Play", "Rehearse this section", 2);
insert into notes(title, content, author_id) values ("Dance", "Practice flip", 3);

select title, content from notes, author where notes.author_id = author.id and author.name = 'Kaleb';
select name from author, notes where notes.id = 2 and notes.author_id = author.id;
select author.name, COUNT(notes.id) from author, notes where notes.author_id = author.id group by author.name;

  FOREIGN KEY (author_id) REFERENCES author(id) on delete cascade
