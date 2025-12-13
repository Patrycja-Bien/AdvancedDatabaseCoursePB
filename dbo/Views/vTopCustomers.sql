CREATE VIEW dbo.vTopCustomers
AS
SELECT TOP 10
    c.CustomerID,
    c.Name,
    SUM(o.TotalAmount) AS TotalSpent
FROM Customers AS c
INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY SUM(o.TotalAmount) DESC;