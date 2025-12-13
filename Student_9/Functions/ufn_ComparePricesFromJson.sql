CREATE FUNCTION Student_9.ufn_ComparePricesFromJson
(
    @ProductsJson NVARCHAR(MAX)
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        j.ProductID,
        p.[Name] AS ProductName,
        c.[Name] AS CategoryName,
        j.NewPrice,
        p.ListPrice AS CurrentPrice,
        Student_9.ufn_IsPriceHigherThanCurrent(
            CONCAT('{ "ProductID": ', j.ProductID, ', "NewPrice": ', j.NewPrice, ' }')
        ) AS IsHigher,
        (j.NewPrice - p.ListPrice) AS PriceDifference,
        CASE 
            WHEN p.ListPrice > 0 THEN ((j.NewPrice - p.ListPrice) / p.ListPrice) * 100
            ELSE NULL
        END AS PriceDifferencePercent
    FROM OPENJSON(@ProductsJson)
    WITH (
        ProductID INT '$.ProductID',
        NewPrice MONEY '$.NewPrice'
    ) AS j
    INNER JOIN SalesLT.Product AS p
    ON j.ProductID = p.ProductID
    INNER JOIN SalesLT.ProductCategory c
    ON p.ProductCategoryID = c.ProductCategoryID
);