/*
			05 Functions
*/
-- Use database
USE employee;

SELECT * FROM employees;

--  1: String Functions - Clean up employee names for reporting
SELECT Employee_name, UPPER(Employee_name) AS UpperName FROM Employees;

SELECT Employee_name, LOWER(Employee_name) AS LowerName FROM Employees;

SELECT Employee_name, SUBSTRING(Employee_name,1,4) AS SubName FROM Employees;

SELECT Employee_name,Gender,CONCAT(Employee_name, ' - ', Gender) AS EmpName_Gender FROM Employees;

-- 2: Date Functions - Calculate employee tenure in years
SELECT Employee_name,Hire_date,YEAR(NOW()) - YEAR(hire_date) AS TenureYears FROM Employees;

SELECT Employee_name, Hire_date, 
ROUND(DATEDIFF(NOW(), hire_date) / 365, 1) AS TenureYears
FROM Employees;

-- 3: User-defined Function - Create a reusable function to return full name of a student
-- Create the function
DELIMITER //
CREATE FUNCTION GetNameWithGender (
    EmpName VARCHAR(50),
    Gender VARCHAR(10)
)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    RETURN CONCAT(EmpName, ' - ', Gender);
END //
DELIMITER ;

-- Test the function
SELECT Employee_id,Employee_name,Gender,
       GetNameWithGender(employee_name, gender) AS FullName
FROM Employees;
