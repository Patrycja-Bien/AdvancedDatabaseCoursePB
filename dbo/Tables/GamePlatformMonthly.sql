CREATE TABLE [dbo].[GamePlatformMonthly] (
    [Title]    NVARCHAR (100) NOT NULL,
    [Year]     INT            NOT NULL,
    [Month]    NVARCHAR (3)   NOT NULL,
    [Platform] NVARCHAR (10)  NOT NULL,
    [Units]    INT            NOT NULL
);

