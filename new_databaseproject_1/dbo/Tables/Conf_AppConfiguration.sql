CREATE TABLE [dbo].[Conf_AppConfiguration] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [ServiceLayer] NVARCHAR (50)  NULL,
    [ParamName]    NVARCHAR (50)  NULL,
    [ParamValue]   NVARCHAR (100) NULL,
    [ParamDesc]    NVARCHAR (200) NULL,
    [LogicalZone]  NVARCHAR (50)  NULL,
    [SourceSystem] NVARCHAR (50)  NULL,
    [EnabledFlg]   BIT            NULL,
    [CreatedBy]    NVARCHAR (50)  NULL,
    [CreatedDate]  DATETIME       NULL,
    [UpdatedBy]    NVARCHAR (50)  NULL,
    [UpdatedDate]  DATETIME       NULL,
    [DataDomain]   NVARCHAR (100) NULL
);

