SELECT * FROM blinkit_data;

select count(*) from blinkit_data;

UPDATE blinkit_data
SET Item_Fat_Content = 
CASE
WHEN Item_Fat_Content in ('LF','low fat') THEN ('Low fat')
WHEN Item_Fat_Content = 'reg' THEN 'Regular'
ELSE Item_Fat_Content
END
-- Checking DISTINCT Item fat content in blinkit data--
SELECT DISTINCT (Item_Fat_Content) FROM blinkit_data;

--- KPI REQUIREMENTS ---



--Extracting Total sales in blinkit data --
SELECT  SUM(Total_Sales) as Total_Sales FROM blinkit_data;

-- Extracting Total Sales in millions in blinkit data we uses CAST fucntion --
SELECT  CAST(SUM(Total_Sales)/1000000 AS DECIMAL(10,2)) as Total_Sales_Millions FROM blinkit_data;


-- Extracting Total Sales from blinkit data we use concat function to add millions in the answer --
SELECT  CONCAT(CAST(SUM(Total_Sales)/1000000 AS DECIMAL(10,2)),' Millions') as Total_Sales FROM blinkit_data;

-- Similarly we are Extracting Average Sales from blinkit data --

SELECT  CAST(AVG(Total_Sales) AS DECIMAL(10,0)) as Avg_Total_Sales FROM blinkit_data;

--Total No of Items --
SELECT COUNT(*)AS No_of_Items FROM blinkit_data;



-- Extracting Total Sales from blinkit data where Item fat content is low fat --
SELECT  CONCAT(CAST(SUM(Total_Sales)/1000000 AS DECIMAL(10,2)),' Millions') as Total_Sales FROM blinkit_data
WHERE Item_Fat_Content = 'Low fat';


-- Extracting Total Sales from blinkit data where outlet establishment year is 2020 --
SELECT  CONCAT(CAST(SUM(Total_Sales)/1000000 AS DECIMAL(10,2)),' Millions') as Total_Sales FROM blinkit_data
WHERE Outlet_Establishment_Year = 2020;

-- Extracting avg rating from blinkit data --

SELECT  CAST(AVG(Rating) AS DECIMAL(10,2)) as Avg_Ratings FROM blinkit_data;

SELECT COUNT(*)AS No_of_Items FROM blinkit_data 
WHERE Outlet_Establishment_Year = 2020;


--- GRANULAR REQUIREMENTS ---
-- Here we simultnously extract cast total sales avg count no of items and avg rating from blinkit data 
SELECT Item_Fat_Content, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) as Total_Sales,
CAST(AVG(Total_Sales) AS DECIMAL(10,1)) as Avg_Total_Sales,
COUNT(*)AS No_of_Items,
CAST(AVG(Rating) AS DECIMAL(10,2)) as Avg_Ratings
from blinkit_data
GROUP BY Item_Fat_Content ORDER BY Total_Sales DESC;

-- Similarly here we can extract same data from year 2020 --
SELECT Item_Fat_Content, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) as Total_Sales,
CAST(AVG(Total_Sales) AS DECIMAL(10,1)) as Avg_Total_Sales,
COUNT(*)AS No_of_Items,
CAST(AVG(Rating) AS DECIMAL(10,2)) as Avg_Ratings
from blinkit_data
WHERE Outlet_Establishment_Year = 2020

GROUP BY Item_Fat_Content ORDER BY Total_Sales DESC;

--Suppose we want same data and total sales in Thousands --
SELECT Item_Fat_Content, CAST(SUM(Total_Sales)/1000 AS DECIMAL(10,2)) as Total_Sales_Thousands,
CAST(AVG(Total_Sales) AS DECIMAL(10,1)) as Avg_Total_Sales,
COUNT(*)AS No_of_Items,
CAST(AVG(Rating) AS DECIMAL(10,2)) as Avg_Ratings
from blinkit_data
WHERE Outlet_Establishment_Year = 2020

GROUP BY Item_Fat_Content ORDER BY Total_Sales_Thousands DESC;


