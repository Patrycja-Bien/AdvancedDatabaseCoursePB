CREATE   FUNCTION SalesLT.CustomerExists
(
    @FirstName VARCHAR(50),
    @LastName  P9_surname
)
RETURNS BIT
AS
BEGIN
    DECLARE @Exists BIT = 0;

    IF EXISTS (
        SELECT 1
        FROM SalesLT.Customer
        WHERE FirstName = @FirstName
          AND LastName  = @LastName
    )
        SET @Exists = 1;

    RETURN @Exists;
END;