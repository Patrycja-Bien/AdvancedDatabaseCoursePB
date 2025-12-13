CREATE TABLE [SalesLT].[ProductPriceBlockLog] (
    [BlockLogID]        INT             IDENTITY (1, 1) NOT NULL,
    [ProductID]         INT             NOT NULL,
    [OldPrice]          DECIMAL (19, 4) NULL,
    [AttemptedNewPrice] DECIMAL (19, 4) NULL,
    [PercentIncrease]   DECIMAL (9, 4)  NULL,
    [Reason]            NVARCHAR (200)  NULL,
    [AttemptedAt]       DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    [AttemptedBy]       [sysname]       DEFAULT (original_login()) NOT NULL,
    PRIMARY KEY CLUSTERED ([BlockLogID] ASC)
);

