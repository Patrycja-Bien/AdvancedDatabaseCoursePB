CREATE TABLE [dbo].[PlayerStatsDaily] (
    [StatID]      INT  IDENTITY (1, 1) NOT NULL,
    [PlayerID]    INT  NOT NULL,
    [GameID]      INT  NOT NULL,
    [StatDate]    DATE NOT NULL,
    [Matches]     INT  NOT NULL,
    [Points]      INT  NOT NULL,
    [PlayMinutes] INT  NOT NULL,
    PRIMARY KEY CLUSTERED ([StatID] ASC),
    FOREIGN KEY ([GameID]) REFERENCES [dbo].[Game] ([GameID]),
    FOREIGN KEY ([PlayerID]) REFERENCES [dbo].[Player] ([PlayerID])
);

