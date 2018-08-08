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

INSERT INTO author (name) VALUES ('Jack Kerouac');
INSERT INTO author (name) VALUES ('Ken Kesey');
INSERT INTO author (name) VALUES ('Douglas Adams');
INSERT INTO author (name) VALUES ('John Steinbeck');
INSERT INTO author (name) VALUES ('James Joyce');
INSERT INTO author (name) VALUES ('Dylan Thomas');

INSERT INTO notes (title, content, author_id) VALUES ('On the Road', '[...]the only people for me are the mad ones, the ones who are mad to live, mad to talk, mad to be saved, desirous of everything at the same time, the ones who never yawn or say a commonplace thing, but burn, burn, burn like fabulous yellow roman candles exploding like spiders across the stars and in the middle you see the blue centerlight pop and everybody goes “Awww!”', 1);
INSERT INTO notes (title, content, author_id) VALUES ('The Dharma Bums', 'One day I will find the right words, and they will be simple.', 1);
INSERT INTO notes (title, content, author_id) VALUES ('One Flew Over the Cuckoo''s Nest', 'If you don''t watch it people will force you one way or the other, into doing what they think you should do, or into just being mule-stubborn and doing the opposite out of spite.', 2);
INSERT INTO notes (title, content, author_id) VALUES ('Sometimes a Great Notion', 'For there is always a sanctuary more, a door that can never be forced, a last inviolable stronghold that can never be taken, whatever the attack; your vote can be taken, you name, you innards, or even your life, but that last stonghold can only be surrendered. And to surrender it for any reason other than love is to surrender love', 2);
INSERT INTO notes (title, content, author_id) VALUES ('The Electric Kool-Aid Acid Test', 'I''d rather be a lightning rod than a seismograph', 2);
INSERT INTO notes (title, content, author_id) VALUES (' The Hitchhiker''s Guide to the Galaxy', 'Don''t Panic.', 3);
INSERT INTO notes (title, content, author_id) VALUES ('The Restaurant at the End of the Universe', 'The story so far:
In the beginning the Universe was created.
This has made a lot of people very angry and been widely regarded as a bad move.', 3);
INSERT INTO notes (title, content, author_id) VALUES ('The Grapes of Wrath', 'You''re bound to get idears if you go thinkin'' about stuff.', 4);
INSERT INTO notes (title, content, author_id) VALUES ('Canney Row', 'It has always seemed strange to me...The things we admire in men, kindness and generosity, openness, honesty, understanding and feeling, are the concomitants of failure in our system. And those traits we detest, sharpness, greed, acquisitiveness, meanness, egotism and self-interest, are the traits of success. And while men admire the quality of the first they love the produce of the second.', 4);
INSERT INTO notes (title, content, author_id) VALUES ('A Portrait of the Artist as a Young Man', 'I will tell you what I will do and what I will not do. I will not serve that in which I no longer believe, whether it calls itself my home, my fatherland, or my church: and I will try to express myself in some mode of life or art as freely as I can and as wholly as I can, using for my defense the only arms I allow myself to use -- silence, exile, and cunning.', 5);
INSERT INTO notes (title, content, author_id) VALUES ('A Child''s Christmas in Wales', 'It was snowing. It was always snowing at Christmas. December, in my memory, is white as Lapland, though there were no reindeers. But there were cats', 6);

* Select all notes by an author's name.
SELECT * FROM notes where author_id IS (SELECT id FROM author WHERE name IS "Ken Kesey");

* Select author for a particular note by note ID.
SELECT * FROM author where id IS (SELECT author_id FROM notes WHERE id IS 6);

* Select the names of all the authors along with the number of notes they each have. (Hint: `GROUP BY`.)
SELECT name, COUNT(*) FROM notes, author
    WHERE notes.author_id = author.id
    GROUP BY author_id;

* Delete authors from the author table.
  > Note that SQLite doesn't enforce foreign key constrains by default. You have
  > to enable them by running `PRAGMA foreign_keys = ON;` before your queries.

   
  * What happens when you try to delete an author with an existing note?
  `Error: foreign key constraint failed`

  * How can you prevent this?
  CREATE TABLE tablename (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    mykey INTEGER,
    FOREIGN KEY (mykey) REFERENCES maintable(id) ON DELETE CASCADE
  );

  'ON DELETE CASCADE' or 'ON UPDATE CASCADE'