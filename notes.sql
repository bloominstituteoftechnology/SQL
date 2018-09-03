PRAGMA foreign_keys= ON; -- Set foreign key constraing MUST BE DO.

-- IMPROVE PRINT: Set to divede in columns and show Headers
.mode column
.headers ON

CREATE TABLE notes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(256) NOT NULL,
  content TEXT NOT NULL,
  author_id VARCHAR(128),
  date_stamp TIMESTAMP DEFAULT(getdate()),
  FOREIGN KEY (author_id) REFERENCES author (id)
)

CREATE TABLE author (
  id INTEGER
)