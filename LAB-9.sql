--Sub Queries--
CREATE TABLE Stu_Detail (
    Rno INT,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT,
);
INSERT INTO Stu_Detail (Rno, Name, City, DID) VALUES
(101, 'Raju', 'Rajkot', 10),
(102, 'Amit', 'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda', 40),
(104, 'Neha', 'Rajkot', 20),
(105, 'Meera', 'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda', 10);

CREATE TABLE Academic (
    Rno INT,
    SPI DECIMAL(3, 1),
    Bklog INT
);

INSERT INTO Academic (Rno, SPI, Bklog) VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);

CREATE TABLE Department (
    DID INT,
    DName VARCHAR(50)
);

INSERT INTO Department (DID, DName) VALUES
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical'),
(40, 'Civil');

--Part – A:
--1. Display details of students who are from computer department.
SELECT *
FROM Stu_Detail
WHERE DID = (SELECT DID FROM Department WHERE DName = 'Computer');

--2. Displays name of students whose SPI is more than 8.
SELECT Name
FROM Stu_Detail
WHERE Rno IN (SELECT Rno FROM Academic WHERE SPI > 8);

--3. Display details of students of computer department who belongs to Rajkot city.
SELECT *
FROM Stu_Detail
WHERE City = 'Rajkot' 
  AND DID = (SELECT DID FROM Department WHERE DName = 'Computer');


--4. Find total number of students of electrical department.
SELECT COUNT(*)
FROM Stu_Detail
WHERE DID = (SELECT DID FROM Department WHERE DName = 'Electrical');

--5. Display name of student who is having maximum SPI.
SELECT COUNT(*)
FROM Stu_Detail
WHERE DID = (SELECT DID FROM Department WHERE DName = 'Electrical');

--6. Display details of students having more than 1 backlog.
SELECT *
FROM Stu_Detail
WHERE Rno IN (SELECT Rno FROM Academic WHERE Bklog > 1);

--Part – B:
--1. Display name of students who are either from computer department or from mechanical department.
SELECT Name
FROM Stu_Detail
WHERE DID IN (SELECT DID FROM Department WHERE DName IN ('Computer', 'Mechanical'));

--2. Display name of students who are in same department as 102 studying in.
SELECT Name
FROM Stu_Detail
WHERE DID = (SELECT DID FROM Stu_Detail WHERE Rno = 102);

--Part – C:
--1. Display name of students whose SPI is more than 9 and who is from electrical department.
SELECT Name
FROM Stu_Detail
WHERE Rno IN (SELECT Rno FROM Academic WHERE SPI > 9)
  AND DID = (SELECT DID FROM Department WHERE DName = 'Electrical');

--2. Display name of student who is having second highest SPI.
SELECT Name
FROM Stu_Detail
WHERE Rno = (SELECT Rno FROM Academic WHERE SPI = (SELECT MAX(SPI) FROM Academic WHERE SPI < (SELECT MAX(SPI) FROM Academic)));

--3. Display city names whose students branch wise SPI is 9.2
SELECT Name
FROM Stu_Detail
WHERE Rno = (SELECT Rno FROM Academic WHERE SPI = (SELECT MAX(SPI) FROM Academic WHERE SPI < (SELECT MAX(SPI) FROM Academic)));



--SET OPERATORS
CREATE TABLE Computer (
    RollNo INT,
    Name VARCHAR(50)
);

INSERT INTO Computer (RollNo, Name) VALUES
(101, 'Ajay'),
(109, 'Haresh'),
(115, 'Manish');

CREATE TABLE Electrical (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Electrical (RollNo, Name) VALUES
(105, 'Ajay'),
(107, 'Mahesh'),
(115, 'Manish');


------------------ PART B ----------------------



CREATE TABLE Emp_DATA (
    EID INT,
    Name VARCHAR(50)
);

INSERT INTO Emp_DATA (EID, Name) VALUES
(1, 'Ajay'),
(9, 'Haresh'),
(5, 'Manish');

CREATE TABLE Customer (
    CID INT,
    Name VARCHAR(50)
);

INSERT INTO Customer (CID, Name) VALUES
(5, 'Ajay'),
(7, 'Mahesh'),
(5, 'Manish');

--PART-A
--1. Display name of students who is either in Computer or in Electrical.
SELECT Name FROM Computer
UNION
SELECT Name FROM Electrical;

--2. Display name of students who is either in Computer or in Electrical including duplicate data.
SELECT Name FROM Computer
UNION ALL
SELECT Name FROM Electrical;

--3. Display name of students who is in both Computer and Electrical.
SELECT Name FROM Computer
INTERSECT
SELECT Name FROM Electrical;

--4. Display name of students who are in Computer but not in Electrical.
SELECT Name FROM Computer
EXCEPT
SELECT Name FROM Electrical;

--5. Display name of students who are in Electrical but not in Computer.
SELECT Name FROM Electrical
EXCEPT
SELECT Name FROM Computer;

--6. Display all the details of students who are either in Computer or in Electrical.
SELECT RollNo, Name FROM Computer
UNION
SELECT RollNo, Name FROM Electrical;

--7. Display all the details of students who are in both Computer and Electrical
SELECT RollNo, Name FROM Computer
WHERE RollNo IN (SELECT RollNo FROM Electrical);


--PART-B
--1. Display name of persons who is either Employee or Customer.
SELECT Name FROM Emp_DATA
UNION
SELECT Name FROM Customer;

--2. Display name of persons who is either Employee or Customer including duplicate data.
SELECT Name FROM Emp_DATA
UNION ALL
SELECT Name FROM Customer;

--3. Display name of persons who is both Employee as well as Customer.
SELECT Name FROM Emp_DATA
INTERSECT
SELECT Name FROM Customer;

--4. Display name of persons who are Employee but not Customer.
SELECT Name FROM Emp_DATA
EXCEPT
SELECT Name FROM Customer;

--5. Display name of persons who are Customer but not Employee.
SELECT Name FROM Customer
EXCEPT
SELECT Name FROM Emp_DATA;


--Part – C: 
--1. Perform all the queries of Part-B but display ID and Name columns instead of Name only.
--1
SELECT EID AS ID, Name FROM Emp_DATA
UNION
SELECT CID AS ID, Name FROM Customer;

--2
SELECT EID AS ID, Name FROM Emp_DATA
UNION ALL
SELECT CID AS ID, Name FROM Customer;

--3
SELECT EID AS ID, Name FROM Emp_DATA
WHERE Name IN (SELECT Name FROM Customer);

--4
SELECT EID AS ID, Name FROM Emp_DATA
WHERE Name NOT IN (SELECT Name FROM Customer);

--5
SELECT CID AS ID, Name FROM Customer
WHERE Name NOT IN (SELECT Name FROM Emp_DATA);
