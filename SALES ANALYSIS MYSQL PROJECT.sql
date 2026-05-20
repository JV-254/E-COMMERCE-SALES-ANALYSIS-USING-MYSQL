CREATE DATABASE SalesAnalysisDB;
USE SalesAnalysisDB;
CREATE TABLE SalesTB (
    RowID INT PRIMARY KEY NOT NULL,
    OrderID VARCHAR(50) NOT NULL,
    OrderDate DATE NOT NULL,
    ShipDate DATE NOT NULL,
    ShipMode VARCHAR(100) NOT NULL,
    CustomerID VARCHAR(50) UNIQUE NOT NULL,
    Customer_Name VARCHAR(100) NOT NULL,
    Segment VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    Region VARCHAR(100) NOT NULL,
    ProductID VARCHAR(50) UNIQUE NOT NULL,
    Category VARCHAR(100) NOT NULL,
    Sub_Category VARCHAR(100) NOT NULL,
    Product_Name VARCHAR(100) NOT NULL,
    Sales DECIMAL(10 , 3 ) NOT NULL,
    Quantity INT,
    Profit DECIMAL(10 , 3 )
);
-- Feature Engineering ---------------------------------
-- ADDING TOTAL SALES COLUMN
ALTER TABLE SalesTB
ADD COLUMN TotalSales DECIMAL(10,3);

UPDATE SalesTB
SET TotalSales=Sales*Quantity;

-- Processing Data-------------------------------------
-- 1.Sales Analysis----------
-- Key Questions------------
-- Revenue Performance------
-- A. What is the total sales revenue generated--------
SELECT
SUM(TotalSales) AS Total_Revenue
FROM SalesTB;

-- B.What is the total Profit earned?
SELECT
SUM(profit) AS Total_Profit
FROM SalesTB;

-- C.What is the average order value?
SELECT
SUM(TotalSales)/ COUNT(DISTiNCT OrderID) AS Aaverage_Order_Value
FROM SalesTB;

-- D.What is the total Quantity Sold?
SELECT
SUM(Quantity) AS Total_Quantity_Sold
FROM SalesTB;

-- E.How many total orders were placed?
SELECT
COUNT(DISTINCT OrderID) AS Total_Orders
FROM SalesTB;

-- F. What is the profit margin percentage?
SELECT
ROUND(SUM(Profit)/SUM(TotalSales)*100,2) AS Profit_Margin_Percentage
FROM SalesTB;
-- Time-Based Analysis------------------
-- What are the monthly sales trend
SELECT
MONTH(OrderDate) AS Month,
YEAR(OrderDate) AS Year,
ROUND(SUM(TotalSales),2) AS Monthly_Sales
FROM SalesTB
GROUP BY MONTH(OrderDate),YEAR(OrderDate)
ORDER BY Month,Year;

-- Which month generated the highest sales
SELECT
MONTH(OrderDate) AS Month,
ROUND(SUM(TotalSales),2) AS Monthly_Sales
FROM SalesTB
GROUP BY MONTH(OrderDate)
ORDER BY Monthly_Sales DESC;
   
