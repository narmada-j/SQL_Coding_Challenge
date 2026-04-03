/*
			04 Joins And Union
*/
-- Create database
CREATE DATABASE ecommerce1;
USE employee;
Select * from employees;

-- Create Students table
CREATE TABLE Students (StudentID INT PRIMARY KEY,StudentName VARCHAR(50));

-- Create Courses table
CREATE TABLE Courses (CourseID INT PRIMARY KEY,CourseName VARCHAR(50));

-- Create Enrollments table (bridge between Students & Courses)
CREATE TABLE Enrollments (EnrollmentID INT PRIMARY KEY,entID INT,
    CourseID INT,FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID));

-- Create Employees table (for UNION example)
CREATE TABLE CurrentEmployees (EmpID INT PRIMARY KEY, EmpName VARCHAR(50));

CREATE TABLE PastEmployees (EmpID INT PRIMARY KEY,EmpName VARCHAR(50));
-- createed tables
SHOW TABLES;

-- Students
INSERT INTO Students VALUES(1, 'Alice'),(2, 'Bob'),(3, 'Charlie'),(4, 'Diana');

-- Courses
INSERT INTO Courses VALUES(101, 'Mathematics'),(102, 'Physics'),
(103, 'Computer Science');

-- Enrollments
INSERT INTO Enrollments VALUES
(1, 1, 101),   -- Alice → Mathematics
(2, 2, 102),   -- Bob → Physics
(3, 3, 103);   -- Charlie → Computer Science
-- Diana has no enrollment

-- Current Employees
INSERT INTO CurrentEmployees VALUES
(1, 'John'),(2, 'Mary'),(3, 'Steve');

-- Past Employees
INSERT INTO PastEmployees VALUES
(2, 'Mary'),   -- Duplicate with Current
(4, 'Paul'),(5, 'Emma');
-- all table data
SELECT * FROM Enrollments;
SELECT * FROM Students;
SELECT * FROM Courses;


-- 1: INNER JOIN - Show students with their enrolled course names
SELECT s.StudentName, e.CourseID FROM Students s 
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID;

SELECT s.StudentName, c.CourseName FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;

-- 2: LEFT & RIGHT JOIN -all students and their courses, including those without matches
SELECT s.StudentName, c.CourseName FROM Enrollments e
RIGHT JOIN Courses c ON e.CourseID = c.CourseID
LEFT JOIN Students s ON e.StudentID = s.StudentID;

-- 3: UNION vs UNION ALL - Combine lists of current and past employees. 
-- UNION (removes duplicates)
SELECT EmpName FROM CurrentEmployees 
UNION
SELECT EmpName FROM PastEmployees;

-- UNION ALL (keeps duplicates)
SELECT EmpName FROM CurrentEmployees
UNION ALL
SELECT EmpName FROM PastEmployees;





