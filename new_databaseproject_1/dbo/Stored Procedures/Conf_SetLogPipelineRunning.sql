CREATE PROCEDURE dbo.Conf_SetLogPipelineRunning
	(
	@ExecutionId UNIQUEIDENTIFIER,
	@DataFactoryName varchar(50),
	@PipelineId INT
	)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE
		[dbo].[Conf_CurrentExecution]
	SET
		[StartDateTime] = GETUTCDATE(),
		[PipelineStatus] = 'Running'
	WHERE
		[LocalExecutionId] = @ExecutionId
		AND DataFactoryName = @DataFactoryName
		AND [PipelineId] = @PipelineId
END;