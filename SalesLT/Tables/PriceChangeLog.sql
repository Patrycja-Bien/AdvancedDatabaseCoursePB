CREATE TABLE [SalesLT].[PriceChangeLog] (
    [LogID]     INT             IDENTITY (1, 1) NOT NULL,
    [ProductID] INT             NULL,
    [OldPrice]  DECIMAL (12, 2) NULL,
    [NewPrice]  DECIMAL (12, 2) NULL,
    [ChangedBy] [sysname]       DEFAULT (suser_sname()) NOT NULL,
    [ChangedAt] DATETIME2 (7)   DEFAULT (sysdatetime()) NULL,
    [Note]      NVARCHAR (200)  NULL,
    PRIMARY KEY CLUSTERED ([LogID] ASC)
);

