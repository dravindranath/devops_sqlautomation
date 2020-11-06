
CREATE PROCEDURE [dbo].[Conf_CreateNewExecution]
	(
	@DataFactoryName NVARCHAR(200)
	)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @LocalExecutionId UNIQUEIDENTIFIER = NEWID()

	TRUNCATE TABLE [dbo].[Conf_CurrentExecution];

	INSERT INTO [dbo].[Conf_CurrentExecution]
		(
		[LocalExecutionId],
		[PipelineId],
		[DataFactoryName],
		[ResourceGroupName],
		[PipelineName]
		)
	SELECT
		@LocalExecutionId,
		p.[PipelineId],
		d.[DataFactoryName],
		d.[ResourceGroupName],
		p.[PipelineName]
	FROM
		[dbo].[Conf_ADFPipelineMetadata_Test] p
				INNER JOIN [dbo].[Conf_DataFactorys] d
			ON p.[DataFactoryId] = d.[DataFactoryId]
	WHERE
		p.[EnabledFlg]= 1
		and d.[DataFactoryName]=@DataFactoryName
		

	SELECT
		@LocalExecutionId AS ExecutionId
END;
