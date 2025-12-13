CREATE FUNCTION Student_9.ufn_ProductsJsonByCategory
(
    @CategoryName NVARCHAR(50)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @Result NVARCHAR(MAX);

    SELECT @Result = (
        SELECT 
            p.ProductID,
            p.Name AS ProductName,
            p.Color,
            p.Size,
            p.ListPrice,
            pc.Name AS CategoryName
        FROM SalesLT.Product AS p
        INNER JOIN SalesLT.ProductCategory AS pc
            ON p.ProductCategoryID = pc.ProductCategoryID
        WHERE pc.Name LIKE '%' + @CategoryName + '%'
        FOR JSON AUTO
    );

    RETURN @Result;
END;