

CREATE PROC [EDNAWorkforce].[usp_update_workforce_success] @file_name [varchar](200),@pipelinerunid [varchar](200),@pipelinename [varchar](200),@fileinserted [datetime] AS
BEGIN
UPDATE  EDNAWorkforce.[Log_DataFeedRepository]
		SET Pipeline_Status='Success' ,
		Process_Flag =1,
		--pipeline_revision_date	=@pipeline_revision_date,
		[End_Time]= GetUTCdate()
		--Comment = cast(@pipelinerunid as varchar(50))+'   '+cast(@pipelinename as varchar(50))+'   '+cast(@fileinserted  as varchar(50))
		--Pipeline_run_id=@pipelinerunid ,
		--Pipeline_name=@pipelinename ,
		--File_insertedDate=@fileinserted
	Where File_Name = @file_name --and Pipeline_run_id=@pipelinerunid and Pipeline_name=@pipelinename 
	--and Pipeline_starttime=@fileinserted
END
