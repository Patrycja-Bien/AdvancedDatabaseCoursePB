CREATE VIEW dbo.vProductPriceComparison
AS
SELECT 
    p.ProductID,
    p.[Name] AS [Name],
    p.ListPrice AS CurrentPrice
FROM SalesLT.Product AS p;