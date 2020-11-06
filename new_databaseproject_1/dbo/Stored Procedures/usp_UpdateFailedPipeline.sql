CREATE PROC dbo.[usp_UpdateFailedPipeline] (@ExecutionId  UNIQUEIDENTIFIER, 

                                          --@file_name [varchar](200),   
                                          --@DataDomain [varchar](200),   
                                          --@pipelinename [varchar](200),   
                                          @Updated_Time [DATETIME] )
AS 
  BEGIN 
      UPDATE [dbo].[log_datafeedrepository] 
      SET    process_status = 'Success', 
             process_flag = 1, 
             comment = 'Reprocessed Error runs.Pipeline Executed Successfully' 
      WHERE  datadomain = 'WorkForce' 
             AND loaded_time = @Updated_Time 

      UPDATE [dbo].[log_currentadfexecution_wfdd] 
      SET 
      --PipelineStatus='Success',   
      process_flag = 1, 
      comment = 'Reprocessed Error runs.Pipeline Executed Successfully' 
      WHERE  datadomain = 'WorkForce' 
             AND localexecutionid = @ExecutionId 
  END 