CREATE TABLE Dept (
   DepartmentID INT PRIMARY KEY,
   DepartmentName VARCHAR(100) NOT NULL UNIQUE,
   DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
   Location VARCHAR(50) NOT NULL
);

CREATE TABLE Person (
   PersonID INT PRIMARY KEY,
   PersonName VARCHAR(100) NOT NULL,
   DepartmentID INT NULL,
   Salary DECIMAL(8, 2) NOT NULL,
   JoiningDate DATETIME NOT NULL,
   City VARCHAR(100) NOT NULL,
   FOREIGN KEY (DepartmentID) REFERENCES Dept(DepartmentID)
);

INSERT INTO Dept (DepartmentID, DepartmentName, DepartmentCode, Location) VALUES
(1, 'Admin', 'Adm', 'A-Block'),
(2, 'Computer', 'CE', 'C-Block'),
(3, 'Civil', 'CI', 'G-Block'),
(4, 'Electrical', 'EE', 'E-Block'),
(5, 'Mechanical', 'ME', 'B-Block');

INSERT INTO Person (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES
(101, 'Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot'),
(102, 'Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad'),
(103, 'Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda'),
(104, 'Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot'),
(105, 'Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar'),
(106, 'Priya Menpara', NULL, 9000, '2000-10-18', 'Ahmedabad'),
(107, 'Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot'),
(108, 'Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot'),
(109, 'Mehul Bhundiya', 4, 13500, '2005-01-09', 'Baroda'),
(110, 'Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar');

-- Queries
--Part-A
-- 1. Find all persons with their department name & code
SELECT person.PersonName, dept.DepartmentName, dept.DepartmentCode
FROM Person
JOIN Dept ON person.DepartmentID = dept.DepartmentID;

-- 2. Find the person's name whose department is in C-Block
SELECT person.PersonName, dept.Location
FROM Person
JOIN Dept ON person.DepartmentID = dept.DepartmentID
WHERE dept.Location = 'C-Block';

-- 3. Retrieve person name, salary & department name who belongs to Jamnagar city
SELECT person.PersonName, person.Salary, dept.DepartmentName
FROM Person
JOIN Dept ON person.DepartmentID = dept.DepartmentID
WHERE person.City = 'Jamnagar';

-- 4. Retrieve person name, salary & department name who does not belong to Rajkot city
SELECT person.PersonName, person.Salary, dept.DepartmentName
FROM person
JOIN dept ON person.DepartmentID = dept.DepartmentID
WHERE person.City <> 'Rajkot';

-- 5. Retrieve person’s name of the person who joined the Civil department after 1-Aug-2001
SELECT person.PersonName, dept.DepartmentName, person.JoiningDate
FROM person
JOIN Dept ON person.DepartmentID = dept.DepartmentID
WHERE dept.DepartmentName = 'Civil' AND Person.JoiningDate > '2001-08-01';

-- 6. Find details of all persons who belong to the computer department
SELECT person.*, dept.*
FROM Person
JOIN Dept ON person.DepartmentID = dept.DepartmentID
WHERE dept.DepartmentName = 'Computer';

-- 7. Display all the person's name with the department whose joining date difference with the current date is more than 365 days
SELECT person.PersonName, dept.DepartmentName
FROM Person
JOIN Dept ON person.DepartmentID = dept.DepartmentID
WHERE DATEDIFF(day, person.joiningDate, GETDATE()) > 365;

-- 8. Find department wise person counts
SELECT dept.DepartmentName, COUNT(person.PersonID)
FROM Person
JOIN Dept ON Person.DepartmentID = dept.DepartmentID
GROUP BY dept.DepartmentName;

-- 9. Give department wise maximum & minimum salary with department name
SELECT dept.DepartmentName, MAX(person.salary) AS max_salary, MIN(person.salary) AS min_salary
FROM Person
JOIN Dept ON person.DepartmentID = dept.DepartmentID
GROUP BY dept.DepartmentName;

-- 10. Find city wise total, average, maximum and minimum salary
SELECT person.City, SUM(person.Salary) AS total_salary, AVG(person.salary) AS average_salary, MAX(person.salary) AS max_salary, MIN(person.salary) AS min_salary
FROM Person
JOIN Dept ON person.DepartmentID = dept.DepartmentID
GROUP BY person.City;

-- 11. Find the average salary of a person who belongs to Ahmedabad city
SELECT person.city, AVG(person.salary) AS average_salary
FROM Person
JOIN Dept ON person.DepartmentID = dept.DepartmentID
WHERE person.City = 'Ahmedabad'
GROUP BY person.city;

-- 12. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In single column)
SELECT CONCAT(person.PersonName, ' lives in ', person.City, ' and works in ', dept.DepartmentName, ' department') AS Result
FROM Person
JOIN Dept ON person.DepartmentID = dept.DepartmentID;

--Part-b
-- 1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In single column)
SELECT CONCAT(person.personName, ' earns ', person.Salary, ' from ', dept.DepartmentName, ' department monthly') AS Result
FROM Person
JOIN Dept ON person.DepartmentID = dept.DepartmentID;

-- 2. Find city & department wise total, average & maximum salaries
SELECT person.City, dept.DepartmentName, SUM(person.salary) AS total_salary, AVG(person.salary) AS average_salary, MAX(person.salary) AS max_salary
FROM Person
JOIN Dept ON person.DepartmentID = dept.DepartmentID
GROUP BY person.city, dept.DepartmentName;

-- 3. Find all persons who do not belong to any department
SELECT person.*, dept.*
FROM person
LEFT OUTER JOIN dept ON person.DepartmentID = dept.DepartmentID
WHERE dept.departmentName IS NULL;

-- 4. Find all departments whose total salary is exceeding 100000
SELECT dept.DepartmentName, SUM(person.salary)
FROM Person
JOIN Dept ON person.DepartmentID = dept.DepartmentID
GROUP BY dept.DepartmentName
HAVING SUM(person.salary)>100000;

--Part-C
-- 1. List all departments who have no person
SELECT dept.DepartmentName
FROM Dept
LEFT OUTER JOIN Person ON dept.DepartmentID = Person.DepartmentID
GROUP BY dept.DepartmentName
HAVING COUNT(person.PersonID) = 0;

-- 2. List out department names in which more than two persons are working
SELECT dept.DepartmentName, COUNT(person.PersonID)
FROM Person
JOIN Dept ON person.DepartmentID = dept.DepartmentID
GROUP BY dept.DepartmentName
HAVING COUNT(person.PersonID) > 2;

-- 3. Give 10% increment in Computer department employee’s salary
UPDATE Person
SET Salary = Salary + 0.1 * Salary
WHERE DepartmentID IN (SELECT DepartmentID FROM Dept WHERE DepartmentName = 'Computer');
