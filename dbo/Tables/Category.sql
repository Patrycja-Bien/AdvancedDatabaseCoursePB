CREATE TABLE [dbo].[Category] (
    [CategoryID]  INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (100) NOT NULL,
    [Description] NVARCHAR (300) NULL,
    [IsActive]    BIT            CONSTRAINT [DF_Category_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedAt]   DATETIME2 (0)  CONSTRAINT [DF_Category_CreatedAt] DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([CategoryID] ASC),
    UNIQUE NONCLUSTERED ([Name] ASC)
);

