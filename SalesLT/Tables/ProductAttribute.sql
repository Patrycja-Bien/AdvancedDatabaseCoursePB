CREATE TABLE [SalesLT].[ProductAttribute] (
    [ProductAttributeID] INT                                             IDENTITY (1, 1) NOT NULL,
    [ProductID]          INT                                             NOT NULL,
    [Attributes]         XML(CONTENT [SalesLT].[ProductAttributeSchema]) NULL,
    PRIMARY KEY CLUSTERED ([ProductAttributeID] ASC),
    CONSTRAINT [FK_Product_ProductAttribute] FOREIGN KEY ([ProductID]) REFERENCES [SalesLT].[Product] ([ProductID])
);