-- Which Month generated the lowest Sales?
SELECT
MONTH(OrderDate) AS Month,
ROUND(SUM(TotalSales),2) AS Monthly_Sales
FROM SalesTB
GROUP BY MONTH(OrderDate)
ORDER BY Monthly_Sales ASC
LIMIT 1 OFFSET 1;
 
 -- What are the yearly Sales Trend?
 SELECT
 YEAR(OrderDate) AS Year,
 ROUND(SUM(TotalSales),2) AS Yearly_Sales
 FROM SalesTB
 GROUP BY YEAR(OrderDate)
 ORDER BY Year DESC;
 
 -- What are the Quarterly sales Trend?
 SELECT
 QUARTER(OrderDate) AS Quarter,
 ROUND(SUM(TotalSales),2) AS Quarterly_Sales
 FROM SalesTB
 GROUP BY QUARTER(OrderDate)
 ORDER BY Quarterly_Sales DESC;
 
 -- Which Days of the week have the highest Sales?
 SELECT
 DAYNAME(OrderDate) AS Day_Of_Week,
 ROUND(SUM(TotalSales),2) AS Weekly_Sales
 FROM SalesTB
 GROUP BY Day_Of_Week
 ORDER BY Weekly_Sales DESC;
 
 -- Which Season Generates the Highest Revenue?
 SELECT
 CASE
 WHEN MONTH(OrderDate) IN (12,1,2) THEN 'Winter'
 WHEN MONTH(OrderDate) IN (3,4,5) THEN 'Spring'
 WHEN MONTH(OrderDate) IN (6,7,8) THEN 'Summer'
 WHEN MONTH(OrderDate) IN (9,10,11) THEN 'Autumn'
 END AS Season,
 ROUND(SUM(TotalSales),2) AS Seasonal_Sales
 FROM SalesTB
 GROUP BY Season
 ORDER BY Seasonal_Sales DESC;
 
 -- Reagional Analysis ----------------------------------------------------------------------
 -- Which Country Generates the most Sales?
 SELECT
 Country,
 SUM(TotalSales) AS Total_Sales
 FROM SalesTB
 GROUP BY Country
 ORDER BY Total_Sales DESC;
 
 -- Which City contributes the highest Revenue 
 SELECT
 City,
 SUM(TotalSales) AS Total_Sales
 FROM SalesTB
 GROUP BY City
 ORDER BY Total_Sales DESC
 LIMIT 5 OFFSET 5;
 
 -- Which region has the highest profit?
 SELECT
 Region,
 SUM(Profit) AS Total_Profit
 FROM SalesTB
 GROUP BY Region
 ORDER BY Total_Profit DESC;
 
 -- Which regions are underperforming?
 SELECT
 Region,
 SUM(TotalSales) AS Total_Sales
 FROM SalesTB
 GROUP BY Region
 ORDER BY Total_Sales
 LIMIT 2 OFFSET 2;
 
 -- What are the sales trend by region over time?
 SELECT
 Region,
 MONTH(OrderDate) AS Month,
 ROUND(SUM(TotalSales),2) AS Monthly_Sales_Per_Region
 FROM SalesTB
 GROUP BY Region,Month
 ORDER BY Monthly_Sales_Per_Region;
 
 -- Shipping & Operation Cost----------------------------------------------
 -- What is the average Shipping time?
 SELECT
 ROUND(AVG(DATEDIFF(ShipDate,OrderDate)),2)/COUNT(DISTINCT OrderID) AS AVG_Shipping_Time
 FROM SalesTB;
 
 -- Which shipping mode is used most frequently
 SELECT
 ShipMode,
 COUNT(ShipMode) AS Ship_Mode
 FROM SalesTB
 GROUP BY ShipMode
 ORDER BY Ship_Mode DESC;
 
 -- Which shipping mode generates the highest profit?
 SELECT
 ShipMode,
 SUM(profit) AS Total_Profit
 FROM SalesTB
 GROUP BY ShipMode
 ORDER BY Total_Profit DESC;
 
 -- Are delayed shipments affecting profitability?
 SELECT
 DATEDIFF(ShipDate,OrderDate) AS Number_Of_Days,
 SUM(Profit) AS Total_Profit
 FROM SalesTB
 GROUP BY Number_Of_Days
 ORDER BY Total_Profit;
 
 -- Which regions experience the longest Shipping Delays
 SELECT
 Region,
