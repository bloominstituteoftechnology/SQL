PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS notes;
DROP TABLE IF EXISTS author;

create table notes (
    id integer primary key autoincrement,
    title varchar(128),
    content varchar(128),
    created_on datetime,
    author_id integer,
    foreign key(author_id) references author(id)
);

create table author (
    id integer primary key autoincrement,
    name varchar(128)
);

insert into author (name) values ("Jane Austen");
insert into author (name) values ("PG Wodehouse");
insert into author (name) values ("Mortimer Adler");
insert into author (name) values ("Anton Chekhov");

insert into notes (title, content, created_on, author_id) values ("Pride and Prejudice", "It is a truth universally acknowledged...", current_timestamp, 1);
insert into notes (title, content, created_on, author_id) values ("Jeeves and Wooster", "Good morning, Jeeves!", current_timestamp, 2);
insert into notes (title, content, created_on, author_id) values ("How to Read a Book", "In the case of books...", current_timestamp, 3);

select title, content from notes, author
    where notes.author_id = author.id and
    author.name = "Jane Austen";

select name from notes, author
    where notes.author_id = author.id and
    notes.id = 3;

select name, count(*) from notes, author
    where notes.author_id = author.id
    group by author_id;

delete from author where id >= 4;