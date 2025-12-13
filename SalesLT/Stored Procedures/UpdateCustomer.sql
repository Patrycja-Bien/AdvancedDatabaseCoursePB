CREATE   PROCEDURE SalesLT.UpdateCustomer
    @CustomerId INT,
    @Email      NVARCHAR(256) = NULL,
    @FirstName  NVARCHAR(100) = NULL,
    @LastName   NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM SalesLT.Customer WHERE CustomerId = @CustomerId)
        THROW 50002, N'Klient o tym identyfikatorze nie istnieje.', 1;

    UPDATE SalesLT.Customer
    SET EmailAddress = COALESCE(@Email, EmailAddress),
        FirstName    = COALESCE(@FirstName, FirstName),
        LastName     = COALESCE(@LastName, LastName)
    WHERE CustomerId = @CustomerId;
END