
/* DDL trigger na poziomie bazy */
CREATE   TRIGGER trg_DB_DDL_TableAudit
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @x XML = EVENTDATA();

    INSERT dbo.DatabaseAuditLog
        (EventType, ObjectSchema, ObjectName, CommandText,
         HostName, AppName, LoginName, UserName)
    SELECT
        @x.value('(/EVENT_INSTANCE/EventType)[1]', 'SYSNAME'),
        @x.value('(/EVENT_INSTANCE/SchemaName)[1]', 'SYSNAME'),
        @x.value('(/EVENT_INSTANCE/ObjectName)[1]', 'SYSNAME'),
        @x.value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'NVARCHAR(MAX)'),
        HOST_NAME(),
        APP_NAME(),
        ORIGINAL_LOGIN(),
        SUSER_SNAME();
END