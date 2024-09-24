--Lab-1 ALL Tables
--Create following tables using Query.
Create Table DEPOSIT(
	ACTNO INT,
	CNAME VARCHAR(50),
	BNAME VARCHAR(50),
	AMOUNT DECIMAL(8,2),
	ADATE DATETIME
)

Create Table BRANCH(
	BNAME VARCHAR(50),
	CITY VARCHAR(50)
)
Create Table CUSTOMERS(
	CNAME VARCHAR(50),
	CITY VARCHAR(50)
)
Create Table BORROW(
	LOANNO INT,
	CNAME VARCHAR(50),
	BNAME VARCHAR(50),
	AMOUNT DECIMAL(8,2)
)

--Insert the data into tables using Query as shown below.
-- DEPOSIT
INSERT INTO DEPOSIT (ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES (101,'ANIL','VRCE',1000,1995-3-1)
INSERT INTO DEPOSIT (ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES (102,'SUNIL','AJNI',5000,1996-1-4)
INSERT INTO DEPOSIT (ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES (103,'MEHUL','KAROLBAGH',3500,1995-11-17)
INSERT INTO DEPOSIT (ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES (104,'MADHURI','CHANDNI',1200,1995-12-17)
INSERT INTO DEPOSIT (ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES (105,'PRAMOD','M.G.ROAD',3000,1996-3-27)
INSERT INTO DEPOSIT (ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES (106,'SANDEEP','ANDHERI',2000,1996-3-31)
INSERT INTO DEPOSIT (ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES (107,'SHIVANI','VIRAR',1000,1995-9-5)
INSERT INTO DEPOSIT (ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES (108,'KRANTI','NEHRU PALACE',5000,1995-7-2)
INSERT INTO DEPOSIT (ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES (109,'MINU','POWAI',7000,1995-8-10)
SELECT * FROM DEPOSIT;
-- BRANCH 
INSERT INTO BRANCH VALUES ('VRCE','NAGPUR') 
INSERT INTO BRANCH VALUES ('AJNI','NAGPUR') 
INSERT INTO BRANCH VALUES ('KAROLBAGH','DELHI') 
INSERT INTO BRANCH VALUES ('CHANDI','DELHI') 
INSERT INTO BRANCH VALUES ('DHARAMPETH','NAGPUR') 
INSERT INTO BRANCH VALUES ('M.G.ROAD','BANGLORE') 
INSERT INTO BRANCH VALUES ('ANDHERI','BOMBAY') 
INSERT INTO BRANCH VALUES ('VIRAR','BOMBAY') 
INSERT INTO BRANCH VALUES ('NEHRU PALACE','DELHI') 
INSERT INTO BRANCH VALUES ('POWAI','BOMBAY')
SELECT *FROM BRANCH
-- CUSTOMERS 
INSERT INTO CUSTOMERS VALUES ('ANIL','CALCUTTA')
INSERT INTO CUSTOMERS VALUES ('SUNIL','DELHI')
INSERT INTO CUSTOMERS VALUES ('MEHUL','BARODA')
INSERT INTO CUSTOMERS VALUES ('MANDAR','PATNA')
INSERT INTO CUSTOMERS VALUES ('MADHURI','NAGPUR')
INSERT INTO CUSTOMERS VALUES ('PRAMOD','NAGPUR')
INSERT INTO CUSTOMERS VALUES ('SANDIP','SURAT')
INSERT INTO CUSTOMERS VALUES ('SHIVANI','BOMBAY')
INSERT INTO CUSTOMERS VALUES ('KRANTI','BOMBAY')
INSERT INTO CUSTOMERS VALUES ('NAREN','BOMBAY')
SELECT * FROM  CUSTOMERS

-- BORROW 
INSERT INTO BORROW(LOANNO,CNAME,BNAME,AMOUNT) VALUES (201,'ANIL','VRCE',1000)
INSERT INTO BORROW(LOANNO,CNAME,BNAME,AMOUNT) VALUES (206,'MEHUL','AJNI',5000)
INSERT INTO BORROW(LOANNO,CNAME,BNAME,AMOUNT) VALUES (311,'SUNIL','DHARAMPETH',3000)
INSERT INTO BORROW(LOANNO,CNAME,BNAME,AMOUNT) VALUES (321,'MADHURI','ANDHERI',2000)
INSERT INTO BORROW(LOANNO,CNAME,BNAME,AMOUNT) VALUES (375,'PRAMOD','VIRAR',8000)
INSERT INTO BORROW(LOANNO,CNAME,BNAME,AMOUNT) VALUES (481,'KRANTI','NEHRU PALACE',3000)
SELECT * FROM BORROW

