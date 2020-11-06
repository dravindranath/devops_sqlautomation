




CREATE PROCEDURE [dbo].[usp_CreateExecutionLog]
	(
	@DataFactoryName NVARCHAR(200)
	--,@pipelinename NVARCHAR(200)
	)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @LocalExecutionId UNIQUEIDENTIFIER = NEWID()

	TRUNCATE TABLE [dbo].[Log_CurrentADFExecution_WFDD];
	INSERT INTO [dbo].[Log_CurrentADFExecution_WFDD]
		(
		 LocalExecutionId
		,PipelineId
		,CallingDataFactoryName
		,PipelineName
		,DataDomain
		)
	SELECT
		@LocalExecutionId
		,p.[PipelineId]
		,@DataFactoryName
		,p.PipelineName
		,p.DataDomain
	FROM
		[dbo].[Conf_ADFPipelineMetadata] p
				INNER JOIN [dbo].[Conf_DataFactorys] d
			ON p.[DataFactoryId] = d.[DataFactoryId]
	WHERE
		p.[EnabledFlg]= 1
		and d.[DataFactoryName]=@DataFactoryName
		--and p.PipelineName=@pipelinename
		

	SELECT
		@LocalExecutionId AS ExecutionId
END;
