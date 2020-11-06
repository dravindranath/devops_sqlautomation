CREATE TABLE [EDNAWorkforce].[Workforce_Data_Log] (
    [File_Name]           VARCHAR (50)  NULL,
    [File_insertedDate]   DATETIME      NULL,
    [File_Process_Status] VARCHAR (100) NULL,
    [Pipeline_run_id]     VARCHAR (100) NULL,
    [Pipeline_name]       VARCHAR (100) NULL,
    [Pipeline_starttime]  DATETIME      NULL,
    [Pipeline_endtime]    DATETIME      NULL,
    [File_source]         VARCHAR (100) NULL,
    [comment]             VARCHAR (500) NULL,
    [File_processed]      VARCHAR (100) NULL
);

