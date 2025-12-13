CREATE   PROCEDURE Student_9.CalculatePrice
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        tp.ProductID,
        tp.Name,
        tp.ListPrice,
        ModifiedPrice = tp.ListPrice - (tp.ListPrice * 0.09),
        tp.TotalQty,
        tp.TotalLines
    FROM #TopProducts AS tp
    WHERE tp.ListPrice IS NOT NULL;
END;