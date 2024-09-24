--STUDENT_DATA
--no Name City DID
--101 Raju Rajkot 10
--102 Amit Ahmedabad 20
--103 Sanjay Baroda 40
--104 Neha Rajkot 20
--105 Meera Ahmedabad 30
--106 Mahesh Baroda 10
CREATE TABLE STUDENT_DATA(
     NO INT,
	 NAME VARCHAR(25),
	 CITY VARCHAR(25),
	 DID  INT
	 );

	 INSERT INTO STUDENT_DATA VALUES(101 ,'Raju','Rajkot', 10),
	                                (102 ,'Amit','Ahmedabad', 20),
									(103,'Sanjay','Baroda', 40),
									(104,'Neha','Rajkot',20),
									(105,'Meera','Ahmedabad',30),
									(106,'Mahesh','Baroda', 10) 

   SELECT * FROM STUDENT_DATA

--   ACADEMIC
--Rno SPI Bklog
--101 8.8 0
--102 9.2 2
--103 7.6 1
--104 8.2 4
--105 7.0 2
--106 8.9 3
CREATE TABLE ACADEMIC(
       RNO INT,
	   SPI DECIMAL(3,2),
	   BKLOG INT
	   )
--HERE WE SAW THAT WE CREATE TABLE WITH USING SEMICOLLON OR WITHOUT USING SEMICOLLON
INSERT INTO ACADEMIC VALUES(101,8.8,0),
                           (102,9.2,2),
						   (103,7.6,1),
						   (104,8.2,4),
						   (105,7.0,2),
						   (106,8.9,3)
   
   SELECT * FROM ACADEMIC

--   DEPARTMENT
--DID DName
--10 Computer
--20 Electrical
--30 Mechanical
--40 Civil
CREATE TABLE DEPARTMENT(
         DID INT,
		 DNAME VARCHAR(25)
		 )

INSERT INTO DEPARTMENT VALUES(10,'Computer'),
                             (20,'Electrical'),
							 (30,'Mechanical'),
							 (40,'Civil')

SELECT * FROM DEPARTMENT

--Part – A:
--1. Display details of students who are from computer department.
     SELECT * FROM STUDENT_DATA
	 WHERE  DID=(SELECT DID
	             FROM DEPARTMENT
	             WHERE DNAME='Computer')
--2. Displays name of students whose SPI is more than 8.
     SELECT NAME FROM STUDENT_DATA
	 WHERE  NO=(SELECT RNO
	             FROM ACADEMIC
	             WHERE SPI>8)
--3. Display details of students of computer department who belongs to Rajkot city.
     SELECT * FROM STUDENT_DATA
	 WHERE CITY='RAJKOT'AND DID=(SELECT DID
	            FROM DEPARTMENT
				WHERE DNAME='Computer')
--4. Find total number of students of electrical department.
    SELECT COUNT(DID) AS TOTAL
	FROM STUDENT_DATA
	WHERE DID=(SELECT DID
	           FROM DEPARTMENT
			   WHERE DNAME='ELECTRICAL')

	
--5. Display name of student who is having maximum SPI.
    SELECT NAME
	FROM STUDENT_DATA
	WHERE NO=(SELECT RNO
	           FROM ACADEMIC
			   WHERE SPI=(SELECT MAX(SPI)
			   FROM ACADEMIC))
--6. Display details of students having more than 1 backlog.
   SELECT * FROM STUDENT_DATA
   WHERE NO=(SELECT RNO
             FROM ACADEMIC
			 WHERE BKLOG>1)
--Part – B:
--1. Display name of students who are either from computer department or from mechanical department.
    SELECT NAME FROM STUDENT_DATA
	WHERE DID in (SELECT DID
	           FROM DEPARTMENT
			   WHERE DNAME IN('Computer','Mechanical'))
  select * from department
 
--2. Display name of students who are in same department as 102 studying in.
    SELECT NAME FROM STUDENT_DATA
	WHERE DID=(SELECT DID
	           FROM DEPARTMENT
			   WHERE DID=(SELECT DID
			              FROM STUDENT_DATA
						  WHERE NO=102))
--Part – C:
--1. Display name of students whose SPI is more than 9 and who is from electrical department.
     SELECT NAME 
	 FROM STUDENT_DATA
	 WHERE NO=(SELECT RNO
	           FROM ACADEMIC
			   WHERE SPI>9) AND DID=( SELECT DID
			                          FROM DEPARTMENT
									  WHERE DNAME='ELECTRICAL')
--2. Display name of student who is having second highest SPI.
        SELECT NAME,DID
		FROM STUDENT_DATA
		WHERE NO=(SELECT RNO
				   FROM ACADEMIC
				   WHERE SPI=(SELECT MAX(SPI)
				   FROM ACADEMIC
				   ))
      GROUP BY DID
	--3. Display city names whose students branch wise SPI is 9.2	    SELECT CITY		FROM STUDENT_DATA		WHERE NO=(SELECT RNO		          FROM ACADEMIC				  WHERE SPI=9.2)
