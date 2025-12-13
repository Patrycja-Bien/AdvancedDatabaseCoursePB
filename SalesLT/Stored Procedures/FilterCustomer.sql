CREATE   PROCEDURE SalesLT.FilterCustomer
    @Id        INT = NULL,
    @FirstName VARCHAR(50) = NULL,
    @LastName  P9_surname = NULL,       
    @Email     VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        CustomerId, 
        FirstName, 
        LastName, 
        EmailAddress
    FROM SalesLT.Customer
    WHERE 
        (@Id IS NULL OR CustomerId = @Id)
        AND (@FirstName IS NULL OR FirstName = @FirstName)
        AND (@LastName IS NULL OR LastName = @LastName)
        AND (@Email IS NULL OR EmailAddress LIKE '%' + @Email + '%');
END;