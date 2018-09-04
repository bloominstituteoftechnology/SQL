create table note(
  id integer primary key autoincrement,
  title varchar(128),
  content(varchar(256),
  user_id NOT NULL references user(user_id));

  create table user(
    user_id integer primary key autoincrement,
    username varchar(128),
    created_at timestamp DATE DEFAULT (datetime('now','localtime')));

    INSERT INTO note (title, content) VALUES ("Note 1", "The content of note 1 goes in here", 1);
    insert into note(title, content, user_id) values("Note2", "The content of note 2 goes in here", 2);
    insert into note(title, content, user_id) values("Note3", "The content of note 3 goes in here", 3);
    insert into note(title, content, user_id) values("Note4", "The content of note 4 goes in here", 1);
    insert into note(title, content, user_id) values("Note5", "The content of note 5 goes in here", 1);
    insert into note(title, content, user_id) values("Note6", "The content of note 6 goes in here", 4);
    insert into note(title, content, user_id) values("Note7", "The content of note 7 goes in here", 4);
    insert into note(title, content, user_id) values("Note8", "The content of note 8 goes in here", 4);
    insert into note(title, content, user_id) values("Note9", "The content of note 9 goes in here", 3);
    insert into note(title, content, user_id) values("Note10", "The content of note 10 goes in here", 3);
    insert into note(title, content, user_id) values("Note11", "The content of note 11 goes in here", 3);
    insert into note(title, content, user_id) values("Note12", "The content of note 12 goes in here", 3);


    select * from note N join user U  on U.user_id = N.user_id where U.username = 'adfaris;

    select user_id, id, title, content from note where user_id = 1;

    select username, count(id) from user u join note n ON u.user_id = n.user_id group by username;