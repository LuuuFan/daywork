CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT,
  lname TEXT,
  is_instructor BOOLEAN
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT,
  body NVARCHAR(128),
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  --
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes(
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO
  users (fname, lname)
VALUES
  ('Lu', 'Fan'),
  ('Kent', 'S');
