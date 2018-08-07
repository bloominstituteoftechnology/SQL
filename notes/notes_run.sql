SELECT * FROM notes, author WHERE notes.author_id = author.id AND author.name = 'Guy';

select author.name from notes, author where notes.author_id = author.id and notes.id = 2;

SELECT author.name, count(*) as note_count FROM notes, author where notes.author_id = author.id group by author.name;

-- deleting an author will give out an error saying there is a foreign key mismatch.
-- using ON DELETE CASCADE will delete child data from child table as soon as the parent data is deleted.
