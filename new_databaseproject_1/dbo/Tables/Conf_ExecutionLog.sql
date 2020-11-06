CREATE TABLE [dbo].[Conf_ExecutionLog] (
    [LogId]              INT              IDENTITY (1, 1) NOT NULL,
    [LocalExecutionId]   UNIQUEIDENTIFIER NOT NULL,
    [PipelineId]         INT              NOT NULL,
    [DataFactoryName]    NVARCHAR (200)   DEFAULT ('Unknown') NOT NULL,
    [ResourceGroupName]  NVARCHAR (200)   DEFAULT ('Unknown') NOT NULL,
    [PipelineName]       NVARCHAR (200)   NOT NULL,
    [StartDateTime]      DATETIME         NULL,
    [PipelineStatus]     NVARCHAR (200)   NULL,
    [EndDateTime]        DATETIME         NULL,
    [AdfPipelineRunId]   NVARCHAR (500)   NULL,
    [PipelineParamsUsed] NVARCHAR (MAX)   DEFAULT ('None') NULL,
    CONSTRAINT [PK_ExecutionLog] PRIMARY KEY CLUSTERED ([LogId] ASC)
);

