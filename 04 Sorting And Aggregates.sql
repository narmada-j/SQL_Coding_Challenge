/*
			04 Sorting And Aggregates 
*/
-- Create database
CREATE DATABASE ecommerce;
USE ecommerce;

-- Create Employees table
CREATE TABLE employees (
    empid INT PRIMARY KEY AUTO_INCREMENT,empname VARCHAR(100) NOT NULL,
    gender VARCHAR(10), age INT, departmentid INT,
    salary DECIMAL(10,2), hire_date DATE DEFAULT (CURRENT_DATE)
);

-- Create Department table
CREATE TABLE department (
    depid INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100) NOT NULL
);

-- Create Product table
CREATE TABLE product (
    prodid INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2),stock_qty INT DEFAULT 0
);

-- Create Sales table
CREATE TABLE sales (
    salesid INT PRIMARY KEY AUTO_INCREMENT,prodid INT,
    qty INT,sale_date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (prodid) REFERENCES product(prodid)
);

-- created tables
SHOW TABLES;

-- Insert sample data
-- Departments
INSERT INTO department (name) VALUES ('Electronics');
INSERT INTO department (name) VALUES ('Clothing');
INSERT INTO department (name) VALUES ('Home Appliances');

-- Employees
INSERT INTO employees (empname, gender, age, departmentid, salary) 
VALUES ('Arun Kumar', 'Male', 30, 1, 45000.00);
INSERT INTO employees (empname, gender, age, departmentid, salary) 
VALUES ('Priya Sharma', 'Female', 28, 2, 40000.00);

-- Products
INSERT INTO product (name, price, stock_qty) VALUES ('Smartphone', 15000.00, 50);
INSERT INTO product (name, price, stock_qty) VALUES ('Jeans', 1200.00, 200);
INSERT INTO product (name, price, stock_qty) VALUES ('Microwave Oven', 8000.00, 30);

-- Sales
INSERT INTO sales (prodid, qty) VALUES (1, 2); -- 2 Smartphones
INSERT INTO sales (prodid, qty) VALUES (2, 5); -- 5 Jeans
INSERT INTO sales (prodid, qty) VALUES (3, 1); -- 1 Microwave

-- More Employees
INSERT INTO employees (empname, gender, age, departmentid, salary) VALUES ('Ravi Menon', 'Male', 35, 1, 55000.00);
INSERT INTO employees (empname, gender, age, departmentid, salary) VALUES ('Sneha Iyer', 'Female', 26, 2, 38000.00);
INSERT INTO employees (empname, gender, age, departmentid, salary) VALUES ('Karthik Raj', 'Male', 40, 3, 60000.00);
INSERT INTO employees (empname, gender, age, departmentid, salary) VALUES ('Meena George', 'Female', 32, 1, 47000.00);
INSERT INTO employees (empname, gender, age, departmentid, salary) VALUES ('Vikram Singh', 'Male', 29, 2, 42000.00);
INSERT INTO employees (empname, gender, age, departmentid, salary) VALUES ('Anjali Das', 'Female', 31, 3, 51000.00);
INSERT INTO employees (empname, gender, age, departmentid, salary) VALUES ('Suresh Kumar', 'Male', 45, 1, 65000.00);
INSERT INTO employees (empname, gender, age, departmentid, salary) VALUES ('Divya Nair', 'Female', 27, 2, 39000.00);
INSERT INTO employees (empname, gender, age, departmentid, salary) VALUES ('Ajay Patel', 'Male', 33, 3, 48000.00);
INSERT INTO employees (empname, gender, age, departmentid, salary) VALUES ('Lakshmi Rao', 'Female', 36, 1, 53000.00);

-- More Products
INSERT INTO product (name, price, stock_qty) VALUES ('Laptop', 55000.00, 20);
INSERT INTO product (name, price, stock_qty) VALUES ('T-Shirt', 800.00, 300);
INSERT INTO product (name, price, stock_qty) VALUES ('Refrigerator', 25000.00, 15);
INSERT INTO product (name, price, stock_qty) VALUES ('Headphones', 2000.00, 100);
INSERT INTO product (name, price, stock_qty) VALUES ('Shoes', 2500.00, 150);
INSERT INTO product (name, price, stock_qty) VALUES ('Washing Machine', 18000.00, 25);
INSERT INTO product (name, price, stock_qty) VALUES ('Tablet', 12000.00, 40);
INSERT INTO product (name, price, stock_qty) VALUES ('Dress', 2200.00, 80);
INSERT INTO product (name, price, stock_qty) VALUES ('Television', 40000.00, 10);
INSERT INTO product (name, price, stock_qty) VALUES ('Air Conditioner', 35000.00, 12);

-- More Sales
INSERT INTO sales (prodid, qty) VALUES (4, 3);  -- Laptop
INSERT INTO sales (prodid, qty) VALUES (5, 10); -- T-Shirt
INSERT INTO sales (prodid, qty) VALUES (6, 2);  -- Refrigerator
INSERT INTO sales (prodid, qty) VALUES (7, 4);  -- Headphones
INSERT INTO sales (prodid, qty) VALUES (8, 6);  -- Shoes
INSERT INTO sales (prodid, qty) VALUES (9, 1);  -- Washing Machine
INSERT INTO sales (prodid, qty) VALUES (10, 2); -- Tablet
INSERT INTO sales (prodid, qty) VALUES (11, 3); -- Dress
INSERT INTO sales (prodid, qty) VALUES (12, 1); -- Television
INSERT INTO sales (prodid, qty) VALUES (13, 2); -- Air Conditioner

-- 1: ORDER BY & LIMIT - show the top 3 highest-priced products
SELECT * FROM Product
ORDER BY PRICE desc LIMIT 3;

 --  2: Aggregate Functions  - s use COUNT, SUM, AVG, MAX, MIN on Sales/Product table.
SELECT * FROM Sales;
SELECT * FROM Product;

SELECT COUNT(*) AS Tot_Sales FROM Sales;
SELECT SUM(qty) AS Tot_Qty FROM Sales;

SELECT AVG(price) AS Avg_Price FROM Product;
SELECT MAX(price) AS Max_Price FROM Product;
SELECT MIN(price) AS Min_Price FROM Product;

--  3: GROUP BY & HAVING  - Find departments with more than 3 employees.
SELECT DEPARTMENTID,count(*) AS Tot_Employees FROM Employees
GROUP BY DEPARTMENTID HAVING Tot_Employees > 3;


