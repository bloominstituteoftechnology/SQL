/* Create database for taking notes */
CREATE TABLE author (id INTEGER PRIMARY KEY AUTOINCREMENT, first_name VARCHAR(200) NOT NULL, last_name VARCHAR(255) NOT NULL);

CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(200) NOT NULL, content VARCHAR(255) NOT NULL, author_id INT REFERENCES author(id), created_at datetime default current_timestamp, last_modified datetime default current_timestamp);

/* add authors to database */
INSERT INTO author (first_name, last_name) VALUES ("Robert", "Lazarus");
INSERT INTO author (first_name, last_name) VALUES ("Dylan", "Thomas");
INSERT INTO author (first_name, last_name) VALUES ("Rumtum", "Tugger");
INSERT INTO author (first_name, last_name) VALUES ("Old", "Deuteronomy");
INSERT INTO author (first_name, last_name) VALUES ("Bustopher", "Jones");
INSERT INTO author (first_name, last_name) VALUES ("Rumpus", "Cat");
INSERT INTO author (first_name, last_name) VALUES ("Mister", "Mistoffelees");
INSERT INTO author (first_name, last_name) VALUES ("Skimble", "Shanks");
INSERT INTO author (first_name, last_name) VALUES ("Growl", "Tiger");
INSERT INTO author (first_name, last_name) VALUES ("Jenny", "Anydots");
INSERT INTO author (first_name, last_name) VALUES ("Rumple", "Teazer");
INSERT INTO author (first_name, last_name) VALUES ("Mungo", "Jerrie");
INSERT INTO author (first_name, last_name) VALUES ("Munku", "Strap");

/* Add notes to database */
INSERT into note (title, content, author_id) values ("Guide to Thiefing Bacon", "The trick is to pretend you're not interested", 1);
INSERT into note (title, content, author_id) values ("Hiding in plain sight", "The better you are at hiding, the more treats your mother will guiltily feed you", 1);
INSERT into note (title, content, author_id) values ("Knowing when to Cuddle", "The wise cat learns when sprint day is.", 2);
INSERT into note (title, content, author_id) values ("Splashing in the water", "But not really enjoying getting wet.", 2);
INSERT into note (title, content, author_id) values ("If you offer me pheasant", "I'd rather have grouse.", 3);
INSERT into note (title, content, author_id) values ("When you let me in", "Then I want to go out - I'm always on the wrong side of every door.",3);
INSERT into note (title, content, author_id) values ("The oldest inhabitant croaks", "Well, of all things, can it be really?  Yes, no, oh hi, oh,my eye!  My mind may be wandering, but I confess I believe it is Old Deuteronomy.", 4);
INSERT into note (title, content, author_id) values ("I'm so well preserved", "Because I've observed all my life a routine, and I say - I'm stillin my prime, I shall last out my time, that's the word from the stoutest of cats.", 5);
INSERT into note (title, content, author_id) values ("I've sometimes been heard by the fire", "While I was about on the roof", 7);
INSERT into note (title, content, author_id) values ("There's a whistle down the line at 11:39", "When the night mail's ready to depart - saying Simble, where is Skimble?  Has he gone to hunt the thimble?  We must find him or the train can't start", 8);
INSERT into note (title, content, author_id) values ("Their behavior's not good", "And their manner's not nice.", 10);
INSERT into note (title, content, author_id) values ("We have an extensive reputation", "We make our home in Victoria Grove.", 11);
INSERT into note (title, content, author_id) values ("We go through the house like a hurricane", "No sober person could take his oath - was it Mungojerrie or Rumpleteazer - or could you have sworn that it might've been both?", 12);

/* Select all notes by an author's name */
SELECT note.title, note.content FROM note, author WHERE note.author_id = author.id AND author.first_name = "Robert";
SELECT note.title, note.content FROM note, author WHERE note.author_id = author.id AND author.first_name = "Dylan";
SELECT note.title, note.content FROM note, author WHERE note.author_id = author.id AND author.first_name = "Rumtum";
SELECT note.title, note.content FROM note, author WHERE note.author_id = author.id AND author.first_name = "Old";
SELECT note.title, note.content FROM note, author WHERE note.author_id = author.id AND author.first_name = "Bustopher";
SELECT note.title, note.content FROM note, author WHERE note.author_id = author.id AND author.first_name = "Rumpus";
SELECT note.title, note.content FROM note, author WHERE note.author_id = author.id AND author.first_name = "Mister";
SELECT note.title, note.content FROM note, author WHERE note.author_id = author.id AND author.first_name = "Skimble";
SELECT note.title, note.content FROM note, author WHERE note.author_id = author.id AND author.first_name = "Growl";
SELECT note.title, note.content FROM note, author WHERE note.author_id = author.id AND author.first_name = "Jenny";
SELECT note.title, note.content FROM note, author WHERE note.author_id = author.id AND author.first_name = "Rumple";
SELECT note.title, note.content FROM note, author WHERE note.author_id = author.id AND author.first_name = "Mungo";
SELECT note.title, note.content FROM note, author WHERE note.author_id = author.id AND author.first_name = "Munku";

/* Select author for a particular note by note ID */
SELECT author.first_name, author.last_name FROM note, author WHERE note.author_id = author.id AND note.id = 1;
SELECT author.first_name, author.last_name FROM note, author WHERE note.author_id = author.id AND note.id = 2;
SELECT author.first_name, author.last_name FROM note, author WHERE note.author_id = author.id AND note.id = 3;
SELECT author.first_name, author.last_name FROM note, author WHERE note.author_id = author.id AND note.id = 4;
SELECT author.first_name, author.last_name FROM note, author WHERE note.author_id = author.id AND note.id = 5;
SELECT author.first_name, author.last_name FROM note, author WHERE note.author_id = author.id AND note.id = 6;
SELECT author.first_name, author.last_name FROM note, author WHERE note.author_id = author.id AND note.id = 7;
SELECT author.first_name, author.last_name FROM note, author WHERE note.author_id = author.id AND note.id = 8;
SELECT author.first_name, author.last_name FROM note, author WHERE note.author_id = author.id AND note.id = 9;
SELECT author.first_name, author.last_name FROM note, author WHERE note.author_id = author.id AND note.id = 10;
SELECT author.first_name, author.last_name FROM note, author WHERE note.author_id = author.id AND note.id = 11;
SELECT author.first_name, author.last_name FROM note, author WHERE note.author_id = author.id AND note.id = 12;
SELECT author.first_name, author.last_name FROM note, author WHERE note.author_id = author.id AND note.id = 13;

/* Select names of all the authors along with the number of notes they have */
SELECT author.first_name, author.last_name, COUNT(author_id) FROM author, note WHERE note.author_id = author.id GROUP BY author.last_name;
SELECT author.first_name, author.last_name, COUNT(author_id) FROM author, note WHERE note.author_id = author.id GROUP BY author.first_name;

/* Delete authors from the author table */
DELETE FROM author WHERE id=4;

/* What happens when you try to delete an author with an existing note? */
/* Foreign key constraint error - it does not allow you to delete. */
/* Solution is changing the delete cascade */

/* Step one for me was opening notes.db so that my foreign_key constraints were turned off - .open notes.db */
begin transaction;
alter table note rename to _note_old_;
CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(200) NOT NULL, content VARCHAR(255) NOT NULL, author_id INT REFERENCES author(id) ON DELETE CASCADE, created_at datetime default current_timestamp, last_modified datetime default current_timestamp);
INSERT INTO note SELECT * from _note_old_;
commit;
.quit

/* sqlite3 notes.db */
drop table _note_old_;
DELETE FROM author where author.id = 4;