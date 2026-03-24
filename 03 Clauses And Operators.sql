/*
			03 Clauses And Operators 
*/
-- create databse

CREATE DATABASE University;
USE University;

-- create table
CREATE TABLE Students (student_id INT PRIMARY KEY, first_name VARCHAR(50) NOT NULL,         
last_name VARCHAR(50) NOT NULL, department VARCHAR(100) NOT NULL, email VARCHAR(100), gpa DECIMAL(3,2));
DESCRIBE Students;

-- insert statement
INSERT INTO Students (student_id, first_name, last_name, department, email, gpa) VALUES
(1, 'Arun', 'Kumar', 'Computer Science', 'arun.kumar@univ.edu', 3.45),
(2, 'Priya', 'Sharma', 'Mechanical Engineering', NULL, 3.20),
(3, 'Ravi', 'Menon', 'Electrical Engineering', 'ravi.menon@univ.edu', 2.95),
(4, 'Sneha', 'Patel', 'Civil Engineering', 'sneha.patel@univ.edu', 3.60),
(5, 'Vikram', 'Rao', 'Computer Science', NULL, 3.10),
(6, 'Meera', 'Nair', 'Information Technology', 'meera.nair@univ.edu', 3.75),
(7, 'Karthik', 'Iyer', 'Electronics', 'karthik.iyer@univ.edu', 2.80),
(8, 'Divya', 'Joshi', 'Computer Science', 'divya.joshi@univ.edu', 3.90),
(9, 'Suresh', 'Pillai', 'Mechanical Engineering', NULL, 2.70),
(10, 'Anita', 'Reddy', 'Civil Engineering', 'anita.reddy@univ.edu', 3.25),
(11, 'Rahul', 'Verma', 'Computer Science', 'rahul.verma@univ.edu', 3.55),
(12, 'Lakshmi', 'Krishnan', 'Information Technology', NULL, 3.40),
(13, 'Ajay', 'Singh', 'Electronics', 'ajay.singh@univ.edu', 2.95),
(14, 'Neha', 'Kapoor', 'Computer Science', 'neha.kapoor@univ.edu', 3.80),
(15, 'Manoj', 'Das', 'Mechanical Engineering', 'manoj.das@univ.edu', 3.05),
(16, 'Pooja', 'Mishra', 'Civil Engineering', NULL, 2.85),
(17, 'Santosh', 'Gupta', 'Computer Science', 'santosh.gupta@univ.edu', 3.50),
(18, 'Rina', 'Chowdhury', 'Information Technology', 'rina.chowdhury@univ.edu', 3.65),
(19, 'Deepak', 'Bose', 'Electronics', NULL, 2.60),
(20, 'Shalini', 'Menon', 'Computer Science', 'shalini.menon@univ.edu', 3.95);

Select * from Students;

-- 1: DISTINCT & WHERE -  list unique departments.
SELECT DISTINCT Department FROM students;

--  2: IS NULL & NOT NULL
SELECT * FROM Students WHERE email IS NULL;
SELECT * FROM Students WHERE email IS NOT NULL;

-- 3: IN, BETWEEN, NOT BETWEEN 
SELECT * FROM Students WHERE GPA BETWEEN 2 AND 3;
SELECT * FROM Students WHERE GPA NOT BETWEEN 2 AND 3;








