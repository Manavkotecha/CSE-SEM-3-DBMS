--Math functions
--Part – A:
--1. Display the result of 5 multiply by 30.
SELECT 5 * 30 AS Result;
--2. Find out the absolute value of -25, 25, -50 and 50.
SELECT ABS(-25) AS AbsValue1, ABS(25) AS AbsValue2, ABS(-50) AS AbsValue3, ABS(50) AS AbsValue4;
--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
SELECT CEILING(25.2) AS CeilValue1, CEILING(25.7) AS CeilValue2, CEILING(-25.2) AS CeilValue3;
--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.
SELECT FLOOR(25.2) AS FloorValue1, FLOOR(25.7) AS FloorValue2, FLOOR(-25.2) AS FloorValue3;
--5. Find out remainder of 5 divided 2 and 5 divided by 3.
SELECT 5 % 2 AS Remainder1, 5 % 3 AS Remainder2;
--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power.
SELECT POWER(3, 2) AS Power1, POWER(4, 3) AS Power2;
--7. Find out the square root of 25, 30 and 50.
SELECT SQRT(25) AS Sqrt1, SQRT(30) AS Sqrt2, SQRT(50) AS Sqrt3;
--8. Find out the square of 5, 15, and 25.
SELECT POWER(5, 2) AS Square1, POWER(15, 2) AS Square2, POWER(25, 2) AS Square3;
--9. Find out the value of PI.
SELECT PI() AS PIValue;
--10. Find out round value of 157.732 for 2, 0 and -2 decimal points.
SELECT ROUND(157.732, 2) AS Round2, ROUND(157.732, 0) AS Round0, ROUND(157.732, -2) AS RoundNeg2;
--11. Find out exponential value of 2 and 3.
SELECT EXP(2) AS Exp2, EXP(3) AS Exp3;
--12. Find out logarithm having base e of 10 and 2.
SELECT Log(10) AS LogE10, Log(2) AS LogE2;
--13. Find out logarithm having base b having value 10 of 5 and 100.
SELECT LOG10(5) AS Log10_5, LOG10(100) AS Log10_100;
--14. Find sine, cosine and tangent of 3.1415.
SELECT SIN(3.1415) AS Sine, COS(3.1415) AS Cosine, TAN(3.1415) AS Tangent;
--15. Find sign of -25, 0 and 25.
SELECT SIGN(-25) AS Sign1, SIGN(0) AS Sign2, SIGN(25) AS Sign3;
--16. Generate random number using function.
SELECT RAND()*309 AS RandomNumber;


--Part – B:
CREATE TABLE EMP_MASTER (
    EmpNo INT,
    EmpName VARCHAR(50),
    JoiningDate DATE,
    Salary DECIMAL(10, 2),
    Commission DECIMAL(10, 2),
    City VARCHAR(50),
    DeptCode VARCHAR(10)
);

INSERT INTO EMP_MASTER (EmpNo, EmpName, JoiningDate, Salary, Commission, City, DeptCode) VALUES
(101, 'Keyur', '2002-05-01', 12000.00, 4500, 'Rajkot', '3@g'),
(102, 'Hardik', '2004-02-15', 14000.00, 2500, 'Ahmedabad', '3@'),
(103, 'Kajal', '2006-03-14', 15000.00, 3000, 'Baroda', '3-GD'),
(104, 'Bhoomi', '2005-06-23', 12500.00, 1000, 'Ahmedabad', '1A3D'),
(105, 'Harmit', '2004-02-15', 14000.00, 2000, 'Rajkot', '312A');

--1. Display the result of Salary plus Commission.
SELECT EmpNo, EmpName, Salary + Commission AS TotalCompensation FROM EMP_MASTER;
--2. Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2.
SELECT CEILING(55.2) AS SmallestInt1, CEILING(35.7) AS SmallestInt2, CEILING(-55.2) AS SmallestInt3;
--3. Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2.
SELECT FLOOR(55.2) AS LargestInt1, FLOOR(35.7) AS LargestInt2, FLOOR(-55.2) AS LargestInt3;

--4. Find out remainder of 55 divided 2 and 55 divided by 3.
SELECT 55 % 2 AS Remainder1, 55 % 3 AS Remainder2;

--5. Find out value of 23 raised to 2nd power and 14 raised 3rd power.
SELECT POWER(23, 2) AS Power1, POWER(14, 3) AS Power2;

--Part – C:
--1. Find out the square root of 36, 49 and 81.
SELECT SQRT(36) AS Sqrt1, SQRT(49) AS Sqrt2, SQRT(81) AS Sqrt3;

--2. Find out the square of 3, 9, and 12.
SELECT POWER(3, 2) AS Square1, POWER(9, 2) AS Square2, POWER(12, 2) AS Square3;

