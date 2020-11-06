

CREATE PROCEDURE [dbo].[usp_UpdateExecutionLogSuccess]
	(
	@ExecutionId UNIQUEIDENTIFIER,
	@pipelinename [varchar](200)
	)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE
		[dbo].[Log_CurrentADFExecution_WFDD]
	SET
		[PipelineStatus] = 'Success',
		[EndDateTime] = GETUTCDATE(),
		Process_Flag=1,
		Comment = 'Pipeline Executed Successfully' 
	WHERE
		[LocalExecutionId] = @ExecutionId
		AND PipelineName = @pipelinename
		
END;


