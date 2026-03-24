/*
		Constraints 
*/
-- Create Database - creating a database for an online bookstore
CREATE DATABASE Bookstore;
USE Bookstore;

-- 01: Create Table Books and Orders with PRIMARY KEY & FOREIGN KEY
CREATE TABLE Books(BookID INT PRIMARY KEY AUTO_INCREMENT,Title VARCHAR(255) NOT NULL,
Author VARCHAR(255) NOT NULL,Genre VARCHAR(100),Price DECIMAL(10,2) NOT NULL,
Stock INT NOT NULL,PublishedDate DATE);

CREATE TABLE Orders(OrderID INT PRIMARY KEY AUTO_INCREMENT,BookID INT NOT NULL,
CustomerName VARCHAR(255) NOT NULL,OrderDate DATE NOT NULL,Quantity INT NOT NULL,
TotalAmount DECIMAL(10,2) NOT NULL, FOREIGN KEY (BookID) REFERENCES Books(BookID));

SHOW TABLES;
DESCRIBE Books;
DESCRIBE Orders;

ALTER TABLE Books DROP COLUMN Stock;
ALTER TABLE Books DROP COLUMN PublishedDate;
ALTER TABLE Books DROP COLUMN Genre;
ALTER TABLE Orders DROP COLUMN TotalAmount;


-- 2:UNIQUE Constraint - Add a UNIQUE constraint to the ISBN column in Books.
ALTER TABLE Books ADD COLUMN ISBN VARCHAR(21) UNIQUE;
DESCRIBE Books;

-- insert statements
INSERT INTO Books (BookID, Title, Author, ISBN, Price) VALUES 
(1, 'Data Analytics Essentials', 'Jane Doe', '9781234567890', 499.00),
(2, 'SQL Mastery', 'John Smith', '9789876543210', 599.00),
(3, 'Python for Data Science', 'Alice Brown', '9781111111111', 699.00);
INSERT INTO Books (BookID, Title, Author, ISBN, Price) VALUES
(4, 'Machine Learning Basics', 'David Clark', '9782222222222', 799.00),
(5, 'Statistics for Analysts', 'Emily White', '9783333333333', 549.00),
(6, 'Data Visualization with Power BI', 'Michael Green', '9784444444444', 599.00),
(7, 'Advanced SQL Queries', 'Sophia Lee', '9785555555555', 649.00),
(8, 'Excel Power Tools', 'Robert King', '9786666666666', 399.00),
(9, 'Big Data Fundamentals', 'Laura Scott', '9787777777777', 899.00),
(10, 'Business Intelligence Concepts', 'Daniel Adams', '9788888888888', 699.00),
(11, 'Data Cleaning Techniques', 'Olivia Brown', '9789999999999', 459.00),
(12, 'ETL and Data Pipelines', 'Chris Evans', '9781212121212', 729.00),
(13, 'Cloud Data Warehousing', 'Rachel Carter', '9781313131313', 849.00);


INSERT INTO Orders (OrderID, BookID, CustomerName, OrderDate, Quantity) VALUES
(101, 1, 'Narmada', '2026-03-18', 2),
(102, 2, 'Rahul', '2026-03-18', 1),
(103, 3, 'Priya', '2026-03-19', 3);
INSERT INTO Orders (OrderID, BookID, CustomerName, OrderDate, Quantity) VALUES
(104, 4, 'Arun', '2026-03-20', 1),
(105, 5, 'Meena', '2026-03-20', 2),
(106, 6, 'Karthik', '2026-03-21', 1),
(107, 7, 'Divya', '2026-03-21', 3),
(108, 8, 'Suresh', '2026-03-22', 2),
(109, 9, 'Lakshmi', '2026-03-22', 1),
(110, 10, 'Vikram', '2026-03-23', 4),
(111, 11, 'Anita', '2026-03-23', 2),
(112, 12, 'Ravi', '2026-03-24', 1),
(113, 13, 'Geetha', '2026-03-24', 3);

-- View data in table
SELECT * FROM BOOKS;
SELECT * FROM ORDERS;

-- 3: DELETE vs TRUNCATE -  DELETE with WHERE clause and TRUNCATE for Orders table
DELETE FROM Orders where CustomerName = 'Anita';
SELECT * FROM ORDERS;

TRUNCATE TABLE Orders;
SELECT * FROM ORDERS;

