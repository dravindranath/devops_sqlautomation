CREATE TABLE [dbo].[Conf_SAPtoSPARKDataTypeMapping] (
    [Mapping_ID]         INT            IDENTITY (1, 1) NOT NULL,
    [SAP_DataType]       VARCHAR (50)   NULL,
    [SPARK_DataType]     VARCHAR (50)   NULL,
    [ValidationFunction] VARCHAR (1000) NULL
);

