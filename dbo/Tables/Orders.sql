CREATE TABLE [dbo].[Orders] (
    [OrderId]     INT             NOT NULL,
    [CustomerID]  INT             NULL,
    [TotalAmount] DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([OrderId] ASC),
    FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerId])
);

