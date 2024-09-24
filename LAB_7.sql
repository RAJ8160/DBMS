
  --PART � A:
--CREATE TABLE AND INSET RECORDS AS PER BELOW.	
CREATE TABLE EMP1
(
	EID INT,
	ENAME VARCHAR(25),
	DEPARTMENT VARCHAR(25),
	SALARY INT,
	JOINNINGDATE DATETIME,
	CITY VARCHAR(25)
);

ALTER TABLE EMP1
ALTER COLUMN SALARY DECIMAL(8,2)
INSERT INTO EMP1 VALUES
	(101,'RAHUL','ADMIN',56000,'1990-1-1','RAJKOT'),
	(102,'HARDIK','IT',18000,'1990-9-1','AHMEDABAD'),
	(103,'BHAVIN','HR',25000,'1991-5-1','BARODA'),
	(104,'BHOOMI','ADMIN',39000,'1991-2-1','RAJKOT'),
	(105,'ROHIT','IT',17000,'1990-7-1','JAMNAGAR'),
	(106,'PRIYA','IT',9000,'1990-10-1','AHMEDABAD'),
	(107,'BHOOMI','HR',34000,'1991-12-1','RAJKOT')

TRUNCATE TABLE EMP1

SELECT * FROM EMP1

--1. DISPLAY THE HIGHEST, LOWEST, LABEL THE COLUMNS MAXIMUM, MINIMUM RESPECTIVELY.

	SELECT MAX(SALARY) AS MAXIMUM,MIN(SALARY) AS MINIMUM FROM EMP1

--2. DISPLAY TOTAL, AND AVERAGE SALARY OF ALL EMPLOYEES. LABEL THE COLUMNS TOTAL_SAL AND AVERAGE_SAL,RESPECTIVELY.
    
	SELECT SUM(SALARY) AS TOTAL_SAL
	,AVG(SALARY) AS AVERAGE_SALARY
	FROM EMP1

--3. FIND TOTAL NUMBER OF EMPLOYEES OF EMPLOYEE TABLE.

    SELECT COUNT(*) AS TOTAL_EMPLOYEE
	FROM EMP1

--4. FIND HIGHEST SALARY FROM RAJKOT CITY.

    SELECT MAX(SALARY) AS HIGHEST_SALARY FROM EMP1
	WHERE CITY='RAJKOT'

--5. GIVE MAXIMUM SALARY FROM IT DEPARTMENT.

     SELECT MAX(SALARY) AS MAX_SALARY FROM EMP1
	WHERE DEPARTMENT='IT'

--6. COUNT EMPLOYEE WHOSE JOINING DATE IS AFTER 8-FEB-91.

    SELECT COUNT(*) AS N_E
	FROM EMP
	WHERE JOININGDATE>'1991-02-8'

--7. DISPLAY AVERAGE SALARY OF ADMIN DEPARTMENT.

SELECT SUM(SALARY) AS TOTAL FROM EMP1
WHERE DEPARTMENT='HR'

--8. DISPLAY TOTAL SALARY OF HR DEPARTMENT.

   SELECT AVG(SALARY) AS ADMINSALARY FROM EMP1
   WHERE DEPARTMENT='HR'

--9. COUNT TOTAL NUMBER OF CITIES OF EMPLOYEE WITHOUT DUPLICATION.

   SELECT COUNT(DISTINCT(CITY)) FROM EMP1

--10. COUNT UNIQUE DEPARTMENTS.

  SELECT COUNT(DISTINCT(DEPARTMENT)) FROM EMP1

--11. GIVE MINIMUM SALARY OF EMPLOYEE WHO BELONGS TO AHMEDABAD.

  SELECT MIN(SALARY) FROM EMP1
  WHERE CITY='AHMEDABAD'

--12. FIND CITY WISE HIGHEST SALARY.

   SELECT CITY,MAX(SALARY) AS HEIGHESTSALARY
   FROM EMP1
   GROUP BY CITY

--13. FIND DEPARTMENT WISE LOWEST SALARY.

  SELECT DEPARTMENT,MIN(SALARY) AS LOWER FROM EMP1
  GROUP BY DEPARTMENT

--14. DISPLAY CITY WITH THE TOTAL NUMBER OF EMPLOYEES BELONGING TO EACH CITY.
 
 SELECT CITY,COUNT(*) AS TOTAL FROM EMP1
  GROUP BY CITY

--15. GIVE TOTAL SALARY OF EACH DEPARTMENT OF EMP TABLE.

 SELECT DEPARTMENT,SUM(SALARY) AS TOTAL_SALARY FROM EMP1
 GROUP BY DEPARTMENT

--16. GIVE AVERAGE SALARY OF EACH DEPARTMENT OF EMP TABLE WITHOUT DISPLAYING THE RESPECTIVE DEPARTMENT NAME.

SELECT AVG(SALARY) FROM EMP1
GROUP BY DEPARTMENT

---------------------------------------------------------------------------------------------------------------
										--PART � B:
--1. COUNT THE NUMBER OF EMPLOYEES LIVING IN RAJKOT.
  
  SELECT COUNT(*) AS EMPLOYYE
  FROM EMP1
  WHERE CITY='RAJKOT'

--2. DISPLAY THE DIFFERENCE BETWEEN THE HIGHEST AND LOWEST SALARIES. LABEL THE COLUMN DIFFERENCE.

 SELECT (MAX(SALARY)-MIN(SALARY)) AS DEFFRENCE FROM EMP1

--3. DISPLAY THE TOTAL NUMBER OF EMPLOYEES HIRED BEFORE 1ST JANUARY, 1991.

SELECT COUNT(*) AS EMPLOYEE
FROM EMP1
WHERE JOINNINGDATE<'1991-01-01'

---------------------------------------------------------------------------------------------------------------
										--PART � C:
--1. COUNT THE NUMBER OF EMPLOYEES LIVING IN RAJKOT OR BARODA.

 SELECT COUNT(*) AS EMPLOYEE FROM EMP1
 WHERE CITY='RAJKOT' OR CITY='BARODA'

--2. DISPLAY THE TOTAL NUMBER OF EMPLOYEES HIRED BEFORE 1ST JANUARY, 1991 IN IT DEPARTMENT.

SELECT COUNT(*) AS EMPLOYEE
FROM EMP1
WHERE JOINNINGDATE<'1991-1-1' AND DEPARTMENT='IT'

--3. FIND THE JOINING DATE WISE TOTAL SALARIES.

SELECT JOINNINGDATE ,SUM(SALARY) AS TOTAL_SALARY
FROM EMP1
GROUP BY JOINNINGDATE

--4. FIND THE MAXIMUM SALARY DEPARTMENT & CITY WISE IN WHICH CITY NAME STARTS WITH �R�.

SELECT DEPARTMENT,MAX(SALARY) AS SALARY,CITY FROM EMP1
WHERE CITY LIKE 'R%'
GROUP BY  DEPARTMENT,CITY