---  Now we want data according to item type we want sum avg count and avg rating --
SELECT Item_Type, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) as Total_Sales,
CAST(AVG(Total_Sales) AS DECIMAL(10,1)) as Avg_Total_Sales,
COUNT(*)AS No_of_Items,
CAST(AVG(Rating) AS DECIMAL(10,2)) as Avg_Ratings
from blinkit_data
GROUP BY Item_Type ORDER BY Total_Sales DESC;

-- We need Top 5 Item type we customer have highest total sales , avg sales , No of items, Avg Ratings --
SELECT TOP 5 Item_Type, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) as Total_Sales,
CAST(AVG(Total_Sales) AS DECIMAL(10,1)) as Avg_Total_Sales,
COUNT(*)AS No_of_Items,
CAST(AVG(Rating) AS DECIMAL(10,2)) as Avg_Ratings
from blinkit_data
GROUP BY Item_Type ORDER BY Total_Sales DESC;

--We need last 5 Item type we customer have highest total sales , avg sales , No of items, Avg Ratings  --
-- we will just change asc order from desc order in order to get last 5 --

SELECT TOP 5 Item_Type, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) as Total_Sales,
CAST(AVG(Total_Sales) AS DECIMAL(10,1)) as Avg_Total_Sales,
COUNT(*)AS No_of_Items,
CAST(AVG(Rating) AS DECIMAL(10,2)) as Avg_Ratings
from blinkit_data
GROUP BY Item_Type ORDER BY Total_Sales ASC;


-- Fat content outlet for total sales --
SELECT Outlet_Location_Type,
ISNULL([Low Fat],0) as Low_Fat,
ISNULL([Regular],0) as Regular
FROM
(
SELECT Outlet_Location_Type,
       Item_Fat_Content,
       CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT
(
SUM(Total_Sales)
FOR Item_Fat_Content IN ([Low Fat],[Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;

-- Total Sales by Oulet Establishment
SELECT Outlet_Establishment_Year,
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST(AVG(Total_Sales) AS DECIMAL(10,1)) as Avg_Total_Sales,
COUNT(*)AS No_of_Items,
CAST(AVG(Rating) AS DECIMAL(10,2)) as Avg_Ratings
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year ASC;

-- MAXIMUM sales according to Outlet Establishment Year --
SELECT Outlet_Establishment_Year,
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST(AVG(Total_Sales) AS DECIMAL(10,1)) as Avg_Total_Sales,
COUNT(*)AS No_of_Items,
CAST(AVG(Rating) AS DECIMAL(10,2)) as Avg_Ratings
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Total_Sales DESC;

-- CHART SIZE REQUIREMENT --
-- Percentage of Sales by Outlet Size --
SELECT Outlet_Size,
CAST(SUM(Total_Sales) as DECIMAL(10,2)) AS Total_Sales,
CAST(SUM(Total_Sales)* 100.0/ SUM(SUM(Total_Sales)) OVER() as DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
Order BY Total_Sales DESC;

---Sales By Oulet Location---
SELECT Outlet_Location_Type,
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST(SUM(Total_Sales)* 100.0/ SUM(SUM(Total_Sales)) OVER() as DECIMAL(10,2)) AS Sales_Percentage,
CAST(AVG(Total_Sales) AS DECIMAL(10,1)) as Avg_Total_Sales,
COUNT(*)AS No_of_Items,
CAST(AVG(Rating) AS DECIMAL(10,2)) as Avg_Ratings
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC;

--- All the metrics by Outlet type ---
SELECT Outlet_Type,
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST(SUM(Total_Sales)* 100.0/ SUM(SUM(Total_Sales)) OVER() as DECIMAL(10,2)) AS Sales_Percentage,
CAST(AVG(Total_Sales) AS DECIMAL(10,1)) as Avg_Total_Sales,
COUNT(*)AS No_of_Items,
CAST(AVG(Rating) AS DECIMAL(10,2)) as Avg_Ratings
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC;