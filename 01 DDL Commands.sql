/*
DDL Commands 
*/
-- Create Database
CREATE DATABASE Hospital;
USE Hospital;

-- 1: CREATE Table - create a table named Patients with fields (PatientID, PatientName, Age, Gender, AdmissionDate). 
CREATE TABLE Patients (PatientID INT PRIMARY KEY,PatientName VARCHAR(100),Age INT,Gender VARCHAR(8),AdmissionDate DATE);
SHOW TABLES;
DESCRIBE Patients;

-- 2: ALTER – Add Column  - add a new column DoctorAssigned VARCHAR(50) to the Patients table
ALTER TABLE Patients ADD COLUMN DoctorAssigned VARCHAR(100);
DESCRIBE Patients;

-- 3: ALTER – Modify Column - modify the column PatientName from VARCHAR(100) to VARCHAR(150)
ALTER TABLE Patients MODIFY COLUMN PatientName VARCHAR(150);
DESCRIBE Patients;

-- 4: RENAME Table - rename the table as Patient_Info
ALTER TABLE Patients RENAME TO Patient_Info;
SHOW TABLES;
DESCRIBE Patient_Info;
-- Insert command
INSERT INTO Patient_Info (PatientID, PatientName, Age, Gender, AdmissionDate, DoctorAssigned)
VALUES (1, 'Ravi Kumar', 45, 'Male', '2026-03-01', 'Dr. Meena');

INSERT INTO Patient_Info (PatientID, PatientName, Age, Gender, AdmissionDate, DoctorAssigned)
VALUES (2, 'Anitha Raj', 32, 'Female', '2026-03-02', 'Dr. Arjun');

INSERT INTO Patient_Info (PatientID, PatientName, Age, Gender, AdmissionDate, DoctorAssigned)
VALUES (3, 'Suresh Babu', 60, 'Male', '2026-03-03', 'Dr. Priya');

INSERT INTO Patient_Info (PatientID, PatientName, Age, Gender, AdmissionDate, DoctorAssigned)
VALUES (4, 'Lakshmi Devi', 28, 'Female', '2026-03-04', 'Dr. Karthik');

INSERT INTO Patient_Info (PatientID, PatientName, Age, Gender, AdmissionDate, DoctorAssigned)
VALUES (5, 'Manoj Varma', 39, 'Male', '2026-03-05', 'Dr. Meena');

INSERT INTO Patient_Info (PatientID, PatientName, Age, Gender, AdmissionDate, DoctorAssigned)
VALUES (6, 'Deepa Nair', 50, 'Female', '2026-03-06', 'Dr. Arjun');

INSERT INTO Patient_Info (PatientID, PatientName, Age, Gender, AdmissionDate, DoctorAssigned)
VALUES (7, 'Kiran Kumar', 22, 'Male', '2026-03-07', 'Dr. Priya');

INSERT INTO Patient_Info (PatientID, PatientName, Age, Gender, AdmissionDate, DoctorAssigned)
VALUES (8, 'Shalini R', 35, 'Female', '2026-03-08', 'Dr. Karthik');

INSERT INTO Patient_Info (PatientID, PatientName, Age, Gender, AdmissionDate, DoctorAssigned)
VALUES (9, 'Vignesh S', 41, 'Male', '2026-03-09', 'Dr. Meena');

INSERT INTO Patient_Info (PatientID, PatientName, Age, Gender, AdmissionDate, DoctorAssigned)
VALUES (10, 'Priya Mohan', 27, 'Female', '2026-03-10', 'Dr. Arjun');

INSERT INTO Patient_Info (PatientID, PatientName, Age, Gender, AdmissionDate, DoctorAssigned)
VALUES (11, 'Aravind R', 55, 'Male', '2026-03-11', 'Dr. Priya');

INSERT INTO Patient_Info (PatientID, PatientName, Age, Gender, AdmissionDate, DoctorAssigned)
VALUES (12, 'Divya S', 30, 'Female', '2026-03-12', 'Dr. Karthik');

INSERT INTO Patient_Info (PatientID, PatientName, Age, Gender, AdmissionDate, DoctorAssigned)
VALUES (13, 'Naveen Kumar', 48, 'Male', '2026-03-13', 'Dr. Meena');

INSERT INTO Patient_Info (PatientID, PatientName, Age, Gender, AdmissionDate, DoctorAssigned)
VALUES (14, 'Gayathri R', 36, 'Female', '2026-03-14', 'Dr. Arjun');

INSERT INTO Patient_Info (PatientID, PatientName, Age, Gender, AdmissionDate, DoctorAssigned)
VALUES (15, 'Rahul S', 29, 'Male', '2026-03-15', 'Dr. Priya');

-- 5: TRUNCATE vs DROP - 
SELECT * FROM Patient_Info;
TRUNCATE TABLE Patient_Info;
SELECT * FROM Patient_Info;
SHOW TABLES;
DESCRIBE Patient_Info;
DROP TABLE Patient_Info;



