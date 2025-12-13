CREATE FUNCTION dbo.ufn_GetCustomerOrderDetails(@CustomerId INT)
RETURNS @Result TABLE
(
    OrderId INT,
    CustomerName NVARCHAR(100),
    GameTitle NVARCHAR(200),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    LineTotal DECIMAL(10,2),
    OrderTotal DECIMAL(10,2)
)
AS
BEGIN
    INSERT INTO @Result
    SELECT 
        o.OrderId,
        c.Name AS CustomerName,
        g.Title AS GameTitle,
        od.Quantity,
        g.Price AS UnitPrice,
        (od.Quantity * g.Price) AS LineTotal,
        o.TotalAmount AS OrderTotal
    FROM Orders o
    INNER JOIN Customers c ON o.CustomerId = c.CustomerId
    INNER JOIN OrderDetails od ON o.OrderId = od.OrderId
    INNER JOIN Games g ON od.ProductId = g.ProductId
    WHERE o.CustomerId = @CustomerId;

    RETURN;
END;