--3. Find out round value of 280.8952 for 2, 0 and -2 decimal points.
SELECT ROUND(280.8952, 2) AS Rounded2, ROUND(280.8952, 0) AS Rounded0, ROUND(280.8952, -2) AS RoundedNeg2;

--4. Find sine, cosine and tangent of 4.2014.
SELECT SIN(4.2014) AS SineValue, COS(4.2014) AS CosineValue, TAN(4.2014) AS TangentValue;
--5. Find sign of -55, 0 and 95.
SELECT SIGN(-55) AS Sign1, SIGN(0) AS Sign2, SIGN(95) AS Sign3;


--String functions
--Part – A:
--1. Find the length of following. (I) NULL (II) ‘ hello ’ (III) Blank
SELECT LEN(NULL) AS LengthOfNull,
       LEN(' hello ') AS LengthOfHello,
       LEN('') AS LengthOfBlank;

--2. Display your name in lower & upper case.
SELECT LOWER('Manav Kotecha') AS LowerCaseName,
       UPPER('Manav Kotecha') AS UpperCaseName;

--3. Display first three characters of your name.
SELECT SUBSTRING('Manav Kotecha', 1, 3) AS FirstThreeChars;

--4. Display 3rd to 10th character of your name.
SELECT SUBSTRING('Manav Kotecha', 3, 8) AS ThirdToTenthChars;

--5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE.
SELECT REPLACE('abc123efg', '123', 'XYZ') AS ConvertedString1,
       REPLACE('abcabcabc', 'c', '5') AS ConvertedString2;

--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9.
SELECT ASCII('a') AS Ascii_a,
       ASCII('A') AS Ascii_A,
       ASCII('z') AS Ascii_z,
       ASCII('Z') AS Ascii_Z,
       ASCII('0') AS Ascii_0,
       ASCII('9') AS Ascii_9;

--7. Write a query to display character based on number 97, 65,122,90,48,57.
SELECT CHAR(97) AS Char_97,
       CHAR(65) AS Char_65,
       CHAR(122) AS Char_122,
       CHAR(90) AS Char_90,
       CHAR(48) AS Char_48,
       CHAR(57) AS Char_57;

--8. Write a query to remove spaces from left of a given string ‘hello world ‘.
SELECT LTRIM('  hello world ') AS LeftTrimmedString;

--9. Write a query to remove spaces from right of a given string ‘ hello world ‘.
SELECT RTRIM(' hello world ') AS RightTrimmedString;

--10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’.
SELECT LEFT('SQL Server', 4) AS FirstFourChars,
       RIGHT('SQL Server', 5) AS LastFiveChars;

--11. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function).
SELECT CAST('1234.56' AS DECIMAL(10, 2)) AS NumberUsingCast,
       CONVERT(DECIMAL(10, 2), '1234.56') AS NumberUsingConvert;

--12. Write a query to convert a float 10.58 to integer (Use cast and convert function).
SELECT CAST(10.58 AS INT) AS IntUsingCast,
       CONVERT(INT, 10.58) AS IntUsingConvert;

--13. Put 10 space before your name using function.
SELECT SPACE(10) + 'Manav Kotecha' AS NameWithSpaces;

--14. Combine two strings using + sign as well as CONCAT ().
SELECT 'Manav' + 'Kotecha' AS CombinedUsingPlus,
       CONCAT('Manav', 'Kotecha') AS CombinedUsingConcat;

--15. Find reverse of “Darshan”.
SELECT REVERSE('Darshan') AS ReversedString;

--16. Repeat your name 3 times.
SELECT REPLICATE('Manav Kotecha', 3) AS RepeatedName;

--Part – B: Perform following queries on Student table of practical no 5.

CREATE TABLE STUDENT (
    StuID INT,
    FirstName VARCHAR(25),
    LastName VARCHAR(25),
    Website VARCHAR(50),
    City VARCHAR(25),
    Address VARCHAR(100)
);

-- Insert records into the STUDENT table
INSERT INTO STUDENT (StuID, FirstName, LastName, Website, City, Address)
VALUES
    (1011, 'Keyur', 'Patel', 'techonthenet.com', 'Rajkot', 'A-303 "Vasant Kunj", Rajkot'),
    (1022, 'Hardik', 'Shah', 'digminecraft.com', 'Ahmedabad', '"Ram Krupa", Raiya Road'),
    (1033, 'Kajal', 'Trivedi', 'bigactivities.com', 'Baroda', 'Raj bhavan plot, near garden'),
    (1044, 'Bhoomi', 'Gajera', 'checkyourmath.com', 'Ahmedabad', '"Jig’s Home"%, Narol'),
    (1055, 'Harmit', 'Mitel', '@me.darshan.com', 'Rajkot', 'B-55, [Raj] Residency'),
    (1066, 'Ashok', 'Jani', NULL, 'Baroda', 'A502, Club% House Building');


