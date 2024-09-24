                --PART-A
    --Create below tables as per following data
--STU_INFO                    RESULT                           EMPLOYEE_MASTER
--Rno(PK) Name Branch       Rno(FK) SPI                      EmployeeNo Name ManagerNo
--   101 Raju CE                101 8.8                          E01 Tarun NULL
--   102 Amit CE                102 9.2                          E02 Rohan E02
--   103 Sanjay ME              103 7.6                          E03 Priya E01
--   104 Neha EC                104 8.2                          E04 Milan E03
--   105 Meera EE               105 7.0                          E05 Jay E01
--   106 Mahesh ME              107 8.9                          E06 Anjana E04

CREATE TABLE STU_INFO(
       RNO_PK INT,
	   NAME   VARCHAR(25),
	   BRANCH VARCHAR(25)
	   );

	   INSERT INTO STU_INFO VALUES(101,'Raju', 'CE')
	   INSERT INTO STU_INFO(RNO_PK,NAME,BRANCH)VALUES(102,'AMIT', 'CE')
	   INSERT INTO STU_INFO(NAME,BRANCH,RNO_PK)VALUES('SANJAY','ME',103)
	   INSERT INTO STU_INFO VALUES(104,'NEHA', 'EC'),
	                              (105,'MEERA','EE'),
								  (106,'MAHESH','ME')

SELECT * FROM STU_INFO


CREATE TABLE RESULT(
       RNO_PK INT,
	    SPI   DECIMAL(3,2)
	   );

	   INSERT INTO RESULT VALUES(101,8.8)
	   INSERT INTO RESULT(RNO_PK,SPI)VALUES(102,9.2)
	   INSERT INTO RESULT(SPI,RNO_PK)VALUES(7.6,103)
	   INSERT INTO RESULT VALUES(104,8.2),
	                              (105,7.0),
								  (107,8.9)

SELECT * FROM RESULT


CREATE TABLE EMPLOYEE_MASTER(
      EmployeeNo VARCHAR(25),
	   NAME   VARCHAR(25),
	   ManagerNo VARCHAR(25)
	   );

	   INSERT INTO EMPLOYEE_MASTER VALUES('E01','TARUN')
	   INSERT INTO EMPLOYEE_MASTER(EmployeeNo,NAME,ManagerNo)VALUES('E02','ROHAN', 'E02')
	   INSERT INTO EMPLOYEE_MASTER(NAME,EmployeeNo,ManagerNo)VALUES('E03' ,'Priya' ,'E01')
	   INSERT INTO EMPLOYEE_MASTER VALUES('E04','Milan','E03'),
										  ('E05','Jay','E01'),
										  ('E06','Anjana','E04')

SELECT * FROM EMPLOYEE_MASTER
--Part – A:
--1. Combine information from student and result table using cross join or Cartesian product.
 
 SELECT STU_INFO.RNO_PK,STU_INFO.NAME,STU_INFO.BRANCH,RESULT.SPI
 FROM STU_INFO JOIN RESULT
 ON STU_INFO.RNO_PK=RESULT.RNO_PK

--2. Perform inner join on Student and Result tables.

 SELECT STU_INFO.RNO_PK,STU_INFO.NAME,STU_INFO.BRANCH,RESULT.SPI
 FROM STU_INFO INNER JOIN RESULT
 ON STU_INFO.RNO_PK=RESULT.RNO_PK

--3. Perform the left outer join on Student and Result tables.

 SELECT STU_INFO.RNO_PK,STU_INFO.NAME,STU_INFO.BRANCH,RESULT.SPI
 FROM STU_INFO LEFT OUTER JOIN RESULT
 ON STU_INFO.RNO_PK=RESULT.RNO_PK 

--4. Perform the right outer join on Student and Result tables.

 SELECT STU_INFO.RNO_PK,STU_INFO.NAME,STU_INFO.BRANCH,RESULT.SPI
 FROM STU_INFO RIGHT OUTER JOIN RESULT
 ON STU_INFO.RNO_PK=RESULT.RNO_PK 

--5. Perform the full outer join on Student and Result tables.

 SELECT STU_INFO.RNO_PK,STU_INFO.NAME,STU_INFO.BRANCH,RESULT.SPI
 FROM STU_INFO FULL OUTER JOIN RESULT
 ON STU_INFO.RNO_PK=RESULT.RNO_PK 

--6. Display Rno, Name, Branch and SPI of all students.

 SELECT STU_INFO.RNO_PK,STU_INFO.NAME,STU_INFO.BRANCH,RESULT.SPI
 FROM STU_INFO JOIN RESULT
 ON STU_INFO.RNO_PK=RESULT.RNO_PK

--7. Display Rno, Name, Branch and SPI of CE branch’s student only.

 SELECT STU_INFO.RNO_PK,STU_INFO.NAME,STU_INFO.BRANCH,RESULT.SPI
 FROM STU_INFO JOIN RESULT
 ON STU_INFO.RNO_PK=RESULT.RNO_PK
 WHERE STU_INFO.BRANCH='CE'

--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only.

 SELECT STU_INFO.RNO_PK,STU_INFO.NAME,STU_INFO.BRANCH,RESULT.SPI
 FROM STU_INFO JOIN RESULT
 ON STU_INFO.RNO_PK=RESULT.RNO_PK
 WHERE STU_INFO.BRANCH='EC'

--9. Display average result of each branch.

 SELECT STU_INFO.BRANCH,AVG(RESULT.SPI) AS RESULT
 FROM STU_INFO JOIN RESULT
 ON STU_INFO.RNO_PK=RESULT.RNO_PK
 GROUP BY STU_INFO.BRANCH

--10. Display average result of CE and ME branch.

 SELECT STU_INFO.BRANCH,AVG(RESULT.SPI) AS RESULT
 FROM STU_INFO JOIN RESULT
 ON STU_INFO.RNO_PK=RESULT.RNO_PK
 GROUP BY STU_INFO.BRANCH
 HAVING STU_INFO.BRANCH='CE' AND STU_INFO.BRANCH='ME'

         --Part – B:
--1. Display average result of each branch and sort them in ascending order by SPI.

 SELECT STU_INFO.BRANCH,AVG(RESULT.SPI) AS RESULT
 FROM STU_INFO JOIN RESULT
 ON STU_INFO.RNO_PK=RESULT.RNO_PK
 GROUP BY STU_INFO.BRANCH
 ORDER BY RESULT ASC


--2. Display highest SPI from each branch and sort them in descending order.
 SELECT STU_INFO.BRANCH,MAX(RESULT.SPI) AS HIGHEST_RESULT
 FROM STU_INFO JOIN RESULT
 ON STU_INFO.RNO_PK=RESULT.RNO_PK
 GROUP BY STU_INFO.BRANCH
 ORDER BY HIGHEST_RESULT DESC

              --Part – C:
--1. Retrieve the names of employee along with their manager’s name from the Employee table
  SELECT EMPLOYEE_MASTER.NAME AS EMPLOYEE ,EMPLOYEE_MASTER.NAME AS MANAGER 
  FROM EMPLOYEE_MASTER 
  WHERE  EMPLOYEE_MASTER.EmployeeNo=EMPLOYEE_MASTER.ManagerNo
