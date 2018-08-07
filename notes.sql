-- Created Notes table --
CREATE TABLE Notes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    author_id INTEGER REFERENCES authors(id),
    title VARCHAR(128),
    content TEXT,
    created_on DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Created Authors table --
CREATE Table Authors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(128),
    last_name VARCHAR(128),
    gender VARCHAR(128)
);

-- Insert the authors to the author table --
INSERT INTO Authors(first_name, last_name, gender) VALUES ("George", "Orwell", "Male");
INSERT INTO Authors(first_name, last_name, gender) VALUES ("John", "Green", "Male");
INSERT INTO Authors(first_name, last_name, gender) VALUES ("George R.R", "Martin", "Male");
INSERT INTO Authors(first_name, last_name, gender) VALUES ("Suzanne", "Collins", "Female");
INSERT INTO Authors(first_name, last_name, gender) VALUES ("J.K.", "Rowling", "Female");
INSERT INTO Authors(first_name, last_name, gender) VALUES ("Harper", "Lee", "Female");

-- Insert notes to the note table --
INSERT INTO Notes(author_id, title, content) VALUES (1, "Animal Farm", "Great Book");
INSERT INTO Notes(author_id, title, content) VALUES (1, "Fault in Our Stars", "Ok Book");
INSERT INTO Notes(author_id, title, content) VALUES (1, "Game of Thrones", "Amazing Book");
INSERT INTO Notes(author_id, title, content) VALUES (1, "The Hunger Games", "Survival Story");
INSERT INTO Notes(author_id, title, content) VALUES (1, "Harry Potter", "Magical Wizards");
INSERT INTO Notes(author_id, title, content) VALUES (1, "To Kill a Mocking Bird", "Inspirint Book");

-- Select all notes by an author's name --
SELECT title, content FROM Notes, Authors
    WHERE Notes.author_id = Authors.id
    AND Authors.first_name = "John";



