-- =============================================
-- DATABASE AND TABLE CREATION
-- =============================================
CREATE DATABASE IF NOT EXISTS college;
USE college;

-- STUDENT TABLE
CREATE TABLE IF NOT EXISTS student (
    roll INT PRIMARY KEY,
    full_name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(30),
    age INT DEFAULT 19
);

-- DEPARTMENT TABLE
CREATE TABLE IF NOT EXISTS dept (
    id INT PRIMARY KEY,
    name VARCHAR(20)
);

-- TEACHER TABLE
CREATE TABLE IF NOT EXISTS teacher (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- =============================================
-- INSERT DATA
-- =============================================
INSERT INTO dept (id, name) VALUES
(101, 'English'),
(102, 'CSE');

-- Example: Update a department id
UPDATE dept
SET id = 100
WHERE id = 101;

SELECT * FROM dept;

INSERT INTO teacher (id, name, dept_id) VALUES
(1, 'Fahad', 102),
(2, 'Maktum', 101); -- This will error if dept 101 no longer exists

SELECT * FROM teacher;

INSERT INTO student (roll, full_name, marks, grade, city, age) VALUES
(1, 'Fahad', 96, 'A', 'Dhaka', 20),
(2, 'Maktum', 99, 'A', 'Sylhet', 21),
(3, 'Sakin', 98, 'A', 'Dhaka', 22),
(11, 'Samir', 66, 'D', 'Dhaka', 19),
(21, 'Efty', 99, 'A', 'Dhaka', 20),
(31, 'Ramim', 80, 'A', 'Kishoreganj', 19),
(4, 'Didal', 77, 'C', 'Keraniganj', 18),
(51, 'Ronaldo', 68, 'D', 'Lisbon', 40);

SELECT * FROM student ORDER BY marks DESC;

-- =============================================
-- AGGREGATION EXAMPLES
-- =============================================
-- Count students by city
SELECT city, COUNT(roll) AS student_count
FROM student
GROUP BY city;

-- Count students by grade
SELECT grade, COUNT(full_name) AS count_per_grade
FROM student
GROUP BY grade
ORDER BY grade;

-- =============================================
-- UPDATE AND DELETE
-- =============================================
-- Update grades
UPDATE student
SET grade = 'G'
WHERE grade = 'D';

-- Delete students with marks < 80
SET SQL_SAFE_UPDATES = 0; -- disable safe update mode
DELETE FROM student
WHERE marks < 80;

SELECT * FROM student;

-- =============================================
-- ALTER TABLE EXAMPLES
-- =============================================
-- Add new column
ALTER TABLE student
ADD COLUMN scholarship BOOLEAN DEFAULT FALSE;

-- Drop a column
ALTER TABLE student
DROP COLUMN grade;

-- Rename a column
ALTER TABLE student
RENAME COLUMN full_name TO student_name;

SELECT * FROM student;

-- =============================================
-- JOIN EXAMPLES
-- =============================================
-- LEFT JOIN: all students, matching department (if any)
SELECT s.student_name, t.name AS teacher_name, d.name AS department_name
FROM student s
LEFT JOIN teacher t ON s.roll = t.id  -- just example, usually join on dept_id
LEFT JOIN dept d ON t.dept_id = d.id;

-- RIGHT JOIN: all teachers, matching students (if any)
SELECT s.student_name, t.name AS teacher_name
FROM student s
RIGHT JOIN teacher t ON s.roll = t.id;

-- FULL OUTER JOIN: combine LEFT and RIGHT JOIN (MySQL doesn't have FULL JOIN directly)
-- Use UNION of LEFT and RIGHT joins
SELECT s.student_name, t.name AS teacher_name
FROM student s
LEFT JOIN teacher t ON s.roll = t.id
UNION
SELECT s.student_name, t.name AS teacher_name
FROM student s
RIGHT JOIN teacher t ON s.roll = t.id;

-- =============================================
-- QUERY FILTERING EXAMPLES
-- =============================================
-- Students from Lisbon
SELECT student_name FROM student
WHERE city = 'Lisbon';

-- =============================================
-- ORDERING
-- =============================================
SELECT * FROM student
ORDER BY marks DESC;

