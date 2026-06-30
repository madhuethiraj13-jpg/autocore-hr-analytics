-- ================================================
-- AutoCore Motors HR Analytics Project
-- Tool: MySQL 8.0

-- ================================================
-- STEP 1: Create and select the database
-- ================================================
CREATE DATABASE autocore_hr;
USE autocore_hr;

-- ================================================
-- STEP 2: Department Table
-- ================================================
CREATE TABLE Department (
    DepartmentID   INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL,
    ManagerID      INT,
    Location       VARCHAR(100),
    CreatedAt      DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Department (DepartmentName, Location) VALUES
('Engine Assembly',       'Plant A - Pune'),
('Quality Control',       'Plant A - Pune'),
('Human Resources',       'Head Office - Mumbai'),
('Finance & Payroll',     'Head Office - Mumbai'),
('Procurement',           'Plant B - Chennai'),
('Research & Development','Tech Centre - Bangalore'),
('Logistics',             'Plant B - Chennai'),
('IT & Systems',          'Head Office - Mumbai');

-- ================================================
-- STEP 3: Employee Table
-- ================================================
CREATE TABLE Employee (
    EmployeeID       INT PRIMARY KEY AUTO_INCREMENT,
    FirstName        VARCHAR(50)  NOT NULL,
    LastName         VARCHAR(50)  NOT NULL,
    Gender           ENUM('Male','Female','Other') NOT NULL,
    DateOfBirth      DATE         NOT NULL,
    PhoneNumber      VARCHAR(15),
    Email            VARCHAR(100) UNIQUE NOT NULL,
    DepartmentID     INT          NOT NULL,
    JobTitle         VARCHAR(100) NOT NULL,
    EmploymentType   ENUM('Full-Time','Part-Time','Contract') DEFAULT 'Full-Time',
    DateOfJoining    DATE         NOT NULL,
    EmploymentStatus ENUM('Active','Resigned','Terminated','Retired') DEFAULT 'Active',
    ManagerID        INT,
    Salary           DECIMAL(10,2) NOT NULL,
    CreatedAt        DATETIME     DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (ManagerID)    REFERENCES Employee(EmployeeID)
);

INSERT INTO Employee (FirstName, LastName, Gender, DateOfBirth, PhoneNumber, Email, DepartmentID, JobTitle, EmploymentType, DateOfJoining, EmploymentStatus, ManagerID, Salary) VALUES
('Rajesh',  'Sharma',   'Male',   '1980-03-15', '9876543210', 'rajesh.sharma@autocore.com',  1, 'Plant Manager',         'Full-Time', '2015-01-10', 'Active', NULL, 95000.00),
('Priya',   'Mehta',    'Female', '1990-07-22', '9876543211', 'priya.mehta@autocore.com',    1, 'Assembly Supervisor',   'Full-Time', '2018-03-15', 'Active', 1,    65000.00),
('Arjun',   'Patel',    'Male',   '1992-11-08', '9876543212', 'arjun.patel@autocore.com',    1, 'Assembly Technician',   'Full-Time', '2020-06-01', 'Active', 2,    40000.00),
('Neha',    'Joshi',    'Female', '1994-05-30', '9876543213', 'neha.joshi@autocore.com',     1, 'Assembly Technician',   'Full-Time', '2021-02-14', 'Active', 2,    38000.00),
('Vikram',  'Singh',    'Male',   '1985-09-12', '9876543214', 'vikram.singh@autocore.com',   2, 'QC Manager',            'Full-Time', '2016-07-20', 'Active', NULL, 88000.00),
('Ananya',  'Reddy',    'Female', '1991-04-18', '9876543215', 'ananya.reddy@autocore.com',   2, 'QC Analyst',            'Full-Time', '2019-09-10', 'Active', 5,    52000.00),
('Suresh',  'Kumar',    'Male',   '1988-12-25', '9876543216', 'suresh.kumar@autocore.com',   2, 'QC Analyst',            'Full-Time', '2019-11-05', 'Active', 5,    50000.00),
('Divya',   'Nair',     'Female', '1995-08-14', '9876543217', 'divya.nair@autocore.com',     3, 'HR Manager',            'Full-Time', '2017-04-01', 'Active', NULL, 80000.00),
('Karan',   'Malhotra', 'Male',   '1993-02-28', '9876543218', 'karan.malhotra@autocore.com', 3, 'HR Executive',          'Full-Time', '2020-08-17', 'Active', 8,    45000.00),
('Sneha',   'Gupta',    'Female', '1996-06-10', '9876543219', 'sneha.gupta@autocore.com',    3, 'HR Executive',          'Full-Time', '2021-05-03', 'Active', 8,    43000.00),
('Amit',    'Verma',    'Male',   '1982-01-20', '9876543220', 'amit.verma@autocore.com',     4, 'Finance Manager',       'Full-Time', '2014-11-15', 'Active', NULL, 92000.00),
('Pooja',   'Iyer',     'Female', '1989-10-05', '9876543221', 'pooja.iyer@autocore.com',     4, 'Payroll Specialist',    'Full-Time', '2018-06-22', 'Active', 11,   58000.00),
('Rohit',   'Desai',    'Male',   '1991-03-17', '9876543222', 'rohit.desai@autocore.com',    4, 'Financial Analyst',     'Full-Time', '2019-01-08', 'Active', 11,   55000.00),
('Meera',   'Pillai',   'Female', '1987-07-29', '9876543223', 'meera.pillai@autocore.com',   5, 'Procurement Manager',   'Full-Time', '2016-03-14', 'Active', NULL, 82000.00),
('Sanjay',  'Rao',      'Male',   '1993-11-11', '9876543224', 'sanjay.rao@autocore.com',     5, 'Procurement Analyst',   'Full-Time', '2020-10-19', 'Active', 14,   47000.00),
('Kavya',   'Menon',    'Female', '1990-05-25', '9876543225', 'kavya.menon@autocore.com',    6, 'R&D Engineer',          'Full-Time', '2018-09-30', 'Active', NULL, 78000.00),
('Aditya',  'Chopra',   'Male',   '1994-08-07', '9876543226', 'aditya.chopra@autocore.com',  6, 'R&D Engineer',          'Full-Time', '2021-03-22', 'Active', 16,   72000.00),
('Lakshmi', 'Venkat',   'Female', '1986-12-03', '9876543227', 'lakshmi.venkat@autocore.com', 7, 'Logistics Manager',     'Full-Time', '2015-08-11', 'Active', NULL, 83000.00),
('Manoj',   'Tiwari',   'Male',   '1992-04-16', '9876543228', 'manoj.tiwari@autocore.com',   7, 'Logistics Coordinator', 'Full-Time', '2020-12-07', 'Active', 18,   44000.00),
('Ritu',    'Saxena',   'Female', '1995-09-21', '9876543229', 'ritu.saxena@autocore.com',    8, 'IT Manager',            'Full-Time', '2019-07-14', 'Active', NULL, 85000.00);

-- ================================================
-- STEP 4: Attendance Table
-- ================================================
CREATE TABLE Attendance (
    AttendanceID    INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID      INT NOT NULL,
    AttendanceDate  DATE NOT NULL,
    CheckInTime     TIME,
    CheckOutTime    TIME,
    Status          ENUM('Present','Absent','Half-Day','On Leave') NOT NULL,
    WorkHours       DECIMAL(4,2),

    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Manual attendance records for Employees 1, 2, 3 (June 1-5, 2026)
INSERT INTO Attendance (EmployeeID, AttendanceDate, CheckInTime, CheckOutTime, Status, WorkHours) VALUES
(1, '2026-06-01', '09:00:00', '18:00:00', 'Present', 8.50),
(1, '2026-06-02', '09:15:00', '18:00:00', 'Present', 8.25),
(1, '2026-06-03', NULL,       NULL,       'Absent',  0.00),
(1, '2026-06-04', '09:00:00', '13:00:00', 'Half-Day',4.00),
(1, '2026-06-05', '09:00:00', '18:00:00', 'Present', 8.50),

(2, '2026-06-01', '09:05:00', '18:10:00', 'Present', 8.58),
(2, '2026-06-02', '09:00:00', '18:00:00', 'Present', 8.50),
(2, '2026-06-03', '09:00:00', '18:00:00', 'Present', 8.50),
(2, '2026-06-04', '09:00:00', '18:00:00', 'Present', 8.50),
(2, '2026-06-05', NULL,       NULL,       'On Leave',0.00),

(3, '2026-06-01', '09:30:00', '17:30:00', 'Present', 7.50),
(3, '2026-06-02', '09:00:00', '18:00:00', 'Present', 8.50),
(3, '2026-06-03', '09:00:00', '18:00:00', 'Present', 8.50),
(3, '2026-06-04', NULL,       NULL,       'Absent',  0.00),
(3, '2026-06-05', '09:00:00', '18:00:00', 'Present', 8.50);

-- Generated attendance for remaining 17 employees, full month of June 2026
-- Uses a Recursive CTE to build a date series, then CROSS JOIN with Employees
INSERT INTO Attendance (EmployeeID, AttendanceDate, CheckInTime, CheckOutTime, Status, WorkHours)
WITH RECURSIVE DateSeries AS (
    SELECT DATE('2026-06-01') AS AttendanceDate
    UNION ALL
    SELECT AttendanceDate + INTERVAL 1 DAY
    FROM DateSeries
    WHERE AttendanceDate < '2026-06-30'
),
WorkingDays AS (
    SELECT AttendanceDate
    FROM DateSeries
    WHERE DAYOFWEEK(AttendanceDate) NOT IN (1,7)
),
AllCombinations AS (
    SELECT e.EmployeeID, w.AttendanceDate
    FROM Employee e
    CROSS JOIN WorkingDays w
    WHERE e.EmployeeID NOT IN (1,2,3)
)
SELECT
    EmployeeID,
    AttendanceDate,
    CASE WHEN MOD(EmployeeID + DAY(AttendanceDate), 17) = 0 THEN NULL
         ELSE '09:00:00' END AS CheckInTime,
    CASE WHEN MOD(EmployeeID + DAY(AttendanceDate), 17) = 0 THEN NULL
         ELSE '18:00:00' END AS CheckOutTime,
    CASE
        WHEN MOD(EmployeeID + DAY(AttendanceDate), 17) = 0 THEN 'Absent'
        WHEN MOD(EmployeeID + DAY(AttendanceDate), 13) = 0 THEN 'Half-Day'
        WHEN MOD(EmployeeID + DAY(AttendanceDate), 19) = 0 THEN 'On Leave'
        ELSE 'Present'
    END AS Status,
    CASE
        WHEN MOD(EmployeeID + DAY(AttendanceDate), 17) = 0 THEN 0.00
        WHEN MOD(EmployeeID + DAY(AttendanceDate), 13) = 0 THEN 4.00
        WHEN MOD(EmployeeID + DAY(AttendanceDate), 19) = 0 THEN 0.00
        ELSE 8.50
    END AS WorkHours
FROM AllCombinations;

-- ================================================
-- STEP 5: Payroll Table
-- ================================================
CREATE TABLE Payroll (
    PayrollID     INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID    INT NOT NULL,
    PayPeriod     DATE NOT NULL,
    BasicSalary   DECIMAL(10,2) NOT NULL,
    OvertimePay   DECIMAL(10,2) DEFAULT 0.00,
    Bonus         DECIMAL(10,2) DEFAULT 0.00,
    Deductions    DECIMAL(10,2) DEFAULT 0.00,
    NetSalary     DECIMAL(10,2) NOT NULL,
    PaymentDate   DATE,

    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Payroll calculated from actual June 2026 attendance data
-- Uses LEFT JOIN + COALESCE to ensure employees with zero absences are not excluded
INSERT INTO Payroll (EmployeeID, PayPeriod, BasicSalary, OvertimePay, Bonus, Deductions, NetSalary, PaymentDate)
SELECT
    e.EmployeeID,
    '2026-06-01' AS PayPeriod,
    e.Salary AS BasicSalary,
    500.00 AS OvertimePay,
    CASE WHEN MOD(e.EmployeeID, 5) = 0 THEN 2000.00 ELSE 0.00 END AS Bonus,
    (COALESCE(absent_summary.AbsentCount, 0) * (e.Salary / 22)) AS Deductions,
    (e.Salary + 500.00
        + CASE WHEN MOD(e.EmployeeID, 5) = 0 THEN 2000.00 ELSE 0.00 END
        - (COALESCE(absent_summary.AbsentCount, 0) * (e.Salary / 22))
    ) AS NetSalary,
    '2026-07-01' AS PaymentDate
FROM Employee e
LEFT JOIN (
    SELECT EmployeeID, COUNT(*) AS AbsentCount
    FROM Attendance
    WHERE Status = 'Absent'
    GROUP BY EmployeeID
) AS absent_summary
ON e.EmployeeID = absent_summary.EmployeeID;

-- ================================================
-- ANALYSIS QUERIES
-- ================================================

-- Query 1: Female employees in HR Department, sorted by salary
SELECT FirstName, LastName, JobTitle, Salary
FROM Employee
WHERE Gender = 'Female'
AND DepartmentID = 3
ORDER BY Salary DESC;

-- Query 2: Average salary and headcount by department
SELECT DepartmentID,
       COUNT(*)             AS TotalEmployees,
       ROUND(AVG(Salary),2) AS AverageSalary
FROM Employee
GROUP BY DepartmentID
ORDER BY AverageSalary DESC;

-- Query 3: Gender pay equity analysis
SELECT Gender,
       COUNT(*)             AS TotalEmployees,
       ROUND(AVG(Salary),2) AS AverageSalary
FROM Employee
GROUP BY Gender
ORDER BY AverageSalary DESC;

-- Query 4: Department-wise absenteeism rate (3-table JOIN)
SELECT d.DepartmentName,
       COUNT(*) AS TotalAttendanceRecords,
       SUM(CASE WHEN a.Status = 'Absent' THEN 1 ELSE 0 END) AS AbsentDays,
       ROUND(
           SUM(CASE WHEN a.Status = 'Absent' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
       ) AS AbsenteeismRate
FROM Attendance a
INNER JOIN Employee e ON a.EmployeeID = e.EmployeeID
INNER JOIN Department d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY AbsenteeismRate DESC;

-- Query 5: Average work hours by department
SELECT d.DepartmentName,
       ROUND(AVG(a.WorkHours), 2) AS AverageWorkHours
FROM Attendance a
INNER JOIN Employee e ON a.EmployeeID = e.EmployeeID
INNER JOIN Department d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY AverageWorkHours DESC;

-- Query 6: Full payroll report with employee names, sorted by net salary
SELECT e.FirstName, e.LastName, p.BasicSalary, p.Deductions, p.NetSalary
FROM Payroll p
INNER JOIN Employee e ON p.EmployeeID = e.EmployeeID
ORDER BY p.NetSalary DESC;

