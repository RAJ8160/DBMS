--LAB 8 


--TABLE: SALES_DATA

	CREATE TABLE SALES_DATA
	(
		REGION VARCHAR(25),
		PRODUCT VARCHAR(25),
		SALES_AMOUNT INT,
		YEAR INT,
	);

	INSERT INTO SALES_DATA VALUES
		('NORTH AMERICA','WATCH',1500,2023),
		('EUROPE','MOBILE',1200,2023),
		('ASIA','WATCH',1800,2023),
		('NORTH AMERICA','TV',900,2024),
		('EUROPE','WATCH',2000,2024),
		('ASIA','MOBILE',1000,2024),
		('NORTH AMERICA','MOBILE',1600,2024),
		('EUROPE','TV',1500,2024),
		('ASIA','TV',1100,2024),
		('NORTH AMERICA','WATCH',1700,2024)

		--TRUNCATE TABLE SALES_DATA
		SELECT * FROM SALES_DATA


--PART � A:

	--1. DISPLAY TOTAL SALES AMOUNT BY REGION.
		SELECT REGION,SUM(SALES_AMOUNT) AS SALESS_AMOUNT
		FROM SALES_DATA
		GROUP BY REGION

	--2. DISPLAY AVERAGE SALES AMOUNT BY PRODUCT
		SELECT PRODUCT,AVG(SALES_AMOUNT) AS SALES_AMOUNT_AVG
		FROM SALES_DATA
		GROUP BY PRODUCT
	
	--3. DISPLAY MAXIMUM SALES AMOUNT BY YEAR
		SELECT YEAR,MAX(SALES_AMOUNT) AS MAXIMUM_SALES
		FROM SALES_DATA
		GROUP BY YEAR

	--4. DISPLAY MINIMUM SALES AMOUNT BY REGION AND YEAR
		SELECT REGION,YEAR,MIN(SALES_AMOUNT) AS MIN_SAL_REG_YR
		FROM SALES_DATA
		GROUP BY REGION,YEAR

	--5. COUNT OF PRODUCTS SOLD BY REGION
		SELECT REGION,COUNT(PRODUCT) AS PROODUCT_SOLD
		FROM SALES_DATA
		GROUP BY REGION

	--6. DISPLAY SALES AMOUNT BY YEAR AND PRODUCT
		SELECT YEAR,PRODUCT,SUM(SALES_AMOUNT) AS SALES_AMOUNT
		FROM SALES_DATA
		GROUP BY YEAR,PRODUCT

	--7. DISPLAY REGIONS WITH TOTAL SALES GREATER THAN 5000
		SELECT REGION,SUM(SALES_AMOUNT) AS TOTAL_SALES_AMOUNT_GT_5000
		FROM SALES_DATA
		GROUP BY REGION
		HAVING SUM(SALES_AMOUNT) > 5000

	--8. DISPLAY PRODUCTS WITH AVERAGE SALES LESS THAN 10000
		SELECT PRODUCT,AVG(SALES_AMOUNT) AS AVG_SALES_AMOUNT_LT_5000
		FROM SALES_DATA
		GROUP BY PRODUCT
		HAVING AVG(SALES_AMOUNT) < 10000

	--9. DISPLAY YEARS WITH MAXIMUM SALES EXCEEDING 500
		SELECT YEAR,MAX(SALES_AMOUNT) AS MAX_SAL_EXCEEDING_500
		FROM SALES_DATA
		GROUP BY YEAR
		HAVING MAX(SALES_AMOUNT) > 500

	--10. DISPLAY REGIONS WITH AT LEAST 3 DISTINCT PRODUCTS SOLD.
		SELECT REGION,COUNT(DISTINCT(PRODUCT)) AS DISTINCT_PRODUCTS
		FROM SALES_DATA
		GROUP BY REGION
		HAVING COUNT(DISTINCT(PRODUCT)) < = 3

	--11. DISPLAY YEARS WITH MINIMUM SALES LESS THAN 1000
		SELECT YEAR,MIN(SALES_AMOUNT) AS MIN_SAL_LT_1000
		FROM SALES_DATA
		GROUP BY YEAR
		HAVING MIN(SALES_AMOUNT) < 1000

	--12. DISPLAY TOTAL SALES AMOUNT BY REGION FOR YEAR 2023, SORTED BY TOTAL AMOUNT
		SELECT YEAR,REGION,SUM(SALES_AMOUNT) AS TOTAL_SALES_AMOUNT_BY_REGION_FOR_YR_2023
		FROM SALES_DATA
		GROUP BY REGION,YEAR
		HAVING YEAR = 2023
		ORDER BY SUM(SALES_AMOUNT) ASC

