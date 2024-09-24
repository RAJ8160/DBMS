--1. Add two more columns City VARCHAR (20) and Pincode INT.
  ALTER TABLE DEPOSIT
  ADD CITY VARCHAR(20),PINCODE INT

--2. Change the size of CNAME column from VARCHAR (50) to VARCHAR (35)
ALTER TABLE DEPOSIT 
ALTER COLUMN CNAME VARCHAR(35)

--3. Change the data type DECIMAL to INT in amount Column.
ALTER TABLE DEPOSIT
ALTER COLUMN AMOUNT INT

--4. Rename Column ActNo to ANO.
SP_RENAME 'DEPOSIT.ACTNO','ANO'

SELECT * FROM DEPOSIT

--5. Delete Column City from the DEPOSIT table.
ALTER TABLE DEPOSIT
DROP COLUMN CITY

--6. Change name of table DEPOSIT to DEPOSIT_DETAIL.
SP_RENAME 'DEPOSIT-DETAIL','DEPOSIT_DETAIL'

---------------------------------------------------------------------------------------------------------------------------------------------
--PART-B

--1. Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table.
SP_RENAME 'DEPOSIT_DETAIL.ADATE','AOPENDATE'

--2. Delete Column AOPENDATE from the DEPOSIT_DETAIL table.
ALTER TABLE DEPOSIT_DETAIL
DROP COLUMN AOPENDATE

--3. Rename Column CNAME to CustomerName
SP_RENAME 'DEPOSIT_DETAIL.CNAME','CustomerName'

-----------------------------------------------------------------------------------------------------------------------------------------------

--PART-C
CREATE TABLE STUDENT_DETAIL(
    Enrollment_No VARCHAR(20),
	Name VARCHAR(25),
	CPI DECIMAL(5,2),
	Birthdate DATETIME);


--1. Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null).
ALTER TABLE STUDENT_DETAIL
ADD CITY VARCHAR(20) NOT NULL DEFAULT 'RAJCOT',BACKLOG INT NOT NULL IDENTITY(1,1)

SELECT * FROM STUDENT_DETAIL

--2. Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35).
ALTER TABLE STUDENT_DETAIL
ALTER COLUMN NAME VARCHAR(35)

--3. Change the data type DECIMAL to INT in CPI Column.
ALTER TABLE STUDENT_DETAIL
ALTER  COLUMN CPI INT

--4. Rename Column Enrollment_No to ENO.
SP_RENAME 'STUDENT_DETAIL.Enrollment_no','ENO'

--5. Delete Column City from the student_detail table.
ALTER TABLE STUDENT_DETAIL
DROP COLUMN CITY

--6. Change name of table student_detail to STUDENT_MASTER
SP_RENAME 'STUDENT_DETAIL','STUDENT_MASTER'

-----------------------------------------------------------------------------------------------------------------------------------

--DELETE, Truncate, Drop Operation

--PART-A

--1. Delete all the records of DEPOSIT_DETAIL table having amount greater than and equals to 4000.
DELETE FROM DEPOSIT_DETAIL
WHERE AMOUNT>=4000

--2. Delete all the accounts CHANDI BRANCH.
DELETE FROM DEPOSIT_DETAIL
WHERE BNAME='CHANDI'

--3. Delete all the accounts having account number (ANO) is greater than 105.
DELETE FROM DEPOSIT_DETAIL
WHERE ANO>105

--4. Delete all the records of Deposit_Detail table. (Use Truncate)
TRUNCATE TABLE DEPOSIT_DETAIL

--5. Remove Deposit_Detail table. (Use Drop)DROP TABLE DEPOSIT_DETAIL----------------------------------------------------------------------------------------------------------------------------------------------------PART-BCREATE TABLE EMPLOYEE_MASTER(     EmpNo INT,
	 EmpName VARCHAR(25),
	 JoiningDate DATETIME,
	 Salary DECIMAL (8,2),
	 City VARCHAR(20));

	 INSERT INTO EMPLOYEE_MASTER VALUES(101, 'Keyu', '2002-1-5', 12000.00,'Rajkot')
	 INSERT INTO EMPLOYEE_MASTER VALUES(102, 'Hardik', '2004-2-15', 14000.00,'Ahemedabad')
	 INSERT INTO EMPLOYEE_MASTER VALUES(103, 'Kajal', '2006-3-14', 15000.00,'Baroda')
	 INSERT INTO EMPLOYEE_MASTER VALUES(104, 'Bhoomi', '2005-6-05', 12500.00,'Ahemedabad')
	 INSERT INTO EMPLOYEE_MASTER VALUES(105, 'Harmit', '2004-2-15', 14000.00,'Rajkot')
	 INSERT INTO EMPLOYEE_MASTER VALUES(106, 'Mitesh', '2001-9-25', 5000.00,'jamnagar')
	 INSERT INTO EMPLOYEE_MASTER VALUES(107, 'Merra', null, 7000.00,'Morbi')
	 INSERT INTO EMPLOYEE_MASTER VALUES(108, 'Kishan', '2003-2-6', 10000.00,null)


--1. Delete all the records of Employee_MASTER table having salary greater than and equals to 14000.
DELETE FROM EMPLOYEE_MASTER
WHERE Salary>14000

select *from EMPLOYEE_MASTER


--2. Delete all the Employees who belongs to ‘RAJKOT’ city.
DELETE FROM EMPLOYEE_MASTER
WHERE City='Rajkot'

select *from EMPLOYEE_MASTER
--3. Delete all the Employees who joined after 1-1-2007.
DELETE FROM EMPLOYEE_MASTER
WHERE JoiningDate='2001-1-1'

select *from EMPLOYEE_MASTER
--4. Delete the records of Employees whose joining date is null and Name is not null.
DELETE FROM EMPLOYEE_MASTER
WHERE JoiningDate=null and EmpName is  not null

select *from EMPLOYEE_MASTER
--5. Delete the records of Employees whose salary is 50% of 20000.
DELETE FROM EMPLOYEE_MASTER
WHERE Salary=20000*0.5

select *from EMPLOYEE_MASTER
--6. Delete the records of Employees whose City Name is not empty.
DELETE FROM EMPLOYEE_MASTER
WHERE City is not null

select *from EMPLOYEE_MASTER
--7. Delete all the records of Employee_MASTER table. (
TRUNCATE TABLE EMPLOYEE_MASTER

select *from EMPLOYEE_MASTER
--8. Remove Employee_MASTER table. (Use Drop)
DROP TABLE EMPLOYEE_MASTER