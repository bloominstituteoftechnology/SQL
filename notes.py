# import sqlite3
import sqlite3

#import Notes and Author class from other files

from note import Note
from author import Author


##connect to a database. If one doesnt exist,
#this creates a new one. If it already does, 
#this will just connect to it.
conn = sqlite3.connect('notes.db')
#instead of setting a file name, you can use (:memory:)
#this gives you a db in RAM.

#create a cursor to allow us to 
#execute sql commands.
#use c.execute()
c = conn.cursor()

#create my tables

#c.execute("""CREATE TABLE notes (
#            id INTEGER PRIMARY KEY AUTOINCREMENT,
#            title VARCHAR(128) NOT NULL,
#            content VARCHAR(128) NOT NULL,
#            author VARCHAR(128) NOT NULL
#            )""")

#c.execute("""CREATE TABLE note_author (
#            author_id integer,
#            note_id id integer,
#            FOREIGN KEY(author_id) REFERENCES notes(id)
#)""")

#c.execute("""CREATE TABLE authors (
#            id INTEGER PRIMARY KEY AUTOINCREMENT,
#            first_name VARCHAR(128) NOT NULL,
#            last_name VARCHAR(128) NOT NULL
#)""")

conn.commit()

#functions

#INSERT AUTHORS INTO AUTHOR TABLE
def insert_author(auth):
    with conn: # context managert
        c.execute("INSERT INTO authors VALUES(:id, :first_name, :last_name)",
        {'id': int(auth.id), 'first_name': auth.first_name, 'last_name': auth.last_name})

#INSERT note INTO notes TABLE
def insert_note(note):
    with conn:
        print(note)
        print(note.id)
        print(type(note.id))
        c.execute("INSERT INTO notes VALUES(:id, :title, :content, :author)",
        {'id': int(note.id), 'title': note.title, 'content': note.content, 'author': note.author})

        #SELECT NOTES BY AUTHORS NAME

        #=-=-=-=-=-=-=-=-=-= DIRECT COMMANDS IN TERMINAL =-=-=-=-=-=-=-=-=-=-=
        
        # SELECT * FROM notes WHERE author='Mike Jones'
        # SELECT * FROM notes WHERE author='Jim Mckenzie'
        # SELECT * FROM notes WHERE author='Janet Parker'
        # SELECT * FROM notes WHERE author='Hilary Jimzon'

        #SELECT * FROM notes WHERE id IS 1;
        #SELECT * FROM notes WHERE id IS 2;
        #SELECT * FROM notes WHERE id IS 3;
        #SELECT * FROM notes WHERE id IS 4;

        #DELETE FROM authors WHERE first_name IS #'Mike' AND last_name IS 'Jones';

        #DELETE FROM authors WHERE first_name IS 'Jim' #AND last_name IS 'Mckenzie';

        #DELETE FROM authors WHERE first_name IS #'Janet' AND last_name IS 'Parker';

        #DELETE FROM authors WHERE first_name IS #'Hilary' AND last_name IS 'Jimzon';





#new notes
note_1 = Note(1, 'First Note', 'This is my first note content', 'Mike Jones')
note_2 = Note(2, 'Second Note', 'This is my second note content', 'Jim Mckenzie')
note_3 = Note(3, 'Third Note', 'This is my third note content', 'Janet Parker')
note_4 = Note(4, 'Fourth Note', 'This is my fourth note content', 'Hilary Jimzon')

auth_1 = Author(1, 'Mike', 'Jones')
auth_2 = Author(2, 'Jim', 'Mckenzie')
auth_3 = Author(3, 'Janet', 'Parker')
auth_4 = Author(4, 'Hilary', 'Jimzon')

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= INSERTION DONE HERE =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#insert_note(note_1)
#insert_note(note_2)
#insert_note(note_3)
#insert_note(note_4)

#insert_author(auth_1)
#insert_author(auth_2)
#insert_author(auth_3)
#insert_author(auth_4)

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= QUESTION ANSWERS =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# - You could use GetDate() for this instance to have a corrcet date and time field with each note. 
# - If you try to delete an author with existing notes, the notes wont corrcespond properly anymore. 


conn.close()