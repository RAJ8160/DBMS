

-------ADVANCED LEVEL JOINS------------

----------------------PART-A------------------

CREATE TABLE CITY
(
    CITYID INT PRIMARY KEY,
    NAME VARCHAR(100) UNIQUE,
    PINCODE INT NOT NULL,
    REMARKS VARCHAR(255)
);

CREATE TABLE VILLAGE
(
    VID INT PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    CITYID INT,
    FOREIGN KEY (CITYID) REFERENCES CITY(CITYID)
);

INSERT INTO CITY
    (CITYID, NAME, PINCODE, REMARKS)
VALUES
    (1, 'RAJKOT', 360005, 'GOOD'),
    (2, 'SURAT', 335009, 'VERY GOOD'),
    (3, 'BARODA', 390001, 'AWESOME'),
    (4, 'JAMNAGAR', 361003, 'SMART'),
    (5, 'JUNAGADH', 362229, 'HISTORIC'),
    (6, 'MORVI', 363641, 'CERAMIC');

INSERT INTO VILLAGE
    (VID, NAME, CITYID)
VALUES
    (101, 'RAIYA', 1),
    (102, 'MADHAPAR', 1),
    (103, 'DODKA', 3),
    (104, 'FALLA', 4),
    (105, 'BHESAN', 5),
    (106, 'DHORAJI', 5);

SELECT *
FROM CITY;
SELECT *
FROM VILLAGE;


-- 1. Display all the villages of Rajkot city. 

SELECT V.VID, V.NAME
FROM CITY C JOIN VILLAGE V ON C.CITYID = V.CITYID
WHERE C.NAME = 'RAJKOT';

-- 2. Display city along with their villages & pin code.

SELECT C.NAME, V.NAME, C.PINCODE
FROM CITY C LEFT JOIN VILLAGE V ON C.CITYID = V.CITYID;

-- 3. Display the city having more than one village.

SELECT C.NAME, COUNT(V.VID) AS VILLAGE_COUNT
FROM CITY C JOIN VILLAGE V ON C.CITYID = V.CITYID
GROUP BY C.NAME
HAVING COUNT(V.VID)>1;

-- 4. Display the city having no village.

SELECT C.NAME, COUNT(V.VID) AS VILLAGE_COUNT
FROM CITY C LEFT JOIN VILLAGE V ON C.CITYID = V.CITYID
GROUP BY C.NAME
HAVING COUNT(V.VID) = 0;

-- 5. Count the total number of villages in each city.

SELECT C.NAME, COUNT(V.VID) AS VILLAGE_COUNT
FROM CITY C LEFT JOIN VILLAGE V ON C.CITYID = V.CITYID
GROUP BY C.NAME

-- 6. Count the number of cities having more than one village.

SELECT COUNT(*)
FROM (
    SELECT V.CITYID AS VILLAGE_COUNT
    FROM CITY C JOIN VILLAGE V ON C.CITYID = V.CITYID
    GROUP BY V.CITYID
    HAVING COUNT(V.VID)>1
) AS CitiesWithMultipleVillages;


CREATE TABLE STU_MASTER
(
    RNO INT PRIMARY KEY,
    NAME VARCHAR(50),
    BRANCH VARCHAR(10) DEFAULT 'GENERAL',
    SPI DECIMAL(4,2) CHECK (SPI<=10),
    BKLOG INT CHECK (BKLOG>=0)
)
SELECT *
FROM STU_MASTER;

UPDATE STU_MASTER
SET SPI = 12
WHERE NAME = 'RAJU';

UPDATE STU_MASTER
SET BKLOG = -1
WHERE NAME = 'NEHA'


----------------------PART-B------------------

CREATE TABLE DEPT_DETAILS
(
    DID INT PRIMARY KEY,
    DNAME VARCHAR(100) NOT NULL
);

CREATE TABLE CITY_DETAILS
(
    CID INT PRIMARY KEY,
    CNAME VARCHAR(100) NOT NULL
);
CREATE TABLE EMP_DETAILS
(
    EID INT PRIMARY KEY,
    ENAME VARCHAR(100) NOT NULL,
    DID INT,
    CID INT,
    SALARY DECIMAL(10, 2) CHECK (SALARY > 0),
    EXPERIENCE INT CHECK (EXPERIENCE >= 0),
    FOREIGN KEY (DID) REFERENCES DEPT_DETAILS(DID),
    FOREIGN KEY (CID) REFERENCES CITY_DETAILS(CID)
);

INSERT INTO DEPT_DETAILS
    (DID, DNAME)
VALUES
    (1, 'HR'),
    (2, 'ENGINEERING'),
    (3, 'MARKETING');

INSERT INTO CITY_DETAILS
    (CID, CNAME)
VALUES
    (1, 'NEW YORK'),
    (2, 'LOS ANGELES'),
    (3, 'CHICAGO');

