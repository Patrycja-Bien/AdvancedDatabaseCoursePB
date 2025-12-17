CREATE TABLE [dbo].[StoreOrder] (
    [OrderID]   INT           IDENTITY (1, 1) NOT NULL,
    [OrderDate] DATE          NOT NULL,
    [Region]    NVARCHAR (20) NOT NULL,
    [Platform]  NVARCHAR (10) NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderID] ASC)
);

