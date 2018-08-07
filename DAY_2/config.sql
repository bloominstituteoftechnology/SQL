-- Create a DB for Saving Notes
.open lambdanotes.db

-- Create Users Table
CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(128) NOT NULL UNIQUE,
    password VARCHAR(128) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Notes Table
CREATE TABLE note (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(128) NOT NULL,
    content LONGTEXT,
    author INTEGER REFERENCES user(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);