--PART � B:


	--1. DISPLAY COUNT OF ORDERS BY YEAR AND REGION, SORTED BY YEAR AND REGION
		SELECT YEAR,REGION,COUNT(PRODUCT) AS COUNT_OF_ORDER
		FROM SALES_DATA
		GROUP BY YEAR,REGION
		ORDER BY YEAR ASC,REGION ASC

	--2. DISPLAY REGIONS WITH MAXIMUM SALES AMOUNT EXCEEDING 1000 IN ANY YEAR, SORTED BY REGION
		SELECT REGION,YEAR,MAX(SALES_AMOUNT)
		FROM SALES_DATA
		GROUP BY YEAR,REGION
		HAVING MAX(SALES_AMOUNT) > 1000
		ORDER BY REGION ASC
	

	--3. DISPLAY YEARS WITH TOTAL SALES AMOUNT LESS THAN 1000, SORTED BY YEAR DESCENDING
		SELECT YEAR,SUM(SALES_AMOUNT) AS TOTAL_SALES
		FROM SALES_DATA
		GROUP BY YEAR
		HAVING SUM(SALES_AMOUNT) < 1000
		ORDER BY YEAR DESC


	--4. DISPLAY TOP 3 REGIONS BY TOTAL SALES AMOUNT IN YEAR 2024
		SELECT  YEAR,REGION,SUM(SALES_AMOUNT) AS TOTAL_SALES_AMOUNT_2024
		FROM SALES_DATA
		GROUP BY YEAR,REGION
		HAVING YEAR = 2024
		ORDER BY REGION ASC

--PART � C:


	--1. DISPLAY PRODUCTS WITH AVERAGE SALES AMOUNT BETWEEN 1000 AND 2000, ORDERED BY PRODUCT NAME
		SELECT PRODUCT,AVG(SALES_AMOUNT) AS AVG_AMOUNT
		FROM SALES_DATA
		GROUP BY PRODUCT
		HAVING AVG(SALES_AMOUNT) BETWEEN 1000 AND 2000

	--2. DISPLAY YEARS WITH MORE THAN 5 ORDERS FROM EACH REGION
		SELECT YEAR
		FROM SALES_DATA
		GROUP BY YEAR,REGION
		HAVING COUNT(PRODUCT) > 5
	
	--3. DISPLAY REGIONS WITH AVERAGE SALES AMOUNT ABOVE 1500 IN YEAR 2023 SORT BY AMOUNT IN DESCENDING.
		SELECT REGION,YEAR,AVG(SALES_AMOUNT)
		FROM SALES_DATA
		GROUP BY REGION,YEAR
		HAVING YEAR = 2023
		ORDER BY AVG(SALES_AMOUNT) DESC

	--4. FIND OUT REGION WISE DUPLICATE PRODUCT.
		SELECT REGION,PRODUCT,COUNT(PRODUCT) AS NO_OF_DUPLICATE_PRODUCT
		FROM SALES_DATA
		GROUP BY REGION,PRODUCT
		HAVING COUNT(PRODUCT) > 1 
		ORDER BY COUNT(PRODUCT) ASC

	--5. FIND OUT REGION WISE HIGHEST SALES AMOUNT
		SELECT REGION,MAX(SALES_AMOUNT) AS HIGHEST_SALES
		FROM SALES_DATA
		GROUP BY REGION
		ORDER BY MAX(SALES_AMOUNT) ASC