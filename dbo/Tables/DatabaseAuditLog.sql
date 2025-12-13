CREATE TABLE [dbo].[DatabaseAuditLog] (
    [AuditID]      INT            IDENTITY (1, 1) NOT NULL,
    [EventType]    [sysname]      NOT NULL,
    [ObjectSchema] [sysname]      NULL,
    [ObjectName]   [sysname]      NULL,
    [CommandText]  NVARCHAR (MAX) NULL,
    [HostName]     [sysname]      NULL,
    [AppName]      NVARCHAR (128) NULL,
    [LoginName]    [sysname]      NULL,
    [UserName]     [sysname]      NULL,
    [EventTime]    DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([AuditID] ASC)
);

