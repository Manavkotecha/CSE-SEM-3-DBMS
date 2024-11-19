CREATE TABLE STU_INFO(
	RNO INT,
	NAME CHAR(20),
	BRANCH CHAR(5),
);
INSERT INTO STU_INFO VALUES
	(101,'RAJU','CE'),
	(102,'AMIT','CE'),
	(103,'SANJAY','ME'),
	(104,'NEHA','EC'),
	(105,'MEERA','EE'),
	(106,'MAHESH','ME');
CREATE TABLE RESULT(
	RNO INT,
	SPI DECIMAL(4,2),
);
INSERT INTO RESULT VALUES
	(101,8.8),
	(102,9.2),
	(103,7.6),
	(104,8.2),
	(105,7.0),
	(107,8.9);
CREATE TABLE EMPLOYEE_MASTER(
	EMPLOYEENO CHAR(4),
	NAME CHAR(20),
	MANAGERNO CHAR(4)
);
INSERT INTO EMPLOYEE_MASTER VALUES
	('E01','TARUN',NULL),
	('E02','ROHAN','E02'),
	('E03','PRIYA','E01'),
	('E04','MILAN','E03'),
	('E05','JAY','E01'),
	('E06','ANJANA','E04');

--1.Combine information from student and result table using cross join or Cartesian product.
SELECT * FROM STU_INFO CROSS JOIN RESULT;

--2.Perform inner join on Student and Result tables.
SELECT * FROM STU_INFO AS S INNER JOIN RESULT AS R ON S.RNO=R.RNO;

--3.Perform the left outer join on Student and Result tables.
SELECT * FROM STU_INFO AS S LEFT OUTER JOIN RESULT AS R ON S.RNO=R.RNO;

--4.Perform the right outer join on Student and Result tables.
SELECT * FROM STU_INFO AS S RIGHT OUTER JOIN RESULT AS R ON S.RNO=R.RNO;

--5.Perform the full outer join on Student and Result tables.
SELECT * FROM STU_INFO AS S FULL OUTER JOIN RESULT AS R ON S.RNO=R.RNO;

--6.Display Rno, Name, Branch and SPI of all students.
SELECT S.RNO,S.NAME,S.BRANCH,R.SPI FROM STU_INFO AS S INNER JOIN RESULT AS R ON S.RNO=R.RNO;

--7.Display Rno, Name, Branch and SPI of CE branch’s student only.
SELECT S.RNO,S.NAME,S.BRANCH,R.SPI FROM STU_INFO AS S INNER JOIN RESULT AS R ON S.RNO=R.RNO WHERE S.BRANCH='CE';

--8.Display Rno, Name, Branch and SPI of other than EC branch’s student only.
SELECT S.RNO,S.NAME,S.BRANCH,R.SPI FROM STU_INFO AS S INNER JOIN RESULT AS R ON S.RNO=R.RNO WHERE S.BRANCH!='EC';

--9.Display average result of each branch.
SELECT S.BRANCH,AVG(R.SPI) AS AVERAGE FROM STU_INFO AS S INNER JOIN RESULT AS R ON S.RNO=R.RNO GROUP BY S.BRANCH;

--10.Display average result of CE and ME branch.
SELECT S.BRANCH,AVG(R.SPI) AS AVERAGE FROM STU_INFO AS S INNER JOIN RESULT AS R ON S.RNO=R.RNO GROUP BY S.BRANCH HAVING S.BRANCH='CE' OR S.BRANCH='ME';

--Part-B
--1.Display average result of each branch and sort them in ascending order by SPI.
SELECT S.BRANCH,AVG(R.SPI) AS AVERAGE FROM STU_INFO AS S INNER JOIN RESULT AS R ON S.RNO=R.RNO GROUP BY S.BRANCH ORDER BY AVG(R.SPI);

--2.Display highest SPI from each branch and sort them in descending order.
SELECT S.BRANCH,MAX(R.SPI) AS MAX_SPI FROM STU_INFO AS S INNER JOIN RESULT AS R ON S.RNO=R.RNO GROUP BY S.BRANCH;

--Part-C
--1.Retrieve the names of employee along with their manager’s name from the Employee table.
SELECT EM.NAME AS EMPLOYEE_NAME,E.NAME AS MANAGER_NAME FROM EMPLOYEE_MASTER AS E JOIN EMPLOYEE_MASTER AS EM ON E.EMPLOYEENO=EM.MANAGERNO;