CREATE TABLE [dbo].[Log_CurrentADFExecution_WFDD] (
    [LocalExecutionId]       UNIQUEIDENTIFIER NULL,
    [PipelineId]             INT              NULL,
    [CallingDataFactoryName] NVARCHAR (200)   NULL,
    [PipelineName]           NVARCHAR (200)   NULL,
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

