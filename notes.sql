--INSERT INTO Author (name) VALUES ("Aaron");
--INSERT INTO Notes(title, content, author_id) VALUES ("Stuff to do tonight.", "Finish Day 1.  Finish Day 2.  Go to Bed.", 1);

SELECT Author.name, Notes.title, Notes.content
    FROM Author JOIN Notes
    ON Notes.author_id = Author.ID AND Author.name = "Henry";

SELECT Author.name
    FROM Author, Notes
    WHERE Author.ID = Notes.author_id AND Notes.id = 3;

SELECT Author.name, COUNT(Notes.author_id)
    FROM Notes, Author
    GROUP BY Author.id