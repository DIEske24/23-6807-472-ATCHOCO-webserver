-- Create and select the database
CREATE DATABASE school;
USE school;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    course VARCHAR(100),
    year_level INT
);

INSERT INTO students (name, course, year_level) VALUES 
('Juan Dela Cruz', 'BSIT', 1),
('Maria Santos', 'BSCS', 2),
('Pedro Reyes', 'BSIT', 3);

SELECT * FROM students;

SELECT * FROM students WHERE course = 'BSIT';
SELECT * FROM students WHERE year_level >= 2;

INSERT INTO students (name, course, year_level) VALUES 
('Jerahmeel Atchoco', 'BSIT', 3);

SELECT * FROM students;

UPDATE students SET year_level = 2 WHERE name = 'Juan Dela Cruz';
SELECT * FROM students;

DELETE FROM students WHERE name = 'Pedro Reyes';
SELECT * FROM students;

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    description VARCHAR(255),
    units INT
);

INSERT INTO courses (course_name, description, units) VALUES 
('Web Information Systems', 'Study of web architectures, frameworks, and database integration', 3),
('Data Structures and Algorithms', 'Advanced study of data organization and algorithmic efficiency', 3),
('Database Management Systems', 'Relational database design, SQL, and normalization', 3);

SELECT * FROM courses;
