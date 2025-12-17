CREATE TABLE [dbo].[GamePlatformSalesWide] (
    [Title]     NVARCHAR (100) NOT NULL,
    [PCUnits]   INT            NULL,
    [PS5Units]  INT            NULL,
    [XboxUnits] INT            NULL,
    PRIMARY KEY CLUSTERED ([Title] ASC)
);

