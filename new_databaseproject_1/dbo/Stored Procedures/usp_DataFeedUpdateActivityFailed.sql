



CREATE PROC dbo.[usp_DataFeedUpdateActivityFailed] 
@file_name [varchar](200),
--@pipelinerunid [varchar](200),
@pipelinename [varchar](200),
@fileinserted [datetime],
@comment [varchar](500) AS
BEGIN
Declare @errorcomment [varchar](500)
set @errorcomment='Error - '+@comment
UPDATE  [dbo].[Log_DataFeedRepository]
		SET 
		Process_Status='Failed' ,
		--File_processed ='Y',
		--pipeline_revision_date	=@pipeline_revision_date,
		[End_Time]= GetUTCdate(),
		Comment=@errorcomment,
		Process_Flag=0
		--Comment = cast(@pipelinerunid as varchar(50))+'   '+cast(@pipelinename as varchar(50))+'   '+cast(@fileinserted  as varchar(50))
		--Pipeline_run_id=@pipelinerunid ,
		--Pipeline_name=@pipelinename ,
		--File_insertedDate=@fileinserted
	Where File_Name = @file_name 
	--and Pipeline_run_id=@pipelinerunid and Pipeline_name=@pipelinename and Pipeline_starttime=@fileinserted
END
