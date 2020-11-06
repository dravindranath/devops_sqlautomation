

CREATE PROC [EDNAWorkforce].[usp_Log_DataFeedRepository]
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
,@Data_Domain VARCHAR(500)
AS
BEGIN
-- exec  [dbo].[usp_insert_filelog] 'SFSBI_Control20181116_010755.txt', 'DDF_GSD'
    SET NOCOUNT ON
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
	--set @filemodified=getutcdate()
	--Declare @filename_local nvarchar(200)
	--Declare @filesource_local nvarchar(200)
	--Declare @fileinserted_local datetime

	--SET @File_Name = @filename
	--SET @filesource_local = @filesource
	--SET @fileinserted_local = @fileinserted

		INSERT INTO [dbo].[Log_DataFeedRepository]
			   ([File_Name]
			   ,[Source]
			   ,[Status_Flag]
			   ,[Loaded_By]
			   ,[Start_Time]
			   ,[End_Time]
			   ,[Entity]
			   ,[File_Time]
			   ,[Loaded_Time]
			   ,[Updated_By]
			   ,[Updated_Time]
			   ,[Zone_Filepath]
			   ,[DataDomain]
			   ,Process_Flag)
		 VALUES
			   (@File_Name
			   ,@Source
			   ,@Status_Flag
			   ,@Updated_By
			   ,@Start_Time
			   ,@End_Time
			   ,@Entity			   
			   ,Null
			   ,@Updated_Time
			   ,@Updated_By
			   ,@Updated_Time
			   ,@Raw_Zone_Filepath 
			   ,@Data_Domain
			   ,Null)


END
