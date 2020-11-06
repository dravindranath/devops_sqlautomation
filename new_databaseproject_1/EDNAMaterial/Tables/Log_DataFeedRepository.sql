CREATE TABLE [EDNAMaterial].[Log_DataFeedRepository] (
    [File_Name]     NVARCHAR (MAX) NOT NULL,
    [Source]        NVARCHAR (MAX) NOT NULL,
    [Status_Flag]   INT            NOT NULL,
    [Start_Time]    DATETIME       NOT NULL,
    [End_Time]      DATETIME       NOT NULL,
    [Entity]        NVARCHAR (MAX) NOT NULL,
    [File_Time]     DATETIME       NOT NULL,
    [Loaded_By]     NVARCHAR (MAX) NOT NULL,
    [Loaded_Time]   DATETIME       NOT NULL,
    [Updated_By]    NVARCHAR (MAX) NOT NULL,
    [Updated_Time]  DATETIME       NOT NULL,
    [Zone_FilePath] NVARCHAR (MAX) NOT NULL,
    [DataDomain]    NVARCHAR (MAX) NOT NULL
);

