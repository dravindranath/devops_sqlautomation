CREATE PROCEDURE uspgetquery
                 @table_name varchar(50)
AS
Begin
Declare @sql varchar(max)
set @sql=''
IF @table_name='vw_EntityMaterialDetails'
BEGIN
   set @sql ='select Material_Code,Family_Item_ID,Language_Key,Material_Desc_Uppercase,Material_Type,Industry_Sector,Material_Group,Old_Material_Number,Base_Unit,Purchasing_Value_Key,Gross_Weight,Net_Weight,Weight_Unit,Volume,Volume_Unit,Container_Requirements,Storage_Conditions,Temperature_Conditions_Indicator,Low_Level_Code,Transportation_Group,Division,EAN_UPC,International_Article_Number_EAN_Category,Length,Width,Height,Unit_of_Dimension_for_Length_Width_Height,Cross_Plant_Material_Status,Cross_Plant_Material_Status_Validity_Start_Date,Manufacturer_Part_Number,Manufacturer_number,Manufacturer_Part_Profile,Units_of_Measure_Usage,Base_Unit_of_Measure,Complete_Material_Maintenance_Status,Maintenance_status,Level1_Deletion_Delete_Flag,Record_Active_Start_Time,Record_Active_End_Time,Src_Loaded_Time,Src_Loaded_By,Src_Updated_Time,Src_Updated_By,Active_Status  FROM [EDNAMaterial].[vw_EntityMaterialDetails]'
END
IF @table_name='vw_EntityIngredientDetails'
BEGIN
   set @sql ='SELECT [material_code],[family_item_id],[country_code],[language_code],[common_name],[manufacturer],[revision_date],[internal_id],[cas],[ingredient],[contribution],[active_status]  FROM [EDNAMaterial].[vw_EntityIngredientDetails]'
END 
IF @table_name='vw_EntityClassficationDetails'
BEGIN
   set @sql = 'SELECT [Material_Code],[Family_Item_Id],[Language_Code],[Common_Name],[Manufacturer],[Revision_Date],[Internal_ID],[Country_Code],[Class_Category],[Class_Code],[Class_Short_Description],[Active_Status]  FROM [EDNAMaterial].[vw_EntityClassficationDetails]'
END 
print @sql
END