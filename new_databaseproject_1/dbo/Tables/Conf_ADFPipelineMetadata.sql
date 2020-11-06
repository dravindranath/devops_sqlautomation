CREATE TABLE [dbo].[Conf_ADFPipelineMetadata] (
    [PipelineID]            INT            NOT NULL,
    [DataFactoryId]         INT            NULL,
    [PipelineName]          NVARCHAR (50)  NULL,
    [LogicalZone]           NVARCHAR (50)  NULL,
    [SeqNo]                 INT            NULL,
    [PredecessorPipelineID] INT            NULL,
    [EnabledFlg]            BIT            NULL,
    [Lvl]                   INT            NULL,
    [CreatedBy]             NVARCHAR (50)  NULL,
    [CreatedDate]           DATETIME       NULL,
    [UpdatedBy]             NVARCHAR (50)  NULL,
    [UpdatedDate]           DATETIME       NULL,
    [DataDomain]            NVARCHAR (100) NULL,
    CONSTRAINT [FK_Pipelines_DFs] FOREIGN KEY ([DataFactoryId]) REFERENCES [dbo].[Conf_DataFactorys] ([DataFactoryId])
);

