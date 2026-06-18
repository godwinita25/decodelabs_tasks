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
  FROM [Task-3-GodwinUdofia].[dbo].[task-3-GodwinUdofia]


  ----- Count Total Records -----
SELECT COUNT(*) AS TotalRecords
FROM [task-3-GodwinUdofia];


----- Empty Cutomers ID -----
SELECT *
FROM [task-3-GodwinUdofia]
WHERE CustomerID IS NULL;


----- Empty Product Names -----
SELECT *
FROM [task-3-GodwinUdofia]
WHERE Product IS NULL; 


----- Missing Payment Methods -----
SELECT *
FROM [task-3-GodwinUdofia]
WHERE PaymentMethod IS NULL;


---- Check for Duplicate Orders -----
SELECT OrderID,
       COUNT(*) AS DuplicateCount
FROM [task-3-GodwinUdofia]
GROUP BY OrderID
HAVING COUNT(*) > 1;

----- Check for Negative values -----
SELECT *
FROM [task-3-GodwinUdofia]
WHERE Quantity <= 0;

----- Unite Price -----
SELECT *
FROM [task-3-GodwinUdofia]
WHERE UnitPrice <= 0;


----- Total Price -----
SELECT *
FROM [task-3-GodwinUdofia]
WHERE TotalPrice <= 0;


----- Show Only Shipped Orders -----
SELECT *
FROM [task-3-GodwinUdofia]
WHERE OrderStatus = 'Shipped';

----- Show Expensive Orders -----
SELECT *
FROM [task-3-GodwinUdofia]
WHERE TotalPrice > 2000;

----- Sort Highest Orders -----
select *
from [task-3-GodwinUdofia]
order by TotalPrice DESC;

----- Sort Lowest Orders -----
SELECT *
FROM [task-3-GodwinUdofia]
ORDER BY TotalPrice ASC;

----- COUNT ORDERS -----
SELECT COUNT(*) AS TotalOrders
FROM [task-3-GodwinUdofia];

----- Total Revenue -----
SELECT SUM(TotalPrice) AS TotalRevenue
FROM [task-3-GodwinUdofia];

----- Average Order Value -----
SELECT AVG(TotalPrice) AS AverageOrderValue
FROM [task-3-GodwinUdofia];

----- Orders Per Product -----
SELECT Product,
       COUNT(*) AS NumberOfOrders
FROM [task-3-GodwinUdofia]
GROUP BY Product;

----- Revenue Per Product -----
SELECT Product,
       SUM(TotalPrice) AS Revenue
FROM [task-3-GodwinUdofia]
GROUP BY Product
ORDER BY Revenue DESC;

----- Average Quantity Sold Per Product -----
SELECT Product,
       AVG(Quantity) AS AverageQuantity
FROM [task-3-GodwinUdofia]
GROUP BY Product;

----- Orders By Payment Method -----
SELECT PaymentMethod,
       COUNT(*) AS TotalOrders
FROM [task-3-GodwinUdofia]
GROUP BY PaymentMethod
ORDER BY TotalOrders DESC;

----- Revenue By Payment Method -----
SELECT PaymentMethod,
       SUM(TotalPrice) AS Revenue
FROM [task-3-GodwinUdofia]
GROUP BY PaymentMethod
ORDER BY Revenue DESC;


----- Orders By Status -----
SELECT OrderStatus,
       COUNT(*) AS TotalOrders
FROM [task-3-GodwinUdofia]
GROUP BY OrderStatus
ORDER BY TotalOrders DESC;

----- Best Selling Product -----
SELECT Product,
       SUM(Quantity) AS TotalQuantitySold
FROM [task-3-GodwinUdofia]
GROUP BY Product
ORDER BY TotalQuantitySold DESC;

----- Top 5 Customers -----
SELECT TOP 5
       CustomerID,
       SUM(TotalPrice) AS AmountSpent
FROM [task-3-GodwinUdofia]
GROUP BY CustomerID
ORDER BY AmountSpent DESC;

----- Orders By Referral source
SELECT ReferralSource,
       COUNT(*) AS OrdersGenerated
FROM [task-3-GodwinUdofia]
GROUP BY ReferralSource
ORDER BY OrdersGenerated DESC;

----- Monthly Sales Trend -----
SELECT
    YEAR([Date]) AS SalesYear,
    MONTH([Date]) AS SalesMonth,
    SUM(TotalPrice) AS Revenue
FROM [task-3-GodwinUdofia]
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
