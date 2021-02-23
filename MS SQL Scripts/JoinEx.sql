USE Northwind;
GO

-- Get a list of each employee first name and lastname and the territory names they are associated with
SELECT E.FirstName, E.LastName, T.TerritoryDescription
FROM Employees E
         JOIN EmployeeTerritories ET ON ET.EmployeeID = E.EmployeeID
         JOIN Territories T ON ET.TerritoryID = T.TerritoryID;
-- 49 ROWS

-- 	Get the Company Name, Order Date, and each order detail’s Product name for USA customers only.
SELECT C.CompanyName, O.OrderDate, P.ProductName
FROM Orders O
         JOIN Customers C ON C.CustomerID = O.CustomerID
         JOIN [Order Details] OD ON O.OrderID = OD.OrderID
         JOIN Products P ON OD.ProductID = P.ProductID
WHERE C.Country = 'USA';
-- 352 ROWS

-- Get all the order information for any order where Chai was sold.
SELECT O.*
FROM Orders O
         JOIN [Order Details] OD ON O.OrderID = OD.OrderID
         JOIN Products P ON P.ProductID = OD.ProductID
WHERE P.ProductName = 'Chai';
-- 38 ROWS

USE SWCCorp;
GO

-- 	Write a query to show every combination of employee and location.
SELECT E.LastName + ', ' + E.FirstName AS EmployeeName, L.City
FROM Employee E
         CROSS JOIN [Location] L;
-- 48 ROWS

-- 	Find a list of all the Employees who have never found a Grant
SELECT *
FROM Employee E
         LEFT JOIN [Grant] G ON E.EmpID = G.EmpID
WHERE G.GrantID IS NULL;
-- 5 ROWS