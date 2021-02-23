USE Northwind;
GO

SELECT CategoryName, ProductName, UnitPrice, UnitsInStock
FROM Categories C
         JOIN Products P ON C.CategoryID = P.CategoryID
ORDER BY CategoryName;

-- multiple ordering
SELECT CategoryName, ProductName, UnitPrice, UnitsInStock
FROM Categories C
         JOIN Products P ON C.CategoryID = P.CategoryID
ORDER BY CategoryName, ProductName;

-- reverse order
SELECT CategoryName, ProductName, UnitPrice, UnitsInStock
FROM Categories C
         JOIN Products P ON C.CategoryID = P.CategoryID
ORDER BY CategoryName DESC, UnitPrice DESC;

-- only one col reverse
SELECT CategoryName, ProductName, UnitPrice, UnitsInStock
FROM Categories C
         JOIN Products P ON C.CategoryID = P.CategoryID
ORDER BY CategoryName ASC, UnitPrice DESC;

-- OFFSET FETCH
-- 1st 5 rows
SELECT CategoryName, ProductName, UnitPrice, UnitsInStock
FROM Categories C
         JOIN Products P ON C.CategoryID = P.CategoryID
WHERE CategoryName = 'Confections'
ORDER BY UnitPrice DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- The next 5
SELECT CategoryName, ProductName, UnitPrice, UnitsInStock
FROM Categories C
         JOIN Products P ON C.CategoryID = P.CategoryID
WHERE CategoryName = 'Confections'
ORDER BY UnitPrice DESC
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;