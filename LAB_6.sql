--Lab 6 Implement SQL In-built functions (Math, String, and Date Functions)
--Math functions
--Part – A:
--1. Display the result of 5 multiply by 30.
select 5*30 AS RESULT
--2. Find out the absolute value of -25, 25, -50 and 50.
    SELECT ABS(-25) AS absolute25,ABS(25) AS  absolute25,ABS(-50) AS absolute50,ABS(50) AS absolute50
--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
    SELECT FLOOR(25.2)
--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.
--5. Find out remainder of 5 divided 2 and 5 divided by 3.
--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power.
--7. Find out the square root of 25, 30 and 50.
--8. Find out the square of 5, 15, and 25.
--9. Find out the value of PI.
--10. Find out round value of 157.732 for 2, 0 and -2 decimal points.
--11. Find out exponential value of 2 and 3.
--12. Find out logarithm having base e of 10 and 2.
--13. Find out logarithm having base b having value 10 of 5 and 100.
--14. Find sine, cosine and tangent of 3.1415.
--15. Find sign of -25, 0 and 25.
--16. Generate random number using function

--Date Functions
--Part – A:
--1. Write a query to display the current date & time. Label the column Today_Date.
     SELECT GETDATE() AS TODAY_DATE
--2. Write a query to find new date after 365 day with reference to today.
    SELECT GETDATE()+365 AS NEW_DATE
--3. Display the current date in a format that appears as may 5 1994 12:00AM.
    SELECT FORMAT(GETDATE(),'MMM dd yyyy HH:MM tt')AS DATE
--4. Display the current date in a format that appears as 03 Jan 1995.
    SELECT FORMAT(GETDATE(),'dd MMM yyyy')AS DATE
--5. Display the current date in a format that appears as Jan 04, 96.
    SELECT FORMAT(GETDATE(),'MMM  dd yyyy')AS DATE
--6. Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09.
    select DATEDIFF(MONTH,'2008-12-08','2009-03-09') AS MONTH
--7. Write a query to find out total number of years between 25-Jan-12 and 14-Sep-10.
    select DATEDIFF(YEAR,'2012-01-25','2010-09-14') AS YEAR
--8. Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30.
    SELECT DATEDIFF(HOUR,'2012-01-25 7:00','2012-01-26 10:30') AS HOURS
--9. Write a query to extract Day, Month, Year from given date 12-May-16.
    select DATEPART(YEAR,'2016-05-12')
	select DATEPART(MONTH,'2016-05-12')
	select DATEPART(DAY,'2016-05-12')

--10. Write a query that adds 5 years to current date.
    SELECT DATEADD(YEAR,5,GETDATE()) AS NEW_DATE
--11. Write a query to subtract 2 months from current date.
    select DATEADD(MONTH,-2,GETDATE())AS NEW_DATE
--12. Extract month from current date using datename () and datepart () function.
    SELECT DATEPART(MONTH,GETDATE()) AS DATE_NAME
	SELECT DATENAME(MONTH,GETDATE())
--13. Write a query to find out last date of current month.
    SELECT EOMONTH(GETDATE()) AS LAST_DATE
--14. Calculate your age in years and months
     SELECT DATEDIFF(YEAR,'2006-07-06',GETDATE()) AS  YEAR
	 select DATEDIFF(MONTH,'2006-07-06',GETDATE()) AS MONTH