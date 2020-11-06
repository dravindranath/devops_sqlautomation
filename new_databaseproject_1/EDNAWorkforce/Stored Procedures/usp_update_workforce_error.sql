

CREATE PROC [EDNAWorkforce].[usp_update_workforce_error] 
@file_name [varchar](200),
@pipelinerunid [varchar](200),
@pipelinename [varchar](200),
@fileinserted [datetime],
@comment [varchar](500) AS
BEGIN
UPDATE  EDNAWorkforce.[Log_DataFeedRepository]
		SET Pipeline_Status='Error' ,
		--File_processed ='Y',
		--pipeline_revision_date	=@pipeline_revision_date,
		[End_Time]= GetUTCdate(),
		Comment=@comment,
		Process_Flag=0
		--Comment = cast(@pipelinerunid as varchar(50))+'   '+cast(@pipelinename as varchar(50))+'   '+cast(@fileinserted  as varchar(50))
		--Pipeline_run_id=@pipelinerunid ,
		--Pipeline_name=@pipelinename ,
		--File_insertedDate=@fileinserted
	Where File_Name = @file_name 
	--and Pipeline_run_id=@pipelinerunid and Pipeline_name=@pipelinename and Pipeline_starttime=@fileinserted
END
