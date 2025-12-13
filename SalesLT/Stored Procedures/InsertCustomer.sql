
CREATE   PROCEDURE SalesLT.InsertCustomer
@FirstName VARCHAR(50),
@LastName P9_surname,
@PassHash VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    IF SalesLT.CustomerExists(@FirstName, @LastName) = 1
    BEGIN
        THROW 50001, 'Klient o podanych danych już istnieje.', 1;
        RETURN;
    END;

    INSERT INTO SalesLT.Customer (FirstName, LastName, PasswordHash, PasswordSalt)
    VALUES (@FirstName, @LastName, @PassHash, SUBSTRING(@PassHash, 1, 5))
END;

EXEC SalesLT.InsertCustomer 'Saul', 'Goodman', 'BetterCaulSaul';