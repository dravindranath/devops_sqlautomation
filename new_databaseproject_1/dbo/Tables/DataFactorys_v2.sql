CREATE TABLE [dbo].[DataFactorys_v2] (
    [DataFactoryId]     INT            IDENTITY (1, 1) NOT NULL,
    [DataFactoryName]   NVARCHAR (200) NOT NULL,
    [ResourceGroupName] NVARCHAR (200) NOT NULL,
    [Description]       NVARCHAR (MAX) NULL
);

