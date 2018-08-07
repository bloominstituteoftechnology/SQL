SELECT * FROM note where author_id IS (SELECT id FROM author WHERE name IS "Super Awesome Author 1");
SELECT * FROM author where id IS (SELECT author_id FROM note WHERE author_id IS 6);
SELECT name, COUNT(*) FROM note, author
    WHERE note.author_id = author.id
    GROUP BY author_id;