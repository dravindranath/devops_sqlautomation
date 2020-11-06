CREATE TABLE [dbo].[Conf_StagetoCuratedColumnMapping_9_19_2020] (
    [ID]                           INT             IDENTITY (1, 1) NOT NULL,
    [FeedName]                     NVARCHAR (100)  NULL,
    [SourceColName]                NVARCHAR (100)  NULL,
    [DestinationColName]           NVARCHAR (100)  NULL,
    [SourceName]                   NVARCHAR (50)   NULL,
    [DestinationName]              NVARCHAR (50)   NULL,
    [CreatedBy]                    NVARCHAR (50)   NULL,
    [ActiveFlg]                    INT             NULL,
    [CreatedDate]                  DATETIME        NULL,
    [ModifiedBy]                   NVARCHAR (50)   NULL,
    [ModifiedDate]                 DATETIME        NULL,
    [IsPrimaryKey]                 VARCHAR (1)     NULL,
    [DestinationPartitionRootPath] NVARCHAR (2000) NULL,
    [DataDomain]                   NVARCHAR (100)  NULL,
    [StagingTableName]             NVARCHAR (200)  NULL
);

