USE Northwind;
GO

-- Select all of the rows and columns from the Products table
SELECT *
FROM Products;
-- 77 rows

-- Select all columns for the product with the name Queso Cabrales
SELECT *
FROM Products
WHERE ProductName = 'Queso Cabrales';
-- 1 row

-- Write a single query to display only the name and number of units in stock for the products Laughing Lumberjack Lager, Outback Lager, and Ravioli Angelo
SELECT ProductName, UnitsInStock
FROM Products
WHERE ProductName IN ('Laughing Lumberjack Lager', 'Outback Lager', 'Ravioli Angelo');
-- 3 rows

-- From the Orders table select all the order information for the customer with id of QUEDE
SELECT *
FROM Orders
WHERE CustomerID = 'QUEDE';
-- 9 rows

-- Select the orders whose freight is more than $100.00
SELECT *
FROM Orders
WHERE Freight > 100.00;
-- 187 rows

-- Select the orders shipping to the USA whose freight is between $10 and $20
SELECT *
FROM Orders
WHERE Freight BETWEEN 10 AND 20;
-- 91 rows

-- Select the Suppliers whose contact has a title that starts with the word Sales
SELECT *
FROM Suppliers
WHERE ContactTitle LIKE 'Sales%';
-- 11 rows