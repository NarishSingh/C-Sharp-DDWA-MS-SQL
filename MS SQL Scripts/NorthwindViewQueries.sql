USE Northwind;
GO

CREATE VIEW ProductsAndCategories AS
SELECT P.ProductID, P.ProductName, C.CategoryName, S.CompanyName
FROM Products P
         JOIN Categories C ON C.CategoryID = P.CategoryID
         JOIN Suppliers S ON P.SupplierID = S.SupplierID;
GO

SELECT *
FROM ProductsAndCategories;