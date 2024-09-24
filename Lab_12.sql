--From the above given table perform the following queries:
                              --Part – A:
--1. Find all persons with their department name & code.
    SELECT DEPT.DepartmentName,DEPT.DepartmentCode
	FROM DEPT , PERSON
	WHERE DEPT.DepartmentId = PERSON.DepartmentId

--2. Find the person's name whose department is in C-Block.
    SELECT PERSON.PersonName
	FROM PERSON JOIN DEPT
	ON  DEPT.DepartmentId = PERSON.DepartmentId
	WHERE DEPT.Location = 'C-Block'

--3. Retrieve person name, salary & department name who belongs to Jamnagar city.
    SELECT PERSON.PersonName,PERSON.Salary,DEPT.Departmentname
	FROM PERSON JOIN DEPT
	ON DEPT.DepartmentId = PERSON.DepartmentId
	WHERE PERSON.City = 'Jamnagar'

--4. Retrieve person name, salary & department name who does not belong to Rajkot city.
    SELECT PERSON.PersonName,PERSON.Salary,DEPT.Departmentname
	FROM PERSON JOIN DEPT
	ON DEPT.DepartmentId = PERSON.DepartmentId
	WHERE PERSON.City <> 'Rajkot'

	SELECT * FROM PERSON
--5. Retrieve person’s name of the person who joined the Civil department after 1-Aug-2001.
    SELECT PERSON.PersonName
	FROM PERSON JOIN DEPT
	ON DEPT.DepartmentID = PERSON.DepartmentID
	WHERE DEPT.DepartmentName = 'Civil' and PERSON.JoiningDate>'2001-08-01'

--6. Find details of all persons who belong to the computer department.
    SELECT * 
	FROM PERSON JOIN DEPT
	ON DEPT.DepartmentID = PERSON.DepartmentId
	WHERE DEPT.DepartmentName = 'Computer'

--7. Display all the person's name with the department whose joining date difference with the current date
--is more than 365 days.
   SELECT PERSON.PersonName,DEPT.DepartmentName
   FROM PERSON LEFT JOIN DEPT
   ON PERSON.DepartmentID = DEPT.DepartmentID
   WHERE DATEDIFF(DAY,JoiningDate,GetDate())>365

--8. Find department wise person counts.
   SELECT COUNT(PERSON.PersonID),DEPT.DepartmentName
   FROM PERSON JOIN DEPT
   ON PERSON.DepartmentID = DEPT.DepartmentID
   GROUP BY DEPT.DepartmentName  

--9. Give department wise maximum & minimum salary with department name.
   SELECT MAX(PERSON.Salary) AS MAX_SALARY,MIN(PERSON.Salary) AS MIN_SALARY,DEPT.DepartmentName
   FROM PERSON JOIN DEPT
   ON PERSON.DepartmentID = DEPT.DepartmentID
   GROUP BY DEPT.DepartmentName


--10. Find city wise total, average, maximum and minimum salary.
   SELECT MAX(PERSON.Salary) AS MAX_SALARY,SUM(PERSON.Salary) AS TOTAL_SALARY,MIN(PERSON.Salary) AS MIN_SALARY,PERSON.City,AVG(Salary) AS AVG_Salary
   FROM PERSON JOIN DEPT  
   ON PERSON.DepartmentID = DEPT.DepartmentID
   GROUP BY PERSON.City

   
--11. Find the average salary of a person who belongs to Ahmedabad city.
   SELECT AVG(PERSON.Salary) as AVERAGESALARY,PERSON.City
   FROM PERSON JOIN DEPT
   ON PERSON.DepartmentID = DEPT.DepartmentID
   GROUP BY PERSON.City
   HAVING City='Ahmedabad'
   
--12. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In
--single column)SELECT PERSON.PersonName +' lives in '+PERSON.City+' and works in '+ DEPT.DepartmentName +' Department 'FROM PERSON JOIN DEPTON PERSON.DepartmentID = DEPT.DepartmentID--Part – B:
--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In
--single column)
 SELECT CONCAT(PERSON.PersonName , ' earns ', PERSON.Salary,' from ',DEPT.DepartmentName,' department monthly ')
 from PERSON join DEPT
 ON PERSON.DepartmentID = DEPT.DepartmentID

--2. Find city & department wise total, average & maximum salaries.
  SELECT MAX(PERSON.Salary) AS MAX_SALARY,SUM(PERSON.Salary) AS TOTAL_SALARY,PERSON.City,DEPT.DepartmentName,AVG(Salary) AS AVG_Salary
   FROM PERSON JOIN DEPT  
   ON PERSON.DepartmentID = DEPT.DepartmentID
   GROUP BY PERSON.City,DEPT.DepartmentName

--3. Find all persons who do not belong to any department.
   SELECT * FROM PERSON
   WHERE PERSON.DepartmentID IS NULL

--4. Find all departments whose total salary is exceeding 100000.  SELECT SUM(PERSON.Salary) as TOTAL_Salary,DEPT.DepartmentID  from PERSON join DEPT
  ON PERSON.DepartmentID = DEPT.DepartmentID  GROUP BY DEPT.DepartmentID  HAVING TOTAL_Salary> 100000