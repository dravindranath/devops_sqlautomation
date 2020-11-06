


CREATE PROC [dbo].[uspUpsertLog_DataFeedRepository] 
 @File_Name [VARCHAR](500)
,@Source [VARCHAR](500)
,@Status_Flag [INT]
,@Start_Time [DATETIME]
,@End_Time [DATETIME]
,@Entity [VARCHAR](500)
,@File_Time [VARCHAR](500)
,@Updated_By [VARCHAR](500)
,@Updated_Time [DATETIME]
,@Raw_Zone_Filepath [VARCHAR](500) 
,@Data_Domain VARCHAR(500) AS
BEGIN

		--SELECT 1 AS T
	DECLARE @ExtractFileDate DATETIME
	IF @Source Like '%SPHERA%'
		--ddmmyyyy
		--SET @File_Time = STRING_SPLIT(@File_Time, '_')
		SET @ExtractFileDate = DATETIMEFROMPARTS(TRY_CONVERT(INT,SUBSTRING(@File_Time,5,4))
								,TRY_CONVERT(INT,SUBSTRING(@File_Time,3,2))
								,TRY_CONVERT(INT,SUBSTRING(@File_Time,1,2))
								,TRY_CONVERT(INT,SUBSTRING(@File_Time,9,2))
								,TRY_CONVERT(INT,SUBSTRING(@File_Time,11,2))
								,TRY_CONVERT(INT,SUBSTRING(@File_Time,13,2))
								,0)
	ELSE
		BEGIN 
		--(-mm-dd-yyyy)
		--SET @ExtractFileDate = DATEFROMPARTS(TRY_CONVERT(INT,SUBSTRING(@File_Time,8,4)),TRY_CONVERT(INT,SUBSTRING(@File_Time,2,2)),TRY_CONVERT(INT,SUBSTRING(@File_Time,5,2)));
			SET @File_Time = RIGHT(TRIM(@File_Time), 23)

			SET @ExtractFileDate = DATETIMEFROMPARTS (
			CONVERT(INT,SUBSTRING(@File_Time,7,4)),CONVERT(INT,SUBSTRING(@File_Time,1,2)),CONVERT(INT,SUBSTRING(@File_Time,4,2))
			,CONVERT(INT,SUBSTRING(@File_Time,12,2))
			,CONVERT(INT,SUBSTRING(@File_Time,15,2))
			,CONVERT(INT,SUBSTRING(@File_Time,18,2))
			,0
			)
		END
	INSERT INTO [dbo].[Log_DataFeedRepository]
			   ([File_Name]
			   ,[Source]
			   ,[Status_Flag]
			   ,[Start_Time]
			   ,[End_Time]
			   ,[Entity]
			   ,[File_Time]
			   ,[Loaded_By]
			   ,[Loaded_Time]
			   ,[Updated_By]
			   ,[Updated_Time]
			   ,[Zone_Filepath]
			   ,[DataDomain])
		 VALUES
			   (@File_Name
			   ,@Source
			   ,@Status_Flag
			   ,@Start_Time
			   ,@End_Time
			   ,@Entity			   
			   ,@ExtractFileDate
			   ,@Updated_By
			   ,@Updated_Time
			   ,@Updated_By
			   ,@Updated_Time
			   ,@Raw_Zone_Filepath 
			   ,@Data_Domain )


END
