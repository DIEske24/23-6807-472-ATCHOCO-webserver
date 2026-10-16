USE school;

CREATE TABLE IF NOT EXISTS students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    course VARCHAR(100),
    year_level INT
);

CREATE TABLE IF NOT EXISTS courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    description TEXT,
    units INT
);

DROP TABLE IF EXISTS enrollments;

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE
);

DESCRIBE enrollments;

ALTER TABLE enrollments
ADD CONSTRAINT fk_student
FOREIGN KEY (student_id)
REFERENCES students(id);

ALTER TABLE enrollments
ADD CONSTRAINT fk_course
FOREIGN KEY (course_id)
REFERENCES courses(course_id);

DESCRIBE enrollments;

INSERT INTO students (name, course, year_level)
SELECT t.name, t.course, t.year_level
FROM (
    SELECT 'Juan Dela Cruz' AS name, 'BSIT' AS course, 2 AS year_level
    UNION ALL SELECT 'Maria Santos', 'BSIT', 2
    UNION ALL SELECT 'Pedro Reyes', 'BSCS', 1
    UNION ALL SELECT 'Ana Garcia', 'BSCS', 3
    UNION ALL SELECT 'Carlo Mendoza', 'BSIT', 1
) AS t
WHERE NOT EXISTS (SELECT 1 FROM students s WHERE s.name = t.name);

INSERT INTO courses (course_name, description, units)
SELECT t.course_name, t.description, t.units
FROM (
    SELECT 'Web Development' AS course_name, 'HTML, CSS, JavaScript and PHP basics' AS description, 3 AS units
    UNION ALL SELECT 'Database Systems', 'Relational databases and SQL', 3
    UNION ALL SELECT 'Programming', 'Introduction to programming logic', 3
    UNION ALL SELECT 'Networking', 'Computer networks fundamentals', 3
    UNION ALL SELECT 'Data Structures', 'Arrays, lists, stacks and queues', 3
) AS t
WHERE NOT EXISTS (SELECT 1 FROM courses c WHERE c.course_name = t.course_name);

SELECT * FROM students;
SELECT * FROM courses;

INSERT INTO enrollments (student_id, course_id, enrollment_date)
SELECT s.id, c.course_id, e.enrollment_date
FROM (
    SELECT 'Juan Dela Cruz' AS student_name, 'Web Development' AS course_name, '2026-10-07' AS enrollment_date
    UNION ALL SELECT 'Juan Dela Cruz', 'Database Systems', '2026-10-07'
    UNION ALL SELECT 'Maria Santos', 'Web Development', '2026-10-07'
    UNION ALL SELECT 'Maria Santos', 'Networking', '2026-10-08'
    UNION ALL SELECT 'Pedro Reyes', 'Programming', '2026-10-07'
    UNION ALL SELECT 'Pedro Reyes', 'Web Development', '2026-10-08'
    UNION ALL SELECT 'Ana Garcia', 'Database Systems', '2026-10-08'
    UNION ALL SELECT 'Ana Garcia', 'Data Structures', '2026-10-09'
    UNION ALL SELECT 'Ana Garcia', 'Web Development', '2026-10-09'
    UNION ALL SELECT 'Carlo Mendoza', 'Programming', '2026-10-09'
    UNION ALL SELECT 'Carlo Mendoza', 'Networking', '2026-10-10'
    UNION ALL SELECT 'Juan Dela Cruz', 'Programming', '2026-10-10'
) AS e
JOIN students s ON s.name = e.student_name
JOIN courses c ON c.course_name = e.course_name;

SELECT * FROM enrollments;

SELECT
    students.name,
    courses.course_name,
    enrollments.enrollment_date
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id;

SELECT
    students.name,
    courses.course_name
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id
WHERE courses.course_name = 'Web Development';

SELECT
    students.name,
    courses.course_name
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id
ORDER BY students.name ASC;

SELECT
    students.name,
    courses.course_name
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id
ORDER BY students.name DESC;

SELECT COUNT(*) AS total_students
FROM students;

SELECT COUNT(*) AS total_enrollments
FROM enrollments;

SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name;

SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name
ORDER BY number_of_students DESC;

SELECT
    students.id AS student_id,
    students.name AS student_name,
    courses.course_name,
    enrollments.enrollment_date
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id
ORDER BY students.name;

SELECT
    students.id,
    students.name
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id
WHERE courses.course_name = 'Database Systems';

SELECT
    courses.course_id,
    courses.course_name
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id
WHERE students.name = 'Juan Dela Cruz';

SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name;

SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name
ORDER BY number_of_students DESC
LIMIT 1;

SELECT id, name, course, year_level
FROM students
ORDER BY name ASC;

SELECT COUNT(*) AS total_enrollments
FROM enrollments;

