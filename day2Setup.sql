insert into authors (name) values ("Jake");
insert into authors (name) values ("Lisa");


insert into notes (title,content,author) values ("titleOne","contentOne",1);
insert into notes (title,content,author) values ("titleTwo","contentTwo",1);
insert into notes (title,content,author) values ("titleThree","contentThree",2);


select notes.title,notes.content,authors.name from notes,authors where notes.author = authors.id and authors.name = "Jake";
select notes.title,notes.content,authors.name from notes,authors where notes.id = 1 and notes.author is authors.id
