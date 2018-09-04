/*create a persistent DB file*/
sqlite3 notes.db

/*Turns on foreign key constraints*/
PRAGMA foreign_keys = ON

/*Turn on column out put and headers for `SELECT`*/
.mode COLUMN
.header ON

/*CREATE TABLES*/
CREATE TABLE author(
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    first_name VARCHAR(128) NOT NULL, 
    last_name VARCHAR(128) NOT NULL
);

CREATE TABLE note (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    title VARCHAR(128) NOT NULL, 
    content VARCHAR(255) NOT NULL, 
    author_id INT REFERENCES author(id), 
    created_on DATETIME DEFAULT CURRENT_TIMESTAMP, 
    last_modified DATETIME DEFAULT CURRENT_TIMESTAMP
);

/*QUERIES*/
INSERT INTO author (first_name, last_name) VALUES ("Edgar", "Poe");
INSERT INTO author (first_name, last_name) VALUES ("Mark", "Twain");
INSERT INTO author (first_name, last_name) VALUES ("George", "Orwell");
INSERT INTO author (first_name, last_name) VALUES ("Michael", "Chrichton");
INSERT INTO author (first_name, last_name) VALUES ("Daniel", "Lazare");
INSERT INTO author (first_name, last_name) VALUES ("Gore", "Vidal");

INSERT into note (title, content, author_id) values ("The Raven", "Nevermore", 1);
INSERT into note (title, content, author_id) values ("Secret to Success", "All you need in this life is ignorance and confidence, and then success is sure.", 2);
INSERT into note (title, content, author_id) values ("Animal Farm", "Mr. Jones, of the Manor Farm, had locked the hen-houses for the night, but was too drunk to remember to shut the pop-holes", 3);
INSERT into note (title, content, author_id) values ("Question Everything", "I am certain there is too much certainty in the world.", 4);
INSERT into note (title, content, author_id) values ("The Frozen Republic", "The Antidote to the notion of the Constitution as the embodiment of timeless wisdom is to understand it as the very timely and time-bound product of a specific era", 5);
INSERT into note (title, content, author_id) values ("One must enjoy life", "I never miss a chance to have sex or appear on television.", 6);
INSERT into note (title, content, author_id) values ("Voter Anxiety", "Fifty percent of people won't vote, and fifty percent don't read newspapers. I hope it's the same fifty percent.", 6);
INSERT into note (title, content, author_id) values ("Silence is Golden", "It is better to keep your mouth closed and let people think you are a fool than to open it and remove all doubt.", 2);
INSERT into note (title, content, author_id) values ("1984", "It was a bright day in April, and the clocks were striking thirteen.", 3);

