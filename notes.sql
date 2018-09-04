-- Create note table: id, author, title, content, date_created, date_modified
CREATE TABLE note (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  author INT NOT NULL REFERENCES author(id),
  title VARCHAR(128) NOT NULL,
  content BLOB,
  date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- On note update, update date_modified
CREATE TRIGGER update_date_modified_after_note_update
  AFTER UPDATE
  ON note
  WHEN
    OLD.title <> NEW.title OR
    OLD.content <> NEW.content
BEGIN
  UPDATE note
  SET date_modified = CURRENT_TIMESTAMP
  WHERE id = NEW.id;
END;

-- Create author table: id, name
CREATE TABLE author (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(128) NOT NULL
);