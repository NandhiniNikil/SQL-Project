SELECT * FROM [BlinkIT Grocery Data SQL project]

SELECT COUNT(*) FROM [BlinkIT Grocery Data SQL project]

UPDATE [BlinkIT Grocery Data SQL project]
SET Item_Fat_Content = 
CASE 
WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
WHEN Item_Fat_Content = 'reg' THEN 'Regular'
ELSE Item_Fat_Content
END 


SELECT DISTINCT Item_Fat_Content FROM [BlinkIT Grocery Data SQL project] 

SELECT CAST(SUM (Total_Sales)/1000000 AS DECIMAL(10,2)) AS TOTAL_SALES_MILLIONS 
FROM [BlinkIT Grocery Data SQL project]
WHERE Item_Fat_Content = 'Low Fat'


SELECT CAST(AVG (Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales FROM [BlinkIT Grocery Data SQL project]
WHERE Item_Fat_Content = 'Low Fat'

SELECT COUNT (*) AS No_Of_Items FROM [BlinkIT Grocery Data SQL project]
WHERE Item_Fat_Content = 'Low Fat'

SELECT CAST(AVG(Rating) AS Decimal(10,2)) AS AVG_RATING  FROM [BlinkIT Grocery Data SQL project]

SELECT Item_Fat_Content,CAST(SUM(Total_Sales)/1000 AS DECIMAL(10,2)) AS Total_Sales_K,
                        CAST(AVG (Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
						COUNT (*) AS No_Of_Items,
						CAST(AVG(Rating) AS Decimal(10,2)) AS AVG_RATING  
FROM [BlinkIT Grocery Data SQL project]
GROUP BY Item_Fat_Content
ORDER BY Total_Sales_K DESC

SELECT TOP 5 Item_Type ,CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
                        CAST(AVG (Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
						COUNT (*) AS No_Of_Items,
						CAST(AVG(Rating) AS Decimal(10,2)) AS AVG_RATING  
FROM [BlinkIT Grocery Data SQL project]
GROUP BY Item_Type
ORDER BY Total_Sales DESC

SELECT Outlet_Location_Type,Item_Fat_Content,
                        CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales_K,
                        CAST(AVG (Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
						COUNT (*) AS No_Of_Items,
						CAST(AVG(Rating) AS Decimal(10,2)) AS AVG_RATING  
FROM [BlinkIT Grocery Data SQL project]
GROUP BY Outlet_Location_Type, Item_Fat_Content
ORDER BY Total_Sales_K DESC

SELECT Outlet_Location_Type,
      ISNULL([Low Fat],0) AS Low_Fat,
	  ISNULL([Regular],0) AS Regular
	  FROM
	  (
	  SELECT Outlet_Location_Type,Item_Fat_Content,
	  CAST(SUM(Total_Sales) AS DECIMAL (10,2)) AS Total_Sales
	  FROM [BlinkIT Grocery Data SQL project]
	  GROUP BY Outlet_Location_Type,Item_Fat_Content
	  )
	  AS SOURCETABLE
	  PIVOT
	  (
	  SUM(Total_Sales)
	  FOR Item_Fat_Content IN ([Low Fat],[Regular])
	  )AS PIVOTTABLE
	  ORDER BY Outlet_Location_Type

SELECT Outlet_Establishment_Year,
                        CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
						CAST(AVG (Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
						COUNT (*) AS No_Of_Items,
						CAST(AVG(Rating) AS Decimal(10,2)) AS AVG_RATING
FROM [BlinkIT Grocery Data SQL project]
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year ASC

SELECT Outlet_Size,
       CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
	   CAST((SUM(Total_Sales) * 100.0/ SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
	   FROM [BlinkIT Grocery Data SQL project]
	   GROUP BY Outlet_Size
	   Order BY Outlet_Size Desc;

SELECT Outlet_Location_Type,
                        CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
						CAST((SUM(Total_Sales) * 100.0/ SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
						CAST(AVG (Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
						COUNT (*) AS No_Of_Items,
						CAST(AVG(Rating) AS Decimal(10,2)) AS AVG_RATING
FROM [BlinkIT Grocery Data SQL project]
WHERE Outlet_Establishment_Year= 2022
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC


SELECT Outlet_Type,
                        CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
						CAST((SUM(Total_Sales) * 100.0/ SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
						CAST(AVG (Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
						COUNT (*) AS No_Of_Items,
						CAST(AVG(Rating) AS Decimal(10,2)) AS AVG_RATING
FROM [BlinkIT Grocery Data SQL project]
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC





