CREATE TABLE notes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    content VARCHAR(512) NOT NULL,
    author_id INT REFERENCES author(id)
);

CREATE TABLE author (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL
);

CREATE TABLE author_notes (
    author_id INT REFERENCES author(id),
    notes_id INT REFERENCES notes(id));

INSERT INTO author VALUES (1, 'Nine');
INSERT INTO author VALUES (2, 'Ten');
INSERT INTO author VALUES (3, 'Eleven');
INSERT INTO author VALUES (4, 'War');
INSERT INTO author VALUES (5, 'Twelve');
INSERT INTO author VALUES (6, 'Four');

INSERT INTO notes VALUES (1, "The War Doctor", "Are you capable of speaking without flapping your hands about? And in that battle there was a man with more blood on his hands than any other. A man who would commit a crime that would silence the universe. And that man was me. Great men are forged in fire. It is the privilege of lesser men to light the flame. Whatever the cost. Shall we ask for a better quality of door so we ca", 4);

INSERT INTO notes VALUES (2, "Jelly Babies!", "Well, of course I'm being childish! There's nopoint being grown-up if you can't be childish sometimes. Come on! The trouble with computers, of course, is that they're very sophisticated idiots. They do exactly what you tell them at amazing speed. Even if you order them to kill you. So if you do happen to change your mind, it's very difficult to stopthem from obeying the original order. But not impossible. You're a clumsy, ham fisted idiot! Are you listening to me? Have a jelly baby. It may be irrational of me, but human beings are my favorite species.", 6);

INSERT INTO notes VALUES (3, "Fantastic!", "It's called the TARDIS, this thing. T-A-R-D-I-S. That's Time And Relative Dimension In Space. That’s okay. Culture shock. Happens to the best of us. Anold friend of mine. Well, enemy. The stuff of nightmares reduced to an exhibit. I'm getting old. We're fallin' through space, you and me, clinging to the skin of this tiny little world, and if we let go... Ricky, if I was to tell you what I was doing to the controls of my frankly magnificent timeship, would you even begin to understand? The thing is, Adam, time travel is like visiting Paris. You can't just read the guidebook, you've got to throw yourself in! Eat the food, use the wrong verbs, get chargeddouble and end up kissing complete strangers! Or is that just me?", 1);

INSERT INTO notes VALUES (4, "Allons-y, Alonso!", "There's something else I've always wanted to say: Allons-y, Alonso! I'd call you a genius, except I'm in the room. Aw, I wanted to be ginger! I've never been ginger! And you, Rose Tyler! Fat lot of good you were! You gave up on me! Ooh, that's rude. Is that the sort of man I am now? Am I rude? Rude and not ginger. It is! It's the city of New New York! Strictly speaking, it's the fifteenth New York since the original, so that makes it New-New-New-New-New-New-New-New-New-New-New-New-New-New-New New York.", 2);

INSERT INTO notes VALUES (5, "Bows ties are cool.", "I need...I need...I need... fish fingersand custard! Look at me. No plans, no backup, no weapons worth a damn. Oh, and something else I don'thave: anything to lose. So, if you're sitting up there with your silly little spaceships and your silly little guns and you've any plans on taking the Pandorica tonight; just remember who's standing in your way. Remember every black day I ever stopped you and then, and then, do the smart thing. Let somebody else try first. Frightened people. Give me a Dalek any day.", 3);

INSERT INTO author_notes VALUES (4, 1);
INSERT INTO author_notes VALUES (6, 2);
INSERT INTO author_notes VALUES (1, 3);
INSERT INTO author_notes VALUES (2, 4);
INSERT INTO author_notes VALUES (3, 5);

INSERT INTO notes VALUES (6, "Angry Eyebrows", "Sorry, I'm going to have to relieve you of your pet. Shut up, I was talking to the horse. Don't be lasagna. I've lived for over 2000 years and not all of them have been good. Shut up! Just shut up, shut up, shut up, shuttity up up up! My carer. She cares so I don't have to. Why do you have three mirrors? Why don't you just turn your head? That's a relief. I hate babysitters. I am totally against bantering. I just have one question… do you know how to fly this thing? No sir. Thirteen! You realise one of us is lying about our basic programming. And I think we both know which one that is.", 5);

SELECT author.id, author.name, notes.title
    FROM author, notes
    WHERE notes.author_id = author.id;

SELECT author.id, author.name, notes.title
    FROM author, notes
    WHERE notes.author_id = author.id
    AND author.name = "Twelve"

 SELECT author.id, author.name, notes.id
   FROM author, notes
   WHERE notes.author_id = author.id
   AND notes.id = 2;

SELECT COUNT(notes.title), author.name
   FROM notes, author
   WHERE notes.author_id = author.id
   GROUP BY author.name;

PRAGMA foreign_keys = ON;
DELETE FROM author WHERE ID = 1;

-- It just deleted the author without its associated note!!! 

-- We need to turn foreign key constraints on to prevent that from happening.

-- first normal form
SELECT author.name, notes.id FROM author, notes WHERE author.id = notes.author_id;

--second normal form
SELECT author.name, notes.id
    FROM author, author_notes, notes
    WHERE notes.id = author_notes.notes_id 
    AND author.id = author_notes.author_id ;