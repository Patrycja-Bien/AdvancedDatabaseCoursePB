
CREATE   PROCEDURE Student_9.CalculatePrices
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        tp.ProductID,
        tp.Name,
        tp.ListPrice,
        ModifiedPrice = tp.ListPrice - (tp.ListPrice * 0.09)
    FROM #TopProducts AS tp
    WHERE tp.ListPrice IS NOT NULL;
END;