DATEDIFF(ShipDate,OrderDate) AS Number_Of_Days,
 SUM(Profit) AS Total_Profit
 FROM SalesTB
 GROUP BY Region, Number_Of_Days
 ORDER BY Number_Of_Days DESC;
 
 -- PRODUCT ANALYSIS------------------------------------------------------------------------------------------------------------------
 -- PRODUCT PERFORMANCE-------------------------------
 -- Which product Generates the highest sales?
 SELECT
 Product_Name,
 SUM(TotalSales) AS Total_Sales
 FROM SalesTB
 GROUP BY Product_Name
 ORDER BY Total_Sales DESC;
 
 -- Which product generates the highest profit?
 SELECT
 Product_Name,
 SUM(Profit) AS Total_Profit
 FROM SalesTB
 GROUP BY Product_Name
 ORDER BY Total_Profit DESC;
 
 -- Which product generates losses?
 SELECT
 Product_Name,
 ROUND(SUM(Profit),2) AS Total_Profit
 FROM SalesTB
 GROUP BY Product_Name
 HAVING Total_Profit<0
 ORDER BY Total_Profit ;
 
 -- Which product category performs the best?
 SELECT
 Category,
 SUM(TotalSales) AS Total_Sales
 FROM SalesTB
 GROUP BY Category
 ORDER BY Total_Sales DESC;
 
 -- Which sub-category generates the highest revenue?
 SELECT
 Sub_Category,
 SUM(TotalSales) AS Total_Sales
 FROM SalesTB
 GROUP BY Sub_Category
 ORDER BY Total_Sales DESC;
 
 -- Which product has the highest quantity sold?
 SELECT
 Product_Name,
 COUNT(Quantity) AS Qty_Sold
 FROM SalesTB
 GROUP BY Product_Name
 ORDER BY Qty_Sold DESC;
 
 -- Which product have low sales but high profit?
 SELECT
 Product_Name,
 SUM(TotalSales) AS Total_Sales,
 SUM(Profit) AS  Total_Profit
 FROM SalesTB
 GROUP BY Product_Name
 ORDER BY Total_Sales ASC ,Total_Profit DESC;
 
 -- Which product have high sales but low profit?
 SELECT 
 Product_Name,
 SUM(TotalSales) AS Total_Sales,
 SUM(Profit) AS Total_Profit
 FROM SalesTB
 GROUP BY Product_Name
 ORDER BY Total_Sales DESC, Total_Profit ASC;
 
 -- CATEGORY ANALYSIS -----------------------------------------------------------------------------------------
 -- Which category generates the most revenue?
 SELECT
 Category,
 SUM(TotalSales) AS Total_Sales
 FROM SalesTB
 GROUP BY Category 
 ORDER BY Total_Sales DESC;
 
 -- Which category generates the least revenue?
 SELECT
 Category,
 SUM(TotalSales) AS Total_Sales
 FROM SalesTB
 GROUP BY Category
 ORDER BY Total_Sales ASC;
 
 -- Which category has the highest profit margin?
 SELECT
 Category,
 ROUND(SUM(Profit)/SUM(TotalSales)* 100,2)AS Profit_Margin
 FROM SalesTB
 GROUP BY Category
 ORDER BY  Profit_Margin DESC;
 
 -- Which sub-category is most frequently purchased?
 SELECT
 Sub_Category,
 SUM(Quantity) AS Total_Purchases
 FROM SalesTB
 GROUP BY Sub_Category
 ORDER BY Total_Purchases DESC
 LIMIT 1;
 
 -- What are the sales trend by category?
 SELECT
 Category,
 MONTH(OrderDate) AS Month,
 SUM(TotalSales) AS Total_Sales
 FROM SalesTB
 GROUP BY Category, Month
 ORDER BY Total_Sales DESC;
 
 -- INVENTORY & DEMANDING INSIGHTS------------------------------------------------------------------------------------------
 -- Which products are most in Demand?
 SELECT
 Product_Name,
 SUM(Quantity) AS Total_Purchases
 FROM SalesTB
 GROUP BY Product_Name
 ORDER BY Total_Purchases DESC
 LIMIT 1;
 
 -- Which products may need to be discontinied?
 SELECT
 Product_Name,
 SUM(Quantity) AS Total_Purchases
 FROM SalesTB
 GROUP BY Product_Name
 HAVING Total_Purchases<=1
 LIMIT 5;
 
 -- CUSTOMER ANALYSIS--------------------------------------------------------------------------------------
 -- CUSTOMER BEHAVIOUR ----------------------------------------
 -- How many unique customers are there?
 SELECT
 COUNT(DISTINCT CustomerID) AS Unique_Customers
 FROM SalesTB;
 
 -- Who are the top customers by revenue?
 SELECT
 Customer_Name,
 SUM(TotalSales) AS Total_Revenue
 FROM SalesTB
 GROUP BY Customer_Name
 ORDER BY Total_Revenue DESC
 LIMIT 5;
 
 -- Who are the top customers by profit contribution?
 SELECT
 Customer_Name,
 SUM(Profit) AS Total_Profit
 FROM SalesTB
 GROUP BY Customer_Name
 ORDER BY Total_Profit DESC
 LIMIT 5;
 
 -- Which customer places most orders?
 SELECT
 Customer_Name,
 COUNT(DISTINCT OrderID) AS Orders_Placed
 FROM SalesTB
 GROUP BY Customer_Name
 ORDER BY Orders_Placed DESC
 LIMIT 5;
 
 -- What is the average spending per customer?
 SELECT 
 ROUND(SUM(TotalSales)/COUNT(DISTINCT CustomerID),2) AS AVG_Spending_Per_Customer
 FROM SalesTB;
 
 -- Which customer segment generates the highest revenue?
 SELECT
 Segment,
 SUM(TotalSales) AS Total_Revenue
 FROM SalesTB
 GROUP BY Segment
 ORDER BY Total_Revenue DESC;
 
 -- Which customer segment is most profitable?
 SELECT
 Segment,
 SUM(Profit) AS Total_Profit 
 FROM SalesTB
 GROUP BY Segment
 ORDER BY Total_Profit DESC;
 
 -- CUSTOMER SEGMENTATION------------------------------------------
 -- Which segement has the highest aveverage order value?
 SELECT 
 Segment,
 ROUND(SUM(TotalSales)/COUNT(DISTINCT OrderID),2)AS AOV
 FROM SalesTB
 GROUP BY Segment
 ORDER BY AOV DESC;
 
 -- GEOGRAPHICAL CUSTOMER INSIGHTS---------------------------------------------------------------------------------------
 -- Which cities have the highest number of customers?
 SELECT
 City,
 COUNT(DISTINCT CustomerID) AS Number_Of_Customers
 FROM SalesTB
 GROUP BY City
 ORDER BY Number_Of_Customers DESC
 LIMIT 5;
 
 -- Which regions have the most loyal customers?
 SELECT
 Region,
 COUNT(DISTINCT CustomerID) AS Loyal_Customers
 FROM SalesTB
 GROUP BY Region
 ORDER BY Loyal_Customers DESC;
 
 -- 