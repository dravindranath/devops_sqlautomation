



CREATE PROCEDURE [dbo].[usp_UpdateExecutionLogError] (
@ExecutionId UNIQUEIDENTIFIER, 
@pipelinename [VARCHAR](200),
@RunId UNIQUEIDENTIFIER = NULL, 
@comment      [VARCHAR](500)=NULL
) 
AS 
  BEGIN 
      SET nocount ON; 

      DECLARE @ErrorDetail VARCHAR(500) 

      BEGIN 
          --mark specific failure pipeline 
          UPDATE [dbo].[Log_CurrentADFExecution_WFDD] 
          SET    pipelinestatus = 'Failed', 
                 comment = 'Pipeline execution failed. Check Run ID: ' 
                           + Cast(@RunId AS CHAR(36)) 
                           + ' in ADF monitoring for details.', 
                 process_flag = 0 
          WHERE  [localexecutionid] = @ExecutionId 
                 AND pipelinename = @pipelinename 
      END; 

      WITH cte 
           AS (SELECT Max(pipelineid) pipelineid, 
                      localexecutionid 
               FROM   [dbo].[Log_CurrentADFExecution_WFDD] 
               WHERE  localexecutionid = @ExecutionId 
                      AND pipelinestatus = 'Failed' 
                      --AND datadomain = 'WorkForce' 
               GROUP  BY localexecutionid) 
      UPDATE execlog 
      SET    PipelineStatus = 'Blocked', 
             comment = 'previous pipeline executions failed.', 
             Process_Flag = 0 
      FROM   [dbo].[Log_CurrentADFExecution_WFDD] execlog 
             INNER JOIN cte 
                     ON execlog.localexecutionid = cte.localexecutionid 
                        --WHERE 
                        --[LocalExecutionId] = @ExecutionId 
                        AND execlog.pipelineid > cte.pipelineid; 

      ------------------------------------------ 
      --raise error to stop processing 
      IF @RunId IS NOT NULL 
        BEGIN 
            SET @ErrorDetail = 'Pipeline execution failed. Check Run ID: ' 
                               + Cast(@RunId AS CHAR(36)) 
                               + ' in ADF monitoring for details.' 
        END; 
      ELSE 
        BEGIN 
            SET @ErrorDetail = 
            'Pipeline execution failed. See ADF monitoring for details.' 
        END; 

      RAISERROR(@ErrorDetail,16,1); 

      RETURN 0; 
  --  END; 
  --ELSE IF (SELECT [procfwk].[GetPropertyValueInternal]('FailureHandling')) = 'DependencyChain' 
  --  BEGIN 
  --    EXEC [procfwk].[SetExecutionBlockDependants] 
  --      @ExecutionId = @ExecutionId, 
  --      @PipelineId = @PipelineId 
  --  END; 
  --ELSE 
  --  BEGIN 
  --    RAISERROR('Unknown failure handling state.',16,1); 
  --    RETURN 0; 
  --  END; 
  END; 

