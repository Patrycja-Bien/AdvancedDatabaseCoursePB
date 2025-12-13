CREATE FUNCTION dbo.ufn_GetGamesAbovePrice(@MinPrice DECIMAL(10,2))
RETURNS TABLE
AS
RETURN
(
    SELECT ProductId, Title, Price
    FROM Games
    WHERE Price > @MinPrice
);