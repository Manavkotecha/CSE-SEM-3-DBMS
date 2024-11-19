-- Create the DEPOSIT table
CREATE TABLE DEPOSIT (
    ActNo INT PRIMARY KEY,
    CNAME VARCHAR(50),
    BNAME VARCHAR(50),
    AMOUNT DECIMAL(10, 2),
    ADATE DATE
);

-- Insert the data into the DEPOSIT table
INSERT INTO DEPOSIT (ActNo, CNAME, BNAME, AMOUNT, ADATE) VALUES
(101, 'ANIL', 'VRCE', 1000.00, '1995-03-01'),
(102, 'SUNIL', 'AJNI', 5000.00, '1996-01-04'),
(103, 'MEHUL', 'KAROLBAGH', 3500.00, '1995-11-17'),
(104, 'MADHURI', 'CHANDI', 1200.00, '1995-12-17'),
(105, 'PRAMOD', 'M.G. ROAD', 3000.00, '1996-03-27'),
(106, 'SANDIP', 'ANDHERI', 2000.00, '1996-03-31'),
(107, 'SHIVANI', 'VIRAR', 1000.00, '1995-09-05'),
(108, 'KRANTI', 'NEHRU PLACE', 5000.00, '1995-07-02'),
(109, 'MINU', 'POWAI', 7000.00, '1995-08-10');



--Lab-4
--PART-A
-- 1. Add two more columns City VARCHAR(20) and Pincode INT
ALTER TABLE DEPOSIT
    ADD City VARCHAR(20),
        Pincode INT;

-- 2. Change the size of CNAME column from VARCHAR(50) to VARCHAR(35)
ALTER TABLE DEPOSIT
    Alter Column CNAME VARCHAR(35)

-- 3. Change the data type from DECIMAL to INT in amount Column
ALTER TABLE DEPOSIT
    Alter column amount INT;

-- 4. Rename Column ActNo to ANO
 sp_rename 'DEPOSIT.ActNo', 'ANO';

-- 5. Delete Column City from the DEPOSIT table
ALTER TABLE DEPOSIT
    DROP COLUMN City;

-- 6. Change name of table DEPOSIT to DEPOSIT_DETAIL
 sp_rename 'DEPOSIT', 'DEPOSIT_DETAILS';

 SELECT *FROM DEPOSIT_DETAIL



 --PART-B
-- 1. Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table.
 sp_rename 'DEPOSIT_DETAIL.ADATE', 'AOPENDATE';


--2. Delete Column AOPENDATE from the DEPOSIT_DETAIL table.
ALTER TABLE DEPOSIT_DETAIL
DROP COLUMN AOPENDATE;

--3. Rename Column CNAME to CustomerName
 sp_rename 'DEPOSIT_DETAIL.CNAME', 'CustomerName';

--PART-C
CREATE TABLE STUDENT_DETAIL (
    Enrollment_No VARCHAR(20),
    Name VARCHAR(25),
    CPI DECIMAL(5,2),
    Birthdate DATETIME
);

--1. Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null).
ALTER TABLE STUDENT_DETAIL
    ADD City VARCHAR(20) NOT NULL,
        Backlog INT NULL;

--2. Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35).
ALTER TABLE STUDENT_DETAIL
    ALTER COLUMN Name VARCHAR(35);

--3. Change the data type DECIMAL to INT in CPI Column.
ALTER TABLE STUDENT_DETAIL
    ALTER COLUMN CPI INT;

--4. Rename Column Enrollment_No to ENO.
 sp_rename 'STUDENT_DETAIL.Enrollment_No', 'ENO';

--5. Delete Column City from the student_detail table.
ALTER TABLE STUDENT_DETAIL
    DROP COLUMN City;

--6. Change name of table student_detail to STUDENT_MASTER.
EXEC sp_rename 'STUDENT_DETAIL', 'STUDENT_MASTER';



