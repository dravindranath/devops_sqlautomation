CREATE TABLE [dbo].[Conf_EmailRecipients] (
    [RecipientId]       INT            IDENTITY (1, 1) NOT NULL,
    [DomainName]        VARCHAR (255)  NULL,
    [EmailAddress]      NVARCHAR (500) NOT NULL,
    [MessagePreference] CHAR (3)       NOT NULL,
    [Enabled]           BIT            NOT NULL
);

