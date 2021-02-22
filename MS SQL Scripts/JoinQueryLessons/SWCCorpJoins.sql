USE SWCCorp;
GO

-- OUTER JOINS, CON'T
-- RIGHT JOIN
SELECT City, LastName
FROM Employee E
         RIGHT JOIN [Location] L on L.LocationID = E.LocationID;

-- LEFT JOIN
SELECT City, LastName
FROM Employee E
         LEFT JOIN [Location] L on L.LocationID = E.LocationID;

-- FULL JOIN
SELECT City, LastName
FROM Employee E
         FULL JOIN [Location] L on L.LocationID = E.LocationID;

-- check only unmatched entries
SELECT FirstName, LastName
FROM Employee E
         LEFT JOIN [Grant] G on E.EmpID = G.EmpID
WHERE G.EmpID IS NULL;

-- SELF JOINS
-- won't work, can't distinguish the names to display query results
SELECT FirstName, LastName, FirstName, LastName
FROM Employee Employee
         INNER JOIN Employee ON Employee.ManagerID = Employee.EmpID;

-- ALIAS to solve issue
SELECT E1.FirstName, E1.LastName, E2.LastName + ', ' + E2.FirstName AS ManagerName
FROM Employee AS E1
         INNER JOIN Employee AS E2 ON E1.ManagerID = E2.EmpID;

-- CROSS JOIN
SELECT E.FirstName, E.LastName, m.ClassName
FROM Employee E
         CROSS JOIN MgmtTraining M
WHERE E.EmpID = 1;

