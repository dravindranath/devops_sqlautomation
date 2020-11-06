
CREATE PROCEDURE [dbo].[usp_UpdateExecutionLogStarting]
	(
	@ExecutionId UNIQUEIDENTIFIER,
	@pipelinename [varchar](200),
	@pipelineRunId [varchar](200),
	@LoadDateTime datetime
	)
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE
		[dbo].[Log_CurrentADFExecution_WFDD]
	SET
		[PipelineStatus] = 'Running',
		StartDateTime=getdate(),
		AdfPipelineRunId=@pipelineRunId,
		Loaded_Time=@LoadDateTime
		
	WHERE
		[LocalExecutionId] = @ExecutionId
		AND PipelineName = @pipelinename
		AND [StartDateTime] IS NULL
	
END;

