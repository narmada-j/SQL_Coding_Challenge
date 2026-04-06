/*
			07 Procedures & Views 
*/
USE Employee;
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM SALARIES;

-- 1: Stored Procedure - Fetch employee details by ID
DELIMITER $$
CREATE PROCEDURE GetEmployeesDetailsById(IN p_EmpId INT)
BEGIN
    SELECT Employee_id, Employee_Name, Gender,Age, Hire_Date,Designation FROM Employees
    WHERE Employee_id = p_EmpID;
END $$
DELIMITER ;

-- Calling Store Procedures
CALL GetEmployeesDetailsById(2);

-- 2: Simple View - Management wants a view for employee name and department
CREATE VIEW EmployeeDeptView AS
SELECT e.Employee_Name, d.Department_Name FROM Employees e
INNER JOIN Departments d ON e.department_id = d.department_id;

-- USING VIEW
SELECT * FROM EmployeeDeptView;

-- 3: Complex View - Create a view joining Employees, Departments, and Salaries
CREATE VIEW EmployeeDeptSalaryView AS
SELECT e.Employee_id, e.Employee_Name, d.Department_Name, s.Salary FROM Employees e
INNER JOIN Departments d ON e.Department_ID = d.Department_ID
INNER JOIN Salaries s ON e.Employee_id = s.Employee_id;

-- USING VIEW
SELECT * FROM EmployeeDeptSalaryView order by Employee_id;
