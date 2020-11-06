CREATE PROC [EDNAWorkforce].[usp_insert_filelog_workforce] @filename [nvarchar](200),@pipelinerunid [varchar](200),@pipelinename [varchar](200),@filesource [nvarchar](50),@fileinserted [datetime] AS
BEGIN
-- exec  [dbo].[usp_insert_filelog] 'SFSBI_Control20181116_010755.txt', 'DDF_GSD'
    SET NOCOUNT ON
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
	--set @filemodified=getutcdate()
	Declare @filename_local nvarchar(200)
	Declare @filesource_local nvarchar(200)
	Declare @fileinserted_local datetime

	SET @filename_local = @filename
	SET @filesource_local = @filesource
	SET @fileinserted_local = @fileinserted

		INSERT INTO EDNAWorkforce.Workforce_Data_Log(
										[file_name] ,
										File_insertedDate ,
										[file_process_status] ,
										[pipeline_run_id],
										[Pipeline_name],
										[Pipeline_starttime],
										[pipeline_endtime] ,
										[file_source],
										comment,
										File_processed)
				Select 
				@filename_local,getutcdate(),'In Progress',  @pipelinerunid,@pipelinename,  @fileinserted_local,NULL,@filesource_local, NULL,NULL

	

		END


