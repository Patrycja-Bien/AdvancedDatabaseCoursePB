CREATE TABLE [dbo].[Game] (
    [GameID] INT            IDENTITY (1, 1) NOT NULL,
    [Title]  NVARCHAR (100) NOT NULL,
    [Genre]  NVARCHAR (50)  NOT NULL,
    PRIMARY KEY CLUSTERED ([GameID] ASC)
);

