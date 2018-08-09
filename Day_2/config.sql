.open lambdanotes.db

-- CREATE DATABASE lambdanotes;

CREATE TABLE user (
    userId INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(128) NOT NULL UNIQUE,
    password VARCHAR(128) NOT NULL,
    created_at DEFAULT TIMESTAMP
);

CREATE TABLE note (
    noteId INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    content VARCHAR(128),
    userId INTEGER REFERENCES user(userId),
    created_at DEFAULT TIMESTAMP,
    updated_at DEFAULT TIMESTAMP
);

