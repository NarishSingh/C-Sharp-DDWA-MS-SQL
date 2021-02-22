USE Northwind;
GO

-- INNER JOIN
SELECT ProductID, P.CategoryId, CategoryName, ProductName, UnitsInStock
FROM Products p
         JOIN Categories c ON P.CategoryID = c.CategoryID
WHERE P.CategoryID IN (2, 4)
  AND UnitsInStock > 0;

-- join on multiple tables
-- Order Details has a space in its name so it has to be encapsulated in [], don't do that when you make tables
SELECT OrderDate, ProductName, OD.UnitPrice, Quantity
FROM Orders
         JOIN [Order Details] OD ON Orders.OrderID = OD.OrderID
         JOIN Products P ON OD.ProductID = P.ProductID
WHERE CustomerID = 'AROUT';

-- OUTER JOINS
-- LEFT JOIN
SELECT CustomerID, OrderDate, LastName
FROM Orders O
         LEFT JOIN Employees E on E.EmployeeID = O.EmployeeID
WHERE OrderID BETWEEN 10248 AND 10255;

-- We can fix a null value by replacing it with something more informative
SELECT CustomerID, OrderDate, ISNULL(LastName, 'Online') AS LastName
FROM Orders O
         LEFT JOIN Employees E on E.EmployeeID = O.EmployeeID
WHERE OrderID BETWEEN 10248 AND 10255;