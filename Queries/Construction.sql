-- create the users table
CREATE TABLE users (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  PASSWORD VARCHAR(255) NOT NULL
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
  LEVEL INT NOT NULL,
  FOREIGN KEY (quiz_id) REFERENCES quizzes(id)
);

-- create the enrollments table
CREATE TABLE enrollments (
  id INT PRIMARY KEY,
  user_id INT NOT NULL,
  course_id INT NOT NULL,
  LEVEL INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- create the quiz_questions table
CREATE TABLE quiz_questions (
  id INT PRIMARY KEY,
  quiz_id INT NOT NULL,
  question_id INT NOT NULL,
  FOREIGN KEY (quiz_id) REFERENCES quizzes(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- Quiz attempts for storing the quiz attempts
CREATE TABLE `quiz_attempts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `attempt_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `score` int NOT NULL,
  `wrong_questions` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `user_id` (`user_id`),
  KEY `quiz_id` (`quiz_id`),
  CONSTRAINT `quiz_attempts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `quiz_attempts_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci