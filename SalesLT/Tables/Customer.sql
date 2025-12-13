CREATE TABLE [SalesLT].[Customer] (
    [CustomerID]   INT                                                IDENTITY (1, 1) NOT NULL,
    [NameStyle]    [dbo].[NameStyle]                                  CONSTRAINT [DF_Customer_NameStyle] DEFAULT ((0)) NOT NULL,
    [Title]        NVARCHAR (8)                                       NULL,
    [FirstName]    [dbo].[Name]                                       NOT NULL,
    [MiddleName]   [dbo].[Name]                                       NULL,
    [LastName]     [dbo].[P9_surname]                                 NOT NULL,
    [Suffix]       NVARCHAR (10)                                      NULL,
    [CompanyName]  NVARCHAR (128)                                     NULL,
    [SalesPerson]  NVARCHAR (256)                                     NULL,
    [EmailAddress] NVARCHAR (50)                                      NULL,
    [Phone]        [dbo].[Phone]                                      NULL,
    [PasswordHash] VARCHAR (128)                                      NOT NULL,
    [PasswordSalt] VARCHAR (10)                                       NOT NULL,
    [rowguid]      UNIQUEIDENTIFIER                                   CONSTRAINT [DF_Customer_rowguid] DEFAULT (newid()) NOT NULL,
    [ModifiedDate] DATETIME                                           CONSTRAINT [DF_Customer_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    [SysStartTime] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN DEFAULT (sysutcdatetime()) NOT NULL,
    [SysEndTime]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) NOT NULL,
    CONSTRAINT [PK_Customer_CustomerID] PRIMARY KEY CLUSTERED ([CustomerID] ASC),
    CONSTRAINT [AK_Customer_rowguid] UNIQUE NONCLUSTERED ([rowguid] ASC),
    PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
);


GO
CREATE NONCLUSTERED INDEX [IX_Customer_EmailAddress]
    ON [SalesLT].[Customer]([EmailAddress] ASC);


GO

CREATE   TRIGGER SalesLT.trg_CustomerOnDelete
ON SalesLT.Customer
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO SalesLT.DeletedCustomersLog (CustomerID, FirstName, LastName, Email)
    SELECT d.CustomerID, d.FirstName, d.LastName, d.EmailAddress
    FROM DELETED d
    WHERE EXISTS (
        SELECT 1
        FROM SalesLT.SalesOrderHeader AS soh
        WHERE soh.CustomerID = d.CustomerID
    );

    WITH ToDrop AS (
        SELECT d.CustomerID
        FROM DELETED d
        WHERE NOT EXISTS (
            SELECT 1
            FROM SalesLT.SalesOrderHeader AS soh
            WHERE soh.CustomerID = d.CustomerID
        )
    )
    DELETE ca
    FROM I232039.CustomerAddress AS ca
    INNER JOIN ToDrop AS td ON td.CustomerID = ca.CustomerID;

    ;WITH ToDrop AS (
        SELECT d.CustomerID
        FROM DELETED d
        WHERE NOT EXISTS (
            SELECT 1
            FROM SalesLT.SalesOrderHeader AS soh
            WHERE soh.CustomerID = d.CustomerID
        )
    )
    DELETE c
    FROM SalesLT.Customer AS c
    INNER JOIN ToDrop AS td ON td.CustomerID = c.CustomerID;
END