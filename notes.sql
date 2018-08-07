-- Created Notes table --
CREATE TABLE Notes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    author_id INTEGER,
    title VARCHAR(128) NOT NULL,
    content VARCHAR(128) NOT NULL,
    created_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(author_id) REFERENCES author(id)
);

-- Created Authors table --
CREATE Table Authors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(128),
    last_name VARCHAR(128)
);

-- Insert the authors to the author table --
INSERT INTO Authors (name) VALUES ("Mark", "Marchant");
INSERT INTO Authors (name) VALUES ("Krystal", "Negus");
INSERT INTO Authors (name) VALUES ("Donald", "Trump");


-- Insert notes to the note table --
INSERT INTO Notes(author_id, title, content) VALUES (1, "Mark1", "JS is Cool");
INSERT INTO Notes(author_id, title, content) VALUES (1, "Mark2", "I love my dogs");
INSERT INTO Notes(author_id, title, content) VALUES (2, "Krystal1", "I love Mark");
INSERT INTO Notes(author_id, title, content) VALUES (2, "Krystal2", "I am a nurse");
INSERT INTO Notes(author_id, title, content) VALUES (3, "Donald1", "Biggly");
INSERT INTO Notes(author_id, title, content) VALUES (3, "Donald2", "I love my hair");


-- Select all notes by an author's name --
SELECT title, content FROM Notes, Authors
    WHERE Notes.author_id = Authors.id
    AND Authors.name = "Donald";

-- Select the author for a particular note by note ID --
SELECT name FROM Authors, Notes
    WHERE Notes.author_id = Author.id
    AND Notes.id = 3;

-- Select the names of all the authors along with the number of notes they each have --
SELECT author.name, COUNT(*) FROM Authors, Notes
    WHERE Authors.id = Notes.author_id
    GROUP BY Authors.id;

--Delete authors from the author table --
DELETE FROM Authors WHERE Authors.id = 2;


