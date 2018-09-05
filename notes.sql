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

-- Insert authors to the author table
INSERT INTO author (name) VALUES ('Linc Tomsu');
INSERT INTO author (name) VALUES ('Etti Pixton');
INSERT INTO author (name) VALUES ('Zuzana Dixey');
INSERT INTO author (name) VALUES ('Clevie Boyen');
INSERT INTO author (name) VALUES ('Forest Ramsdale');

-- Insert notes to the note table
INSERT INTO note (author, title, content) VALUES (1, 'Augue vestibulum rutrum rutrum neque aenean auctor', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.');
INSERT INTO note (author, title, content) VALUES (1, 'Volutpat eleifend donec ut dolor morbi vel', 'Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.');

INSERT INTO note (author, title, content) VALUES (2, 'Lorem ipsum dolor sit amet consectetuer', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.');
INSERT INTO note (author, title, content) VALUES (2, 'Nisl ut volutpat sapien arcu', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.');
INSERT INTO note (author, title, content) VALUES (2, 'Congue vivamus metus arcu adipiscing molestie', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.');
INSERT INTO note (author, title, content) VALUES (2, 'Sociis natoque penatibus et magnis dis parturient', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.');
INSERT INTO note (author, title, content) VALUES (2, 'Neque aenean auctor gravida sem praesent id massa', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.');

INSERT INTO note (author, title, content) VALUES (3, 'Imperdiet et commodo vulputate justo in blandit ultrices enim lorem', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.');

INSERT INTO note (author, title, content) VALUES (4, 'Volutpat in congue etiam justo', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.');
INSERT INTO note (author, title, content) VALUES (4, 'Tortor duis mattis egestas metus aenean fermentum donec ut', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.');
INSERT INTO note (author, title, content) VALUES (4, 'Ornare imperdiet sapien urna pretium nisl ut volutpat', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.');
INSERT INTO note (author, title, content) VALUES (4, 'Molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.');
INSERT INTO note (author, title, content) VALUES (4, 'Sagittis sapien cum sociis natoque penatibus et magnis', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.');

INSERT INTO note (author, title, content) VALUES (5, 'Aliquam augue quam sollicitudin vitae consectetuer', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.');
INSERT INTO note (author, title, content) VALUES (5, 'At diam nam tristique tortor eu pede', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.');
INSERT INTO note (author, title, content) VALUES (5, 'Vel pede morbi porttitor lorem id ligula', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.');