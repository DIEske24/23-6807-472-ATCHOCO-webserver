# 23-6807-472-ATCHOCO-webserver

Name:JERAHMEEL ATCHOCO
Student ID:23-6807-472
Course/Section:BSIT WEB 3H

Web Server:Python HTTP Server

Port: 8000

What I learned:
I learned how to create and host a simple website using GitHub Codespaces. I realized that I can write and run HTML code without installing the VS Code application on my computer.

Sql 1
Guide Questions
Answer the following questions:
1. What command is used to create a database?
-CREATE DATABASE database_name;
2. What command is used to select a database?
-USE database_name;
3. What command is used to display all tables?
-SHOW TABLES;
4. What SQL command is used to add records?
-INSERT INTO
5. What SQL command is used to retrieve records?
-SELECT
6. What is the purpose of the PRIMARY KEY?
-It uniquely identifies each record in a table, with no duplicate or empty values.
7. What is the purpose of AUTO_INCREMENT?
-It automatically assigns a unique number to the primary key whenever a new row is added.
8. What is the difference between UPDATE and DELETE?
-UPDATE modifies existing data in a table, while DELETE removes entire rows of data from a table.


Sql 2
1. What is a primary key?
-A primary key uniquely identifies each row in a table. It cannot be empty (NULL) or have duplicate values. Examples: students.id, courses.course_id, and enrollments.enrollment_id.
2. What is a foreign key?
-A foreign key is a column that connects two tables by referring to the primary key of another table. In enrollments, student_id links to students(id), while course_id links to courses(course_id).
3. Why is the enrollments table necessary?
-A many-to-many relationship means a student can take many courses, and each course can have many students. The enrollments table connects students and courses, with one row for each enrollment. It can also store extra information, such as enrollment_date.
4. What is the purpose of the JOIN statement?
-JOIN combines data from two or more related tables. It replaces IDs in enrollments with readable information, such as student names and course names.
5. What is the difference between WHERE and ORDER
BY ?
-WHERE filters rows based on a condition. ORDER BY sorts the results in ascending (ASC) or descending (DESC) order without removing any rows.
6. What does GROUP BY do?
-GROUP BY groups rows with the same value so functions like COUNT() can calculate totals for each group, such as the number of students per course.
7. What does COUNT() do?
-COUNT() counts rows in a table. COUNT(*) counts all rows, while COUNT(column) counts only rows where the column is not NULL.
8. What happens if you try to insert an enrollment using a student_id that does not exist?
-MariaDB rejects the insert and shows a foreign key error (1452) because the student does not exist. This prevents enrollments from referencing non-existent students.
9. Why is database normalization important?
-Normalization organizes data into related tables to reduce duplicates, prevent data errors, save storage, and keep information consistent and easy to maintain.
10. What did you learn from this activity?
-In this activity, I learned how primary and foreign keys work and how the enrollments table connects students and courses. I learned how foreign keys prevent invalid data and how JOIN combines tables to display useful information. I also practiced using WHERE, ORDER BY, GROUP BY, and COUNT() to filter, sort, and summarize data. Lastly, I learned how to run an SQL script through the terminal.