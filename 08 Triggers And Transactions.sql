/*
			08 Triggers & Transactions 
*/

-- 1: Trigger - Log every deletion in the Orders table
SELECT * FROM Orders;
SELECT * FROM Order_History;

-- trigger function
DELIMITER $$
CREATE TRIGGER LogOrderDeletion
AFTER DELETE ON Orders
FOR EACH ROW
BEGIN
    INSERT INTO Order_History (OrderID, CustomerName, OrderDate, Amount, DeletedAt)
    VALUES (OLD.OrderID, OLD.CustomerName, OLD.OrderDate, OLD.Amount, NOW());
END $$
DELIMITER ;

-- delete sql
DELETE FROM Orders WHERE OrderID = 101;

-- 2: DCL Commands - Grant reporting access to junior analysts
CREATE USER 'junior_analyst'@'localhost' IDENTIFIED BY 'root123';
SELECT User, Host FROM mysql.user;

-- Grant report access
GRANT SELECT ON employee.* TO 'junior_analyst'@'localhost';
FLUSH PRIVILEGES;

-- Revoke report access
REVOKE SELECT ON employee.* FROM 'junior_analyst'@'localhost';
FLUSH PRIVILEGES;

-- 3: TCL Commands - During a bank transfer, ensure atomicity using COMMIT, ROLLBACK, SAVEPOINT
-- create databse
CREATE DATABASE BankDB;
USE BankDB;

-- create table
CREATE TABLE Accounts (AccountID INT PRIMARY KEY,AccountHolder VARCHAR(50),Balance DECIMAL(10,2));
INSERT INTO Accounts (AccountID, AccountHolder, Balance) VALUES(101, 'Aadhi', 5000.00),
(102, 'Bala', 3000.00),(103, 'Christ', 7000.00);
SELECT * FROM Accounts;
START TRANSACTION;
-- Bank Transfer with commit
-- Deduct 500 from Account 101
UPDATE Accounts SET Balance = Balance - 500
WHERE AccountID = 101;

-- Add 500 to Account 102
UPDATE Accounts SET Balance = Balance + 500
WHERE AccountID = 102;

-- Save changes permanently
COMMIT;


-- Bank transfer with rollback
START TRANSACTION;
-- Deduct 1000 from Account 101
UPDATE Accounts SET Balance = Balance - 1000
WHERE AccountID = 101;
-- Add 1000 to Account 103
UPDATE Accounts SET Balance = Balance + 1000
WHERE AccountID = 103;
-- Something goes wrong → undo everything
ROLLBACK;

-- savepoint
START TRANSACTION;
-- Step 1: Deduct 200 from Account 101
UPDATE Accounts SET Balance = Balance - 200
WHERE AccountID = 101;

-- Create a checkpoint
SAVEPOINT Step1;

-- Step 2: Add 200 to Account 102
UPDATE Accounts SET Balance = Balance + 200
WHERE AccountID = 102;

-- Roll back only to Step1 (undo Step 2, keep Step 1)
ROLLBACK TO Step1;

-- Finally commit whatever is left
COMMIT;

SELECT * FROM Accounts;


