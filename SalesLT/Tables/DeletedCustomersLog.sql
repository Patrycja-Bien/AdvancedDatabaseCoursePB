CREATE TABLE [SalesLT].[DeletedCustomersLog] (
    [DeletedCustomersLogID] INT           IDENTITY (1, 1) NOT NULL,
    [CustomerID]            INT           NOT NULL,
    [FirstName]             NVARCHAR (50) NULL,
    [LastName]              NVARCHAR (50) NULL,
    [Email]                 NVARCHAR (50) NULL,
    [DeletedAt]             DATETIME2 (7) DEFAULT (sysdatetime()) NOT NULL,
    [DeletedBy]             [sysname]     DEFAULT (suser_sname()) NOT NULL,
    PRIMARY KEY CLUSTERED ([DeletedCustomersLogID] ASC)
);