--1. Find the length of FirstName and LastName columns.
SELECT LEN(FirstName) AS LengthOfFirstName,
       LEN(LastName) AS LengthOfLastName
FROM STUDENT;

--2. Display FirstName and LastName columns in lower & upper case.
SELECT LOWER(FirstName) AS LowerCaseFirstName,
       UPPER(FirstName) AS UpperCaseFirstName,
       LOWER(LastName) AS LowerCaseLastName,
       UPPER(LastName) AS UpperCaseLastName
FROM Student;

--3. Display first three characters of FirstName column.
SELECT SUBSTRING(FirstName, 1, 3) AS FirstThreeCharsOfFirstName
FROM Student;

--4. Display 3rd to 10th character of Website column.
SELECT SUBSTRING(Website, 3, 8) AS ThirdToTenthCharsOfWebsite
FROM Student;

--5. Write a query to display first 4 & Last 5 characters of Website column.
SELECT LEFT(Website, 4) AS FirstFourCharsOfWebsite,
       RIGHT(Website, 5) AS LastFiveCharsOfWebsite
FROM Student;

--Part – C: Perform following queries on Student table of practical no 5.

--1. Put 10 space before FirstName using function.
SELECT SPACE(10) + FirstName AS FirstNameWithSpaces
FROM Student;

--2. Combine FirstName and LastName columns using + sign as well as CONCAT ().
SELECT SPACE(10) + FirstName AS FirstNameWithSpaces
FROM Student;

--3. Combine all columns using + sign as well as CONCAT ().
SELECT FirstName + ' ' + LastName + ' ' + City + ' ' + CAST(StuID AS VARCHAR) + ' ' + Website AS CombinedUsingPlus,
        CONCAT(FirstName, ' ', LastName, ' ', City, ' ', StuID, ' ', Website) AS CombinedUsingConcat
FROM Student;


--4. Find reverse of FirstName column.
SELECT REVERSE(FirstName) AS ReversedFirstName
FROM Student;

--5. Repeat FirstName column 3 times
SELECT REPLICATE(FirstName, 3) AS RepeatedFirstName
FROM Student;

--6. Give the Names which contains 5 characters.
SELECT FirstName, LastName
FROM Student
WHERE LEN(FirstName) = 5 OR LEN(LastName) = 5;

--7. Combine the result as <FirstName> Lives in <City>.
SELECT CONCAT(FirstName, ' Lives in ', City) AS CombinedResult
FROM Student;

--8. Combine the result as Student_ID of < FirstName > is <StuID> .
SELECT CONCAT('Student_ID of ', FirstName, ' is ', StuID) AS CombinedResult
FROM Student;


--Date Functions

--Part – A:

--1. Write a query to display the current date & time. Label the column Today_Date.
SELECT GETDATE() AS Today_Date;

--2. Write a query to find new date after 365 day with reference to today.
SELECT DATEADD(DAY, 365, GETDATE()) AS NewDateAfter365Days;

--3. Display the current date in a format that appears as may 5 1994 12:00AM.
SELECT CONVERT(VARCHAR(20),'MAY 5 1994 12:00AM',100) AS FormattedDate;
SELECT FORMAT(Cast('1994-05-05' as datetime),'MMM dd yyyy hh:mm tt');

--4. Display the current date in a format that appears as 03 Jan 1995.
SELECT FORMAT(GETDATE(), 'dd MMM yyyy') AS FormattedDate;

--5. Display the current date in a format that appears as Jan 04, 96.
SELECT FORMAT(GETDATE(), 'MMM dd, yy') AS FormattedDate;

--6. Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09.
SELECT DATEDIFF(MONTH, '2008-12-31', '2009-03-31') AS TotalMonths;

--7. Write a query to find out total number of years between 25-Jan-12 and 14-Sep-10.
SELECT DATEDIFF(YEAR, '2010-09-14', '2012-01-25') AS TotalYears;

--8. Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30.
SELECT DATEDIFF(HOUR, '2012-01-25 07:00:00', '2012-01-26 10:30:00') AS TotalHours;

--9. Write a query to extract Day, Month, Year from given date 12-May-16.
SELECT DAY('2016-05-12') AS Day,
       MONTH('2016-05-12') AS Month,
       YEAR('2016-05-12') AS Year;

--10. Write a query that adds 5 years to current date.
SELECT DATEADD(YEAR, 5, GETDATE()) AS DateAfter5Years;

--11. Write a query to subtract 2 months from current date.
SELECT DATEADD(MONTH, -2, GETDATE()) AS DateAfterSubtracting2Months;

--12. Extract month from current date using datename () and datepart () function.
SELECT DATENAME(MONTH, GETDATE()) AS MonthName,
       DATEPART(MONTH, GETDATE()) AS MonthNumber;

--13. Write a query to find out last date of current month.
SELECT EOMONTH(GETDATE()) AS LastDateOfCurrentMonth;

--14. Calculate your age in years and months.SELECT DATEDIFF(YEAR, '2005-10-27', GETDATE()) AS AgeInYears,
       DATEDIFF(MONTH, '2005-10-27', GETDATE()) % 12 AS AgeInMonths,
	   DATEDIFF(DAY,'2005-10-27',GETDATE())%365 AS AgeInDays;
	   
--PART-B
CREATE TABLE EMP_DETAIL (
    EmpNo INT,
    EmpName VARCHAR(50),
    JoiningDate DATE,
    Salary DECIMAL(10, 2),
    City VARCHAR(50)
);

INSERT INTO EMP_DETAIL (EmpNo, EmpName, JoiningDate, Salary, City) VALUES
(101, 'Keyur', '2002-01-15', 12000.00, 'Rajkot'),
(102, 'Hardik', '2004-02-15', 14000.00, 'Ahmedabad'),
(103, 'Kajal', '2006-03-14', 15000.00, 'Baroda'),
(104, 'Bhoomi', '2005-06-23', 12500.00, 'Ahmedabad'),
(105, 'Harmit', '2004-02-15', 14000.00, 'Rajkot'),
(106, 'Jay', '2007-03-12', 12000.00, 'Surat');

--1. Write a query to find new date after 365 day with reference to JoiningDate.
SELECT EmpNo, EmpName, JoiningDate, 
       DATE_ADD(JoiningDate, INTERVAL 365 DAY) AS NewDateAfter365Days
FROM EMP_DETAIL;

--2. Display the JoiningDate in a format that appears as may 5 1994 12:00AM.
SELECT EmpNo, EmpName, 
       DATE_FORMAT(JoiningDate, '%b %d %Y %r') AS FormattedJoiningDate
FROM EMP_DETAIL;

--3. Display the JoiningDate in a format that appears as 03 Jan 1995.
SELECT EmpNo, EmpName, 
       DATE_FORMAT(JoiningDate, '%d %b %Y') AS FormattedJoiningDate
FROM EMP_DETAIL;

--4. Display the JoiningDate in a format that appears as Jan 04, 96.
SELECT EmpNo, EmpName, 
       DATE_FORMAT(JoiningDate, '%b %d, %y') AS FormattedJoiningDate
FROM EMP_DETAIL;

--5. Write a query to find out total number of months between JoiningDate and 31-Mar-09.
SELECT EmpNo, EmpName, 
       DATE_FORMAT(JoiningDate, '%b %d, %y') AS FormattedJoiningDate
FROM EMP_DETAIL;

--6.Write a query to find out total number of years between JoiningDate and 14-Sep-10.
SELECT EmpNo, EmpName, 
       DATE_FORMAT(JoiningDate, '%b %d, %y') AS FormattedJoiningDate
FROM EMP_DETAIL;

--Part – C:
--1. Write a query to extract Day, Month, Year from JoiningDate.
SELECT EmpNo, EmpName, JoiningDate,
       DAY(JoiningDate) AS Day,
       MONTH(JoiningDate) AS Month,
       YEAR(JoiningDate) AS Year
FROM EMP_DETAIL;

--2. Write a query that adds 5 years to JoiningDate.
SELECT EmpNo, EmpName, JoiningDate,
       DAY(JoiningDate) AS Day,
       MONTH(JoiningDate) AS Month,
       YEAR(JoiningDate) AS Year
FROM EMP_DETAIL;

--3. Write a query to subtract 2 months from JoiningDate.
SELECT EmpNo, EmpName, JoiningDate,
       DATE_SUB(JoiningDate, INTERVAL 2 MONTH) AS DateAfterSubtracting2Months
FROM EMP_DETAIL;

--4. Extract month from JoiningDate using datename () and datepart () function.
SELECT EmpNo, EmpName, JoiningDate,
       DATENAME(MONTH, JoiningDate) AS MonthName,
       DATEPART(MONTH, JoiningDate) AS MonthNumber
FROM EMP_DETAIL;

--5. Calculate your age in years and months
SELECT EmpNo, EmpName, JoiningDate,
       DATEDIFF(YEAR, 'YYYY-MM-DD', GETDATE()) AS AgeInYears,
       DATEDIFF(MONTH, 'YYYY-MM-DD', GETDATE()) % 12 AS AgeInMonths
FROM EMP_DETAIL;
