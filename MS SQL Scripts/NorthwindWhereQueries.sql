USE Northwind;
GO

SELECT *
FROM Customers
WHERE Country = 'USA';

-- Not equals is != or <>
SELECT *
FROM Customers
WHERE Country <> 'USA';

-- AND to get list of values
SELECT *
FROM Customers
WHERE Country = 'USA'
  AND Region = 'OR';

-- NOT IN gets list sans these
SELECT *
FROM Customers
WHERE Country NOT IN ('USA', 'UK');

SELECT *
FROM Products
WHERE UnitsInStock > 10;

-- BETWEEN to check col value in an inclusive range
SELECT *
FROM Products
WHERE UnitPrice BETWEEN 10 AND 13;

-- Pattern Matching

-- Starts with A
SELECT *
FROM Suppliers
WHERE CompanyName LIKE 'A%';

-- has Z in entry
SELECT *
FROM Suppliers
WHERE CompanyName LIKE '%Z%';

-- Second letter is 'a'
SELECT *
FROM Suppliers
WHERE CompanyName LIKE '_A%';

-- first char is A OR B
SELECT *
FROM Suppliers
WHERE CompanyName LIKE '[AB]%';

-- first char is inclusive range of A-K
SELECT *
FROM Suppliers
WHERE CompanyName LIKE '[A-K]%';

-- first char A, second char not N
SELECT *
FROM Suppliers
WHERE CompanyName LIKE 'A[^N]%';

-- first char a, second char not inclusive range of n-k
SELECT *
FROM Suppliers
WHERE CompanyName LIKE 'A[^N-K]%';