CREATE VIEW SalesLT.vwProductUpdate
AS
SELECT ProductID, Name, ProductNumber, Color, StandardCost, ListPrice, Size, Weight,
       ProductCategoryID, ProductModelID, SellStartDate, SellEndDate, DiscontinuedDate,
       rowguid, ModifiedDate
FROM SalesLT.Product;