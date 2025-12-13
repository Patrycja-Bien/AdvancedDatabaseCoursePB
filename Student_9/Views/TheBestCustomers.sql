CREATE VIEW Student_9.TheBestCustomers
AS
SELECT TOP 10
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.CompanyName,
    SUM(h.TotalDue) AS TotalOrderValue
FROM SalesLT.Customer AS c
INNER JOIN SalesLT.SalesOrderHeader AS h
    ON c.CustomerID = h.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.CompanyName
ORDER BY SUM(h.TotalDue) DESC;