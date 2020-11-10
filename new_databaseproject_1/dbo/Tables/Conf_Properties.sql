CREATE TABLE [dbo].[Conf_Properties] (
    [PropertyId]    INT            IDENTITY (1, 1) NOT NULL,
    [PropertyName]  VARCHAR (128)  NOT NULL,
    [PropertyValue] NVARCHAR (MAX) NOT NULL,
    [Description]   NVARCHAR (MAX) NULL,
    [ValidFrom]     DATETIME       CONSTRAINT [DF_Properties_ValidFrom] DEFAULT (getdate()) NOT NULL,
    [ValidTo]       DATETIME       NULL,
    [DataDomain]    VARCHAR (128)  NULL,
    [CheckedInGitStatus] NCHAR(10) NOT NULL, 
    CONSTRAINT [PK_Properties] PRIMARY KEY CLUSTERED ([PropertyId] ASC, [PropertyName] ASC)
);

