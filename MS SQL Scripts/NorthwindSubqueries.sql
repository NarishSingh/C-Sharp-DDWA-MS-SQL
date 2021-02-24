USE Northwind;
GO

-- list of orders for the 3 most expensive products
SELECT DISTINCT (O.OrderID), O.OrderDate, C.CompanyName
FROM Orders O
         JOIN Customers C ON C.CustomerID = O.CustomerID
         JOIN [Order Details] OD on O.OrderID = OD.OrderID
WHERE OD.ProductID IN
      (
          -- subquery the most expensive products
          SELECT TOP 3 ProductID
          FROM Products P
          ORDER BY P.UnitPrice DESC
      )
ORDER BY C.CompanyName, O.OrderID;

-- rewrite of 1st query ^ using a join to a subquery
SELECT DISTINCT (O.OrderID), O.OrderDate, C.CompanyName
FROM Orders O
         JOIN Customers C ON C.CustomerID = O.CustomerID
         JOIN [Order Details] OD on O.OrderID = OD.OrderID
         JOIN (SELECT TOP 3 P.ProductID
               FROM Products P
               ORDER BY P.UnitsInStock DESC) AS TopProducts
              ON OD.ProductID = TopProducts.ProductID
ORDER BY C.CompanyName, O.OrderID;

-- max order on each order
SELECT O.OrderID,
       O.OrderDate,
       (
           SELECT MAX(OD.UnitPrice)
           FROM [Order Details] OD
           WHERE O.OrderDate = OD.OrderID
       ) AS MaxUnitPrice
FROM Orders O;