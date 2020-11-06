



CREATE PROCEDURE [dbo].[usp_getlastrunstatus]
AS
BEGIN
	SET NOCOUNT ON;
		DECLARE @RestartStatus BIT
		DECLARE @status NVARCHAR(100)

		SELECT
			@RestartStatus = [PropertyValue] 
		FROM
			[dbo].[Conf_Properties]
		WHERE
			[PropertyName] = 'OverideRestart'

	--get restart overide property
	IF EXISTS
		(
		SELECT * FROM [dbo].[Log_CurrentADFExecution_WFDD] WHERE ISNULL(PipelineStatus,'') = 'Running'
		)
		BEGIN
			RAISERROR('There is already an execution run in progress. Stop this via Data Factory before restarting.',16,1);
			RETURN 0;
		END;	

	Else IF EXISTS
		(
		SELECT * FROM [dbo].[Log_CurrentADFExecution_WFDD] WHERE ISNULL(PipelineStatus,'') = 'Failed'
		)
		AND @RestartStatus = 0
		BEGIN
			set @status = 'RerunFailed' 
		END;
	Else IF EXISTS
		(
		SELECT * FROM [dbo].[Log_CurrentADFExecution_WFDD] WHERE ISNULL(PipelineStatus,'') = 'Failed'
		)
		AND @RestartStatus = 1
		BEGIN
			set @status = 'StartProcess' 
		END;
	Else IF not EXISTS
		(
		SELECT * FROM [dbo].[Log_CurrentADFExecution_WFDD] --WHERE ISNULL(PipelineStatus,'') = 'Success'
		)
		BEGIN
			set @status = 'StartProcess' 
		END;
	ELSE
		BEGIN
			set @status = 'Default' 
		END
SELECT
		@status AS Status
END;
