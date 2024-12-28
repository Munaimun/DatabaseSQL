CREATE DATABASE college;

-- make the DB active
USE college;

CREATE TABLE student(
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(101, "anil", "78", "C", "Pune"),
(102, "bruce", "95", "A", "Gotham"),
(103, "joker","65", "D", "Gotham");

SELECT * FROM student;
SELECT name, marks FROM student;
SELECT DISTINCT city FROM student; -- distinct will not repeat the same value
SELECT * FROM student WHERE city = "Gotham";
SELECT * FROM student WHERE marks > 80 AND city = "gotham";
SELECT * FROM student ORDER BY marks ASC; -- will show the output in  of marks
SELECT * FROM student ORDER BY marks DESC LIMIT 2; -- will show only 2
SELECT city, COUNT(rollno) FROM student GROUP BY city;

SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY CITY;

SET SQL_SAFE_UPDATES = 0; -- TURNING OFF SAFE MODE SO THAT i CAN UPDATE THE TABLE

UPDATE student
SET grade = "O"
WHERE grade = "A";


UPDATE student
SET name = "Nolan"
WHERE name = "anil";

UPDATE student
SET grade = "B"
WHERE marks > 70;

UPDATE student
SET grade = "A"
WHERE marks > 90;

SELECT * FROM student ORDER BY marks DESC;


CREATE TABLE dept(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO dept
VALUES
(101, "English"),
(102, "IT");

UPDATE dept
SET id = 103
WHERE id = 102;

CREATE TABLE teacher(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id) -- creating a relationship with the id column of the dept table
    ON UPDATE CASCADE
    ON DELETE CASCADE
);


INSERT INTO teacher
VALUES
(101, "sherlock", 101),
(102, "Watson", 102);

SELECT * FROM dept;
SELECT * FROM teacher;
