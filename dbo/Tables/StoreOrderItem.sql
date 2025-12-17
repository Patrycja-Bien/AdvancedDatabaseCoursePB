CREATE TABLE [dbo].[StoreOrderItem] (
    [OrderItemID] INT             IDENTITY (1, 1) NOT NULL,
    [OrderID]     INT             NOT NULL,
    [GameID]      INT             NOT NULL,
    [Qty]         INT             NOT NULL,
    [UnitPrice]   DECIMAL (10, 2) NOT NULL,
    [DiscountPct] DECIMAL (4, 2)  DEFAULT ((0.00)) NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderItemID] ASC),
    FOREIGN KEY ([GameID]) REFERENCES [dbo].[Game] ([GameID]),
    FOREIGN KEY ([OrderID]) REFERENCES [dbo].[StoreOrder] ([OrderID])
);

