SELECT TOP (1000) [OrderID]
      ,[Date]
      ,[CustomerID]
      ,[Product]
      ,[Quantity]
      ,[UnitPrice]
      ,[ShippingAddress]
      ,[PaymentMethod]
      ,[OrderStatus]
      ,[TrackingNumber]
      ,[ItemsInCart]
      ,[CouponCode]
      ,[ReferralSource]
      ,[TotalPrice]
  FROM [Task-3-GodwinUdofia].[dbo].[Dataset for Data Analytics 3]


  ----- Count Total Records -----
SELECT COUNT(*) AS TotalRecords
FROM [Dataset for Data Analytics 3];


----- Empty Cutomers ID -----
SELECT *
FROM [Dataset for Data Analytics 3]
WHERE CustomerID IS NULL;


----- Empty Product Names -----
SELECT *
FROM [Dataset for Data Analytics 3]
WHERE Product IS NULL; 


----- Missing Payment Methods -----
SELECT *
FROM [Dataset for Data Analytics 3]
WHERE PaymentMethod IS NULL;


---- Check for Duplicate Orders -----
SELECT OrderID,
       COUNT(*) AS DuplicateCount
FROM [Dataset for Data Analytics 3]
GROUP BY OrderID
HAVING COUNT(*) > 1;

----- Check for Negative values -----
SELECT *
FROM [Dataset for Data Analytics 3]
WHERE Quantity <= 0;

----- Unite Price -----
SELECT *
FROM [Dataset for Data Analytics 3]
WHERE UnitPrice <= 0;


----- Total Price -----
SELECT *
FROM [Dataset for Data Analytics 3]
WHERE TotalPrice <= 0;


----- Show Only Shipped Orders -----
SELECT *
FROM [Dataset for Data Analytics 3]
WHERE OrderStatus = 'Shipped';

----- Show Expensive Orders -----
SELECT *
FROM [Dataset for Data Analytics 3]
WHERE TotalPrice > 2000;

----- Sort Highest Orders -----
select *
from [Dataset for Data Analytics 3]
order by TotalPrice DESC;

----- Sort Lowest Orders -----
SELECT *
FROM [Dataset for Data Analytics 3]
ORDER BY TotalPrice ASC;

----- COUNT ORDERS -----
SELECT COUNT(*) AS TotalOrders
FROM [Dataset for Data Analytics 3];

----- Total Revenue -----
SELECT SUM(TotalPrice) AS TotalRevenue
FROM [Dataset for Data Analytics 3];

----- Average Order Value -----
SELECT AVG(TotalPrice) AS AverageOrderValue
FROM [Dataset for Data Analytics 3];

----- Orders Per Product -----
SELECT Product,
       COUNT(*) AS NumberOfOrders
FROM [Dataset for Data Analytics 3]
GROUP BY Product;

----- Revenue Per Product -----
SELECT Product,
       SUM(TotalPrice) AS Revenue
FROM [Dataset for Data Analytics 3]
GROUP BY Product
ORDER BY Revenue DESC;

----- Average Quantity Sold Per Product -----
SELECT Product,
       AVG(Quantity) AS AverageQuantity
FROM [Dataset for Data Analytics 3]
GROUP BY Product;

----- Orders By Payment Method -----
SELECT PaymentMethod,
       COUNT(*) AS TotalOrders
FROM [Dataset for Data Analytics 3]
GROUP BY PaymentMethod
ORDER BY TotalOrders DESC;

----- Revenue By Payment Method -----
SELECT PaymentMethod,
       SUM(TotalPrice) AS Revenue
FROM [Dataset for Data Analytics 3]
GROUP BY PaymentMethod
ORDER BY Revenue DESC;


----- Orders By Status -----
SELECT OrderStatus,
       COUNT(*) AS TotalOrders
FROM [Dataset for Data Analytics 3]
GROUP BY OrderStatus
ORDER BY TotalOrders DESC;

----- Best Selling Product -----
SELECT Product,
       SUM(Quantity) AS TotalQuantitySold
FROM [Dataset for Data Analytics 3]
GROUP BY Product
ORDER BY TotalQuantitySold DESC;

----- Top 5 Customers -----
SELECT TOP 5
       CustomerID,
       SUM(TotalPrice) AS AmountSpent
FROM [Dataset for Data Analytics 3]
GROUP BY CustomerID
ORDER BY AmountSpent DESC;

----- Orders By Referral source
SELECT ReferralSource,
       COUNT(*) AS OrdersGenerated
FROM [Dataset for Data Analytics 3]
GROUP BY ReferralSource
ORDER BY OrdersGenerated DESC;

----- Monthly Sales Trend -----
SELECT
    YEAR([Date]) AS SalesYear,
    MONTH([Date]) AS SalesMonth,
    SUM(TotalPrice) AS Revenue
FROM [Dataset for Data Analytics 3]
GROUP BY
    YEAR([Date]),
    MONTH([Date])
ORDER BY
    SalesYear,
    SalesMonth;



----------------- BASIC ANALYSIS -------------------

/* 


1. Total records ---   1,200
2. Total revenue ---   1264761.96174622
3. Average Order ---   1053.96830145518
4. Most purchased product ---    Chair
5. 250 canceled orders
6. The Most commonly used payment method --- Credit Card
7. Customer ID with highest amount spent  ---   C38840
8. Highest sales month ---   Jan-2023
9. Source with highest number of orders ---   Instagram


*/
