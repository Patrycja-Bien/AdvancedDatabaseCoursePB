CREATE PROCEDURE dbo.usp_GetPersonsList
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM SalesLT.ProductCategory
END;