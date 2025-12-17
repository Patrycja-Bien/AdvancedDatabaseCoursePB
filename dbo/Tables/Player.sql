CREATE TABLE [dbo].[Player] (
    [PlayerID] INT           IDENTITY (1, 1) NOT NULL,
    [Nick]     NVARCHAR (50) NOT NULL,
    [Country]  NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([PlayerID] ASC)
);

