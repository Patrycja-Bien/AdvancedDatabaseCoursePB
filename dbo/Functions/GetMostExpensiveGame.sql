CREATE FUNCTION dbo.GetMostExpensiveGame()
RETURNS NVARCHAR(200)
AS
BEGIN
    DECLARE @GameTitle NVARCHAR(200);

    SELECT TOP 1 @GameTitle = Title
    FROM Games
    ORDER BY Price DESC;

    RETURN @GameTitle;
END;