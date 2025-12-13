CREATE TABLE [dbo].[Books] (
    [BookID] INT             NOT NULL,
    [Title]  NVARCHAR (200)  NULL,
    [Price]  DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([BookID] ASC)
);

