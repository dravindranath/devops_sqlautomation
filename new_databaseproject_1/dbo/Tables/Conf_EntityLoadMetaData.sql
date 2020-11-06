CREATE TABLE [dbo].[Conf_EntityLoadMetaData] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [LogicalZone]       NVARCHAR (50)  NULL,
    [SchemaName]        NVARCHAR (50)  NULL,
    [EntityName]        NVARCHAR (100) NULL,
    [LatestUpdatedDate] DATETIME       NULL,
    [CreatedBy]         NVARCHAR (50)  NULL,
    [CreatedDate]       DATETIME       NULL,
    [UpdatedBy]         NVARCHAR (50)  NULL,
    [UpdatedDate]       DATETIME       NULL
);

