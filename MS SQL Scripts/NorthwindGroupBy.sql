USE Northwind;
GO

-- UNGROUPED

-- COUNT
-- optionally can alias the result set, as it will be unnamed by default
SELECT COUNT(*) AS TotalProducts
FROM Products;

-- use a WHERE clause
SELECT COUNT(*) AS Products$20up
FROM Products
WHERE UnitPrice > 20;

-- SUM
SELECT SUM(UnitsInStock) AS TotalProductUnits
FROM [Products];

-- AVG
SELECT AVG(UnitPrice) AS AvgPrice
FROM Products;

-- MIN
SELECT MIN(UnitPrice) AS MinPrice
FROM Products;

SELECT MIN(UnitPrice) AS MinOver$20
FROM Products
WHERE UnitPrice > 20;

-- MAX
SELECT MAX(UnitPrice) AS MaxPrice
FROM Products;

SELECT Max(UnitPrice) AS MaxUnder$50
FROM Products
WHERE UnitPrice < 50;

-- GROUPING + FILTERING

-- Product Count by Category
SELECT COUNT(*) AS NumProducts, CategoryName
FROM Products P
         JOIN Categories C ON C.CategoryID = P.CategoryID
GROUP BY CategoryName;

-- Sum of Customer Orders by Country from Most to Least in 1996
SELECT SUM(OD.UnitPrice * OD.Quantity) AS Total, Country
FROM Orders O
         JOIN [Order Details] OD ON O.OrderID = OD.OrderID
         JOIN Customers C ON C.CustomerID = O.CustomerID
WHERE OrderDate BETWEEN '1/1/1996' AND '12/31/1996'
GROUP BY Country
ORDER BY Total DESC;

-- HAVING can be used to filter aggregate result sets
-- Employees and Total sales over $200k
SELECT E.FirstName, E.LastName, SUM(OD.UnitPrice * OD.Quantity) AS TotalSales
FROM Orders O
         JOIN [Order Details] OD ON O.OrderID = OD.OrderID
         JOIN Employees E ON E.EmployeeID = O.EmployeeID
GROUP BY FirstName, LastName
HAVING SUM(UnitPrice * Quantity) > 200000
ORDER BY TotalSales DESC;

-- Multiple aggregates
SELECT Country,
       SUM(OD.UnitPrice * OD.Quantity)   AS TotalSales,
       MIN(OD.UnitPrice * OD.Quantity)   AS SmallestOrder,
       MAX(OD.UnitPrice * OD.Quantity)   AS LargestOrder,
       AVG(OD.UnitPrice * OD.Quantity)   AS AvgOrder,
       COUNT(OD.UnitPrice * OD.Quantity) AS TotalOrders
FROM Orders O
         JOIN [Order Details] OD ON O.OrderID = OD.OrderID
         JOIN Customers C ON C.CustomerID = O.CustomerID
GROUP BY Country
ORDER BY TotalSales DESC;

-- Find Unique Values
SELECT DISTINCT (Country)
FROM Customers
ORDER BY Country;