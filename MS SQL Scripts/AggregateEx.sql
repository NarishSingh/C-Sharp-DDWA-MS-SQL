USE Northwind;
GO

-- Find the average freight paid for orders placed by companies in the USA
SELECT AVG(O.Freight) AS FreightAvg
FROM Orders O
WHERE O.ShipCountry = 'USA';

-- Find the gross total (sum of quantity * unit price) for all orders placed by B's Beverages and Chop-suey Chinese.
SELECT C.CompanyName, SUM(OD.Quantity * OD.UnitPrice) AS GrossTotal
FROM Orders O
         JOIN [Order Details] OD ON O.OrderID = OD.OrderID
         JOIN Customers C on C.CustomerID = O.CustomerID
WHERE C.CompanyName = 'B''s Beverages'
   OR C.CompanyName = 'Chop-suey Chinese'
GROUP BY C.CompanyName;

-- Find the gross total of all orders (sum of quantity * unit price) for each customer, order it in descending order by the total.
SELECT C.CompanyName, SUM(OD.Quantity * OD.UnitPrice) AS GrossTotal
FROM Orders O
         JOIN [Order Details] OD ON O.OrderID = OD.OrderID
         JOIN Customers C on C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.CompanyName
ORDER BY GrossTotal DESC;

-- Get the count of how many employees work for the company
SELECT COUNT(*) AS TotalEmployees
FROM Employees;

-- Get the count of how many employees report to someone else in the company without using a WHERE clause.
SELECT COUNT(*) AS Managed
FROM Employees AS E1
         JOIN Employees AS E2 ON E1.EmployeeID = E2.ReportsTo;

-- Get the count of how many unique countries are represented by our suppliers.
SELECT COUNT(DISTINCT (S.Country)) AS CountryCount
FROM Suppliers S;

-- Find the total sales by supplier ordered from most to least.
SELECT SUM(OD.Quantity * OD.UnitPrice) AS TotalSales, S.CompanyName
FROM [Order Details] OD
         JOIN Products P on OD.ProductID = P.ProductID
         JOIN Suppliers S on P.SupplierID = S.SupplierID
GROUP BY S.CompanyName
ORDER BY TotalSales DESC;

-- Show the number of orders placed by customers from fewest to most provided the customer has a minimum of 4 orders.
SELECT COUNT(OrderID) AS OrderTotal, C.CompanyName
FROM Customers C
         JOIN Orders O on C.CustomerID = O.CustomerID
GROUP BY C.CompanyName
HAVING COUNT(OrderID) >= 4
ORDER BY OrderTotal;

/*
	Challenge: 
	Show the total amount of orders by year and country.  Data should be ordered by year ascending and total descending.

	TotalSales    Year     Country
	41907.80      1996     USA
	37804.60      1996     Germany
	etc...
	
	Hint: Research the DatePart() function
 */
SELECT SUM(OD.Quantity * OD.UnitPrice) AS TotalSales, DATEPART(yyyy, O.OrderDate) AS Year, C.Country
FROM Orders O
         JOIN [Order Details] OD on O.OrderID = OD.OrderID
         JOIN Customers C on C.CustomerID = O.CustomerID
GROUP BY C.Country, DATEPART(yyyy, O.OrderDate)
ORDER BY Year, TotalSales DESC;