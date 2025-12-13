-- Zadanie 3
-- =============================================

CREATE   FUNCTION SalesLT.GetCustomerOrderHistory_TVF
(
    @CustomerId INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        p.Name           AS Product,
        o.OrderDate      AS OrderDate,
        od.OrderQty      AS Quantity,    
        od.UnitPrice * od.OrderQty AS TotalPrice
    FROM SalesOrderHeader AS o
    JOIN SalesOrderDetail AS od ON od.SalesOrderId = o.SalesOrderId
    JOIN Product AS p ON p.ProductId = od.ProductId
    WHERE o.CustomerID = @CustomerId
);