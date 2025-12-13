CREATE TABLE [SalesLT].[Students] (
    [StudentID] INT            IDENTITY (1, 1) NOT NULL,
    [FirstName] NVARCHAR (50)  NOT NULL,
    [LastName]  NVARCHAR (50)  NOT NULL,
    [BirthDate] DATE           NULL,
    [Email]     NVARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([StudentID] ASC)
);

