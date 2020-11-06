CREATE TABLE [dbo].[StagetoCuratedColumnMapping_TBD] (
    [ID]                           VARCHAR (50)  NULL,
    [FeedName]                     VARCHAR (50)  NULL,
    [SourceColName]                VARCHAR (50)  NULL,
    [DestinationColName]           VARCHAR (100) NULL,
    [SourceName]                   VARCHAR (50)  NULL,
    [DestinationName]              VARCHAR (50)  NULL,
    [CreatedBy]                    VARCHAR (50)  NULL,
    [ActiveFlg]                    VARCHAR (50)  NULL,
    [CreatedDate]                  VARCHAR (50)  NULL,
    [ModifiedBy]                   VARCHAR (50)  NULL,
    [ModifiedDate]                 VARCHAR (50)  NULL,
    [IsPrimaryKey]                 VARCHAR (50)  NULL,
    [DestinationPartitionRootPath] VARCHAR (50)  NULL,
    [DataDomain]                   VARCHAR (50)  NULL,
    [StagingTableName]             VARCHAR (50)  NULL,
    [IsIncrementalLoad]            BIT           NULL
);