INSERT INTO EMP_DETAILS
    (EID, ENAME, DID, CID, SALARY, EXPERIENCE)
VALUES
    (1, 'JOHN DOE', 1, 1, 50000.00, 5),
    (2, 'JANE SMITH', 2, 2, 75000.00, 8),
    (3, 'MIKE JOHNSON', 3, 3, 60000.00, 3);

SELECT *
FROM DEPT_DETAILS;
SELECT *
FROM CITY_DETAILS;
SELECT *
FROM EMP_DETAILS;



----------------------PART-C------------------

CREATE TABLE COUNTRY_INFO
(
    CID INT PRIMARY KEY,
    CNAME VARCHAR(100) NOT NULL
);

CREATE TABLE STATE_INFO
(
    SID INT PRIMARY KEY,
    SNAME VARCHAR(100) NOT NULL,
    CID INT,
    FOREIGN KEY (CID) REFERENCES COUNTRY_INFO(CID)
);

CREATE TABLE DISTRICT_INFO
(
    DID INT PRIMARY KEY,
    DNAME VARCHAR(100) NOT NULL,
    SID INT,
    FOREIGN KEY (SID) REFERENCES STATE_INFO(SID)
);

CREATE TABLE DEPT_INFO
(
    DID INT PRIMARY KEY,
    DNAME VARCHAR(100) NOT NULL
);

CREATE TABLE CITY_INFO
(
    CID INT PRIMARY KEY,
    CNAME VARCHAR(100) NOT NULL,
    DID INT,
    FOREIGN KEY (DID) REFERENCES DISTRICT_INFO(DID)
);

CREATE TABLE EMP_INFO
(
    EID INT PRIMARY KEY,
    ENAME VARCHAR(100) NOT NULL,
    DID INT,
    CID INT,
    SALARY DECIMAL(10, 2) CHECK (SALARY > 0),
    -- SALARY MUST BE POSITIVE
    EXPERIENCE INT CHECK (EXPERIENCE >= 0),
    -- EXPERIENCE CANNOT BE NEGATIVE
    FOREIGN KEY (DID) REFERENCES DEPT_INFO(DID),
    FOREIGN KEY (CID) REFERENCES CITY_INFO(CID)
);

INSERT INTO COUNTRY_INFO
    (CID, CNAME)
VALUES
    (1, 'USA'),
    (2, 'CANADA'),
    (3, 'UK'),
    (4, 'AUSTRALIA'),
    (5, 'INDIA');

INSERT INTO STATE_INFO
    (SID, SNAME, CID)
VALUES
    (1, 'CALIFORNIA', 1),
    (2, 'ONTARIO', 2),
    (3, 'LONDON', 3),
    (4, 'NEW SOUTH WALES', 4),
    (5, 'GUJARAT', 5);

INSERT INTO DISTRICT_INFO
    (DID, DNAME, SID)
VALUES
    (1, 'LOS ANGELES', 1),
    (2, 'TORONTO', 2),
    (3, 'WESTMINSTER', 3),
    (4, 'SYDNEY', 4),
    (5, 'AHMEDABAD', 5);

INSERT INTO DEPT_INFO
    (DID, DNAME)
VALUES
    (1, 'HR'),
    (2, 'ENGINEERING'),
    (3, 'MARKETING'),
    (4, 'SALES'),
    (5, 'FINANCE');

INSERT INTO CITY_INFO
    (CID, CNAME, DID)
VALUES
    (1, 'LOS ANGELES CITY', 1),
    (2, 'TORONTO CITY', 2),
    (3, 'LONDON CITY', 3),
    (4, 'SYDNEY CITY', 4),
    (5, 'AHMEDABAD CITY', 5);

INSERT INTO EMP_INFO
    (EID, ENAME, DID, CID, SALARY, EXPERIENCE)
VALUES
    (1, 'JOHN DOE', 1, 1, 50000.00, 5),
    (2, 'JANE SMITH', 2, 2, 75000.00, 8),
    (3, 'MIKE JOHNSON', 3, 3, 60000.00, 3),
    (4, 'ALICE BROWN', 4, 4, 45000.00, 2),
    (5, 'BOB GREEN', 5, 5, 40000.00, 4);

SELECT E.ENAME,D.DNAME,E.SALARY,E.EXPERIENCE,C.CNAME,DIS.DNAME,S.SNAME,COU.CNAME
FROM EMP_INFO E JOIN DEPT_INFO D ON E.DID = D.DID
    JOIN CITY_INFO C ON D.DID = C.DID
    JOIN DISTRICT_INFO DIS ON C.DID = DIS.DID
    JOIN STATE_INFO S ON DIS.SID = S.SID
    JOIN COUNTRY_INFO COU ON S.CID = COU.CID