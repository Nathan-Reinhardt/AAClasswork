PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(100),
  lname VARCHAR(100)
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT,
  body TEXT,
  associated_author INTEGER NOT NULL,

  FOREIGN KEY (associated_author) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_reference_id INTEGER NOT NULL,
  parent_reference_id INTEGER,
  author_reference_id INTEGER NOT NULL,
  body TEXT,

  FOREIGN KEY (question_reference_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reference_id) REFERENCES replies(id),
  FOREIGN KEY (author_reference_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users(fname, lname)
VALUES
  ('Brandon', 'Rodgers'),
  ('Jake', 'Hafner'),
  ('Carlos', 'McGee'),
  ('Alegra', 'Tops'),
  ('Hannah', 'Alvarez');

INSERT INTO
  questions(title, body, associated_author)
VALUES
  ('Sunsets', 'Why is the sky different colors during sunsets?', 3),
  ('Biggest Mountain', 'What is the biggest mountain in our solar system?', 5),
  ('Birds', 'How many species of birds are there?', 2);

INSERT INTO
  question_follows(user_id, question_id)
VALUES
  (3,1),
  (5,2),
  (2,3),
  (4,2),
  (1,3);

INSERT INTO
  replies(question_reference_id, parent_reference_id, author_reference_id, body)
VALUES
  (1,NULL,3,'That is a good question.'),
  (1,1,3,'The molecules in the sky refract the light.'),
  (2,NULL,5,'Mount Everest.'),
  (2,3,5,'No that is wrong!'),
  (2,4,5,'The tallest mountain is actually on Mars.'),
  (3,NULL,2,'No one knows.');

INSERT INTO
  question_likes(user_id, question_id)
VALUES
  (4,2),
  (3,1),
  (5,3),
  (2,2),
  (1,3);
