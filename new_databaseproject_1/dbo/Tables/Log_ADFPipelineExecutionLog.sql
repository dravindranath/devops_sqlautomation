CREATE TABLE [dbo].[Log_ADFPipelineExecutionLog] (
    [LogId]                  INT              IDENTITY (1, 1) NOT NULL,
    [LocalExecutionId]       UNIQUEIDENTIFIER NOT NULL,
    [PipelineId]             INT              NOT NULL,
    [CallingDataFactoryName] NVARCHAR (200)   NOT NULL,
    [PipelineName]           NVARCHAR (200)   NOT NULL,
    [StartDateTime]          DATETIME         NULL,
    [PipelineStatus]         NVARCHAR (200)   NULL,
    [EndDateTime]            DATETIME         NULL,
    [AdfPipelineRunId]       UNIQUEIDENTIFIER NULL,
    [Loaded_By]              NVARCHAR (50)    NULL,
    [Loaded_Time]            DATETIME         NULL,
    [Updated_By]             NVARCHAR (50)    NULL,
    [Updated_Time]           DATETIME         NULL,
    [DataDomain]             NVARCHAR (100)   NULL,
    [Process_Flag]           BIT              NULL,
    [Comment]                NVARCHAR (MAX)   NULL
);

