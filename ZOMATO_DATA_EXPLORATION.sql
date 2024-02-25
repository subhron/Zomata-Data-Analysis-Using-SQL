
USE [project];

SELECT 
COLUMN_NAME, 
DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'ZomatoData1'																				

	
SELECT DISTINCT(TABLE_CATALOG),TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS										
SELECT * FROM INFORMATION_SCHEMA.COLUMNS

SELECT * FROM [dbo].[ZomatoData1]



***** CHECKING FOR DUPLICATES *****
SELECT [RestaurantID],COUNT([RestaurantID]) FROM 
[dbo].[ZomatoData1]
GROUP BY [RestaurantID]
ORDER BY 2 DESC

SELECT * FROM ZOMATO_COUNTRY;



***** REMOVING UNWANTED ROWS *****
DELETE FROM [dbo].[ZomatoData1] 
WHERE [CountryCode] IN (' Bar',' Grill',' Bakers & More"',' Chowringhee Lane"',' Grill & Bar"',' Chinese')

DELETE FROM [dbo].[ZomatoData1] 
WHERE [RestaurantID] = '18306543'

SELECT * FROM [dbo].[ZomatoData1]



***** COUNTRY CODE COLUMN *****
SELECT A.[CountryCode],B.COUNTRY
FROM [dbo].[ZomatoData1] A JOIN [dbo].[ZOMATO_COUNTRY] B
ON A.[CountryCode] = B.COUNTRYCODE

ALTER TABLE [dbo].[ZomatoData1] ADD COUNTRY_NAME VARCHAR(50)

***** MERGING AND ADDING COUNTRY DETAILS FROM DIFFERENT TABLE THROUGH UPDATE WITH JOIN STATEMENT *****
UPDATE [dbo].[ZomatoData1] SET COUNTRY_NAME = B.COUNTRY								
FROM [dbo].[ZomatoData1] A JOIN [dbo].[ZOMATO_COUNTRY] B
ON A.[CountryCode] = B.[COUNTRYCODE]

SELECT *
FROM [dbo].[ZomatoData1]



***** CITY COLUMN *****
SELECT DISTINCT [City] FROM [dbo].[ZomatoData1] 
WHERE CITY LIKE '%?%'																  

SELECT REPLACE(CITY,'?','i') 
FROM [ZomatoData1] WHERE CITY LIKE '%?%'											  

UPDATE [dbo].[ZomatoData1] SET [City]  = REPLACE(CITY,'?','i') 
					 FROM [ZomatoData1] WHERE CITY LIKE '%?%'	 			

***** COUNTING TOTAL REST. IN EACH CITY OF PARTICULAR COUNTRY *****
SELECT [COUNTRY_NAME], CITY, COUNT([City]) TOTAL_REST							      
FROM [dbo].[ZomatoData1]
GROUP BY [COUNTRY_NAME],CITY 
ORDER BY 1,2,3 DESC



***** LOCALITY COLUMN *****
SELECT CITY,[Locality], COUNT([Locality]) COUNT_LOCALITY,														-- ROLLING COUNT
SUM(COUNT([Locality])) OVER(PARTITION BY [City] ORDER BY CITY,[Locality]) ROLL_COUNT
FROM [dbo].[ZomatoData1]
WHERE [COUNTRY_NAME] = 'INDIA'
GROUP BY [Locality],CITY
ORDER BY 1,2,3 DESC



DROP COLUMN,[Locality],[LocalityVerbose][Address]
ALTER TABLE [dbo].[ZomatoData1] DROP COLUMN [Address]
ALTER TABLE [dbo].[ZomatoData1] DROP COLUMN [LocalityVerbose] 



***** CUISINES *****
SELECT [Cuisines], COUNT([Cuisines]) FROM [dbo].[ZomatoData1]
WHERE [Cuisines] IS NULL OR [Cuisines] = ' '
GROUP BY [Cuisines]
ORDER BY 2 DESC

SELECT [Cuisines],COUNT([Cuisines])
FROM [dbo].[ZomatoData1]
GROUP BY [Cuisines]
ORDER BY 2 DESC


***** CURRENCY ******
SELECT [Currency], COUNT([Currency]) FROM [dbo].[ZomatoData1]
GROUP BY [Currency]
ORDER BY 2 DESC


SELECT DISTINCT([Has_Table_booking]) FROM [dbo].[ZomatoData1]
SELECT DISTINCT([Has_Online_delivery]) FROM [dbo].[ZomatoData1]
SELECT DISTINCT([Is_delivering_now]) FROM [dbo].[ZomatoData1]
SELECT DISTINCT([Switch_to_order_menu]) FROM [dbo].[ZomatoData1]


ALTER TABLE [dbo].[ZomatoData1] DROP COLUMN [Switch_to_order_menu]


***** PRICE RANGE *****
SELECT DISTINCT([Price_range]) FROM [dbo].[ZomatoData1]



***** VOTES *****
ALTER TABLE [dbo].[ZomatoData1] ALTER COLUMN [Votes] INT

SELECT MIN(CAST([Votes] AS INT)) MIN_VT,AVG(CAST([Votes] AS INT)) AVG_VT,MAX(CAST([Votes] AS INT)) MAX_VT
FROM [dbo].[ZomatoData1]



***** COST *****
ALTER TABLE [dbo].[ZomatoData1] ALTER COLUMN [Average_Cost_for_two] FLOAT

SELECT [Currency],MIN(CAST([Average_Cost_for_two] AS INT)) MIN_CST,
AVG(CAST([Average_Cost_for_two] AS INT)) AVG_CST,
MAX(CAST([Average_Cost_for_two] AS INT)) MAX_CST
FROM [dbo].[ZomatoData1]
--WHERE [Currency] LIKE '%U%'
GROUP BY [Currency]



***** RATING *****
SELECT MIN([Rating]),
ROUND(AVG(CAST([Rating] AS DECIMAL)),1), 
MAX([Rating])  
FROM [dbo].[ZomatoData1]

SELECT CAST([Rating] AS decimal) NUM FROM [dbo].[ZomatoData1] WHERE CAST([Rating] AS decimal) >= 4

ALTER TABLE [dbo].[ZomatoData1] ALTER COLUMN [Rating] DECIMAL

SELECT RATING FROM [dbo].[ZomatoData1] WHERE [Rating] >= 4

SELECT RATING,CASE
WHEN [Rating] >= 1 AND [Rating] < 2.5 THEN 'POOR'
WHEN [Rating] >= 2.5 AND [Rating] < 3.5 THEN 'GOOD'
WHEN [Rating] >= 3.5 AND [Rating] < 4.5 THEN 'GREAT'
WHEN [Rating] >= 4.5 THEN 'EXCELLENT'
END RATE_CATEGORY
FROM [dbo].[ZomatoData1]

ALTER TABLE [dbo].[ZomatoData1] ADD RATE_CATEGORY VARCHAR(20)

SELECT * FROM [dbo].[ZomatoData1]



***** UPDATING NEW ADDED COLUMN WITH REFFERENCE OF AN EXISTING COLUMN *****
UPDATE [dbo].[ZomatoData1] SET [RATE_CATEGORY] = (CASE								     	
WHEN [Rating] >= 1 AND [Rating] < 2.5 THEN 'POOR'
WHEN [Rating] >= 2.5 AND [Rating] < 3.5 THEN 'GOOD'
WHEN [Rating] >= 3.5 AND [Rating] < 4.5 THEN 'GREAT'
WHEN [Rating] >= 4.5 THEN 'EXCELLENT'
END)