--SET Operators
--Part – A:
--Create below two tables as per following data.
--COMPUTER ELECTRICAL
--RollNo Name RollNo Name
--101 Ajay 105 Ajay
--109 Haresh 107 Mahesh
--115 Manish 115 Manish
CREATE TABLE COMPUTER(
         ROLLNO INT,
		 NAME   VARCHAR(25)
		 )


INSERT INTO COMPUTER VALUES(101,'AJAY')
INSERT INTO COMPUTER VALUES(102,'HARESH')
INSERT INTO COMPUTER VALUES(103,'MANISH')

SELECT * FROM COMPUTER

CREATE TABLE ELECTRICAL(
         ROLLNO INT,
		 NAME   VARCHAR(25)
		 )

INSERT INTO ELECTRICAL VALUES(101,'AJAY')
INSERT INTO ELECTRICAL VALUES(102,'MAHESH')
INSERT INTO ELECTRICAL  VALUES(103,'MANISH')


SELECT * FROM ELECTRICAL

--1. Display name of students who is either in Computer or in Electrical.
     SELECT NAME FROM COMPUTER UNION SELECT NAME FROM ELECTRICAL
--2. Display name of students who is either in Computer or in Electrical including duplicate data.
    SELECT NAME FROM COMPUTER UNION ALL SELECT NAME FROM ELECTRICAL
--3. Display name of students who is in both Computer and Electrical.
   SELECT NAME FROM COMPUTER INTERSECT SELECT NAME FROM ELECTRICAL
--4. Display name of students who are in Computer but not in Electrical.
   SELECT NAME FROM COMPUTER MINUS SELECT NAME FROM ELECTRICAL
--5. Display name of students who are in Electrical but not in Computer.
   SELECT NAME FROM ELECTRICAL UNION ALL SELECT NAME FROM COMPUTER
--6. Display all the details of students who are either in Computer or in Electrical.
   SELECT * FROM COMPUTER UNION SELECT * FROM ELECTRICAL
--7. Display all the details of students who are in both Computer and Electrical.    SELECT * FROM COMPUTER INTERSECT SELECT * FROM ELECTRICAL
--Part – B:
--Create below two tables as per following data.
--EMP_DATA CUSTOMER
--EID Name CID Name
--1 Ajay 5 Ajay
--9 Haresh 7 Mahesh
--5 Manish 5 Manish
CREATE TABLE EMP_DATA(
      EID INT,
	  NAME VARCHAR(25)
	  )
INSERT INTO EMP_DATA  VALUES(1,'AJAY'),
                            (9,'HARESH'),
							(5,'MANISH')
SELECT * FROM EMP_DATA

DROP TABLE EMP_DATA

CREATE TABLE CUSTOMER_DATA(
      CID INT,
	  NAME VARCHAR(25)
	  )

INSERT INTO CUSTOMER_DATA  VALUES(5,'AJAY'),
                            (7,'MAHESH'),
							(5,'MANISH')

SELECT * FROM CUSTOMER_DATA
                 
--1. Display name of persons who is either Employee or Customer.
      SELECT NAME FROM EMP_DATA UNION  SELECT NAME FROM CUSTOMER_DATA
--2. Display name of persons who is either Employee or Customer including duplicate data.
      SELECT NAME FROM EMP_DATA UNION ALL  SELECT NAME FROM CUSTOMER_DATA
--3. Display name of persons who is both Employee as well as Customer.
     SELECT NAME FROM EMP_DATA INTERSECT  SELECT NAME FROM CUSTOMER_DATA
--4. Display name of persons who are Employee but not Customer.
     SELECT NAME FROM EMP_DATA except SELECT NAME FROM CUSTOMER_DATA
--5. Display name of persons who are Customer but not Employee
     SELECT NAME FROM CUSTOMER_DATA except SELECT NAME FROM EMP_DATA

--	Part – C:
--1. Perform all the queries of Part-B but display ID and Name columns instead of Name only		
 --1. Display name of persons who is either Employee or Customer.
      SELECT * FROM EMP_DATA UNION  SELECT * FROM CUSTOMER_DATA
--2. Display name of persons who is either Employee or Customer including duplicate data.
      SELECT * FROM EMP_DATA UNION ALL  SELECT * FROM CUSTOMER_DATA
--3. Display name of persons who is both Employee as well as Customer.
     SELECT * FROM EMP_DATA INTERSECT  SELECT * FROM CUSTOMER_DATA
--4. Display name of persons who are Employee but not Customer.
     SELECT * FROM EMP_DATA except SELECT * FROM CUSTOMER_DATA
--5. Display name of persons who are Customer but not Employee
     SELECT * FROM CUSTOMER_DATA except SELECT * FROM EMP_DATA

