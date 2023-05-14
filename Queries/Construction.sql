-- create the users table
CREATE TABLE users (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);

-- create the courses table
CREATE TABLE courses (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(255)
);

-- create the quizzes table
CREATE TABLE quizzes (
  id INT PRIMARY KEY,
  course_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- create the questions table
CREATE TABLE questions (
  id INT PRIMARY KEY,
  quiz_id INT NOT NULL,
  question_text VARCHAR(255) NOT NULL,
  correct_answer VARCHAR(255) NOT NULL,
  wrong_answer_1 VARCHAR(255) NOT NULL,
  wrong_answer_2 VARCHAR(255) NOT NULL,
  wrong_answer_3 VARCHAR(255) NOT NULL,
  level INT NOT NULL,
  FOREIGN KEY (quiz_id) REFERENCES quizzes(id)
);

-- create the enrollments table
CREATE TABLE enrollments (
  id INT PRIMARY KEY,
  user_id INT NOT NULL,
  course_id INT NOT NULL,
  level INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (course_id) REFERENCES courses(id)
);
