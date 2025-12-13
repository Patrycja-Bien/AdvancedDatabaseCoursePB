CREATE FUNCTION dbo.ufn_GetDiscountedGames(@DiscountRate DECIMAL(4,2))
RETURNS @Result TABLE
(
    ProductId INT,
    Title NVARCHAR(200),
    OriginalPrice DECIMAL(10,2),
    DiscountedPrice DECIMAL(10,2)
)
AS
BEGIN
    INSERT INTO @Result
    SELECT 
        ProductId,
        Title,
        Price AS OriginalPrice,
        Price - (Price * @DiscountRate) AS DiscountedPrice
    FROM Games;

    RETURN;
END;