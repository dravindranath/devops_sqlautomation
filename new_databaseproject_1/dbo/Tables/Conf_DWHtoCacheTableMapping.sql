CREATE TABLE [dbo].[Conf_DWHtoCacheTableMapping] (
    [ID]                    INT            IDENTITY (1, 1) NOT NULL,
    [FeedName]              NVARCHAR (100) NULL,
    [SourceSchemaName]      NVARCHAR (100) NULL,
    [SourceObjectName]      NVARCHAR (MAX) NULL,
    [DestinationSchemaName] NVARCHAR (100) NULL,
    [DestinationObjectName] NVARCHAR (MAX) NULL,
    [CreatedBy]             NVARCHAR (50)  NULL,
    [ActiveFlg]             INT            NULL,
    [CreatedDate]           DATETIME       NULL,
    [ModifiedBy]            NVARCHAR (50)  NULL,
    [ModifiedDate]          DATETIME       NULL,
    [DataDomain]            NVARCHAR (100) NULL
);

