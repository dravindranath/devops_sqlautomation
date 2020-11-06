CREATE TABLE [dbo].[Conf_ADFPipelineParams_Bkp] (
    [PipelineID]  INT             NULL,
    [ParamName]   NVARCHAR (50)   NULL,
    [ParamValue]  NVARCHAR (4000) NULL,
    [SeqNo]       INT             NULL,
    [EnabledFlg]  BIT             NULL,
    [CreatedBy]   NVARCHAR (50)   NULL,
    [CreatedDate] DATETIME        NULL,
    [UpdatedBy]   NVARCHAR (50)   NULL,
    [UpdatedDate] DATETIME        NULL,
    [DataDomain]  VARCHAR (100)   NULL
);

