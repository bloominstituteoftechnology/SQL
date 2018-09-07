CREATE TABLE author (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(128) NOT NULL
);

CREATE TABLE note (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    body TEXT NOT NULL,
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    author_id INT REFERENCES author(id)
);

INSERT INTO author (name) VALUES ('Proust');
INSERT INTO author (name) VALUES ('Dostoevsky');
INSERT INTO author (name) VALUES ('Twain');
INSERT INTO author (name) VALUES ('Plath');
INSERT INTO author (name) VALUES ('Morrison');

INSERT INTO note (title, body, author_id) VALUES ('Le Temps Perdu', 'In search of lost time', 1);
INSERT INTO note (title, body, author_id) VALUES ('Crime and Punishment', 'Raskolnikova', 2);
INSERT INTO note (title, body, author_id) VALUES ('Toulumne County', 'Yosemite', 3);
INSERT INTO note (title, body, author_id) VALUES ('The Bell Jar', 'Fig Trees', 4);
INSERT INTO note (title, body, author_id) VALUES ('Beloved', 'Oprah', 5);