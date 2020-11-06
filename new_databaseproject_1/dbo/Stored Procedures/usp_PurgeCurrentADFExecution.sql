
CREATE PROCEDURE [dbo].[usp_PurgeCurrentADFExecution]  
AS  
BEGIN  
 SET NOCOUNT ON;  
  
 --check current execution  
 --DECLARE @AllCount INT  
 --DECLARE @SuccessCount INT  
  
 --SELECT @AllCount = COUNT(0) FROM [dbo].[Log_CurrentADFExecution_WFDD]  
 --SELECT @SuccessCount = COUNT(0) FROM [dbo].[Log_CurrentADFExecution_WFDD] WHERE [PipelineStatus] = 'Success'  
  
 --IF @AllCount <> @SuccessCount  
 -- BEGIN  
 --  RAISERROR('Execution complete but not all Worker pipelines succeeded. See the [dbo].[Log_CurrentADFExecution_WFDD] table for details',16,1);  
 --  RETURN 0;  
 -- END;  
 --ELSE  
  --BEGIN  
   INSERT INTO [dbo].[Log_ADFPipelineExecutionLog]  
           ([LocalExecutionId]  
           ,[PipelineId]  
           ,[CallingDataFactoryName]  
           ,[PipelineName]  
           ,[StartDateTime]  
           ,[PipelineStatus]  
           ,[EndDateTime]  
           ,[AdfPipelineRunId]  
           ,[Loaded_By]  
           ,[Loaded_Time]  
           ,[Updated_By]  
           ,[Updated_Time]  
           ,[DataDomain]  
           ,[Process_Flag]  
           ,[Comment])  
   SELECT [LocalExecutionId]  
                   ,[PipelineId]  
                   ,[CallingDataFactoryName]  
                   ,[PipelineName]  
                   ,[StartDateTime]  
                   ,[PipelineStatus]  
                   ,[EndDateTime]  
                   ,[AdfPipelineRunId]  
                   ,[Loaded_By]  
                   ,[Loaded_Time]  
                   ,[Updated_By]  
                   ,[Updated_Time]  
                   ,[DataDomain]  
                   ,[Process_Flag]  
                   ,[Comment]  
            FROM [dbo].[Log_CurrentADFExecution_WFDD]  
  
   TRUNCATE TABLE [dbo].[Log_CurrentADFExecution_WFDD];  
  --END;  
END;
