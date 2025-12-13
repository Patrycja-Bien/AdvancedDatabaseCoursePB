CREATE TABLE [dbo].[Games] (
    [GameID]      INT             IDENTITY (1, 1) NOT NULL,
    [CategoryID]  INT             NOT NULL,
    [Title]       NVARCHAR (200)  NOT NULL,
    [ReleaseDate] DATE            NULL,
    [Price]       DECIMAL (10, 2) NULL,
    [CreatedAt]   DATETIME2 (0)   CONSTRAINT [DF_Games_CreatedAt] DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([GameID] ASC),
    CONSTRAINT [FK_Games_Category] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Category] ([CategoryID])
);

