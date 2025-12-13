CREATE FUNCTION Student_9.ufn_IsPriceHigherThanCurrent
(
    @ProductJson NVARCHAR(MAX)
)
RETURNS BIT
AS
BEGIN
    DECLARE @ProductID INT;
    DECLARE @NewPrice MONEY;
    DECLARE @CurrentPrice MONEY;
    DECLARE @Result BIT;
    SELECT 
        @ProductID = ProductID,
        @NewPrice = NewPrice
    FROM OPENJSON(@ProductJson)
    WITH (
        ProductID INT '$.ProductID',
        NewPrice MONEY '$.NewPrice'
    );
    SELECT @CurrentPrice = ListPrice
    FROM SalesLT.Product
    WHERE ProductID = @ProductID;

    IF @NewPrice > @CurrentPrice
        SET @Result = 1; 
    ELSE
        SET @Result = 0;

    RETURN @Result;
END;