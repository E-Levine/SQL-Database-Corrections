--Code to correct, delete, or send back errors in survey data:
--Shell Heights
--Check data in local copy first
USE OystersEL_231129
GO

--Check Fixed location IDs for reference - change estuary as needed
select * from FixedLocations where Estuary = 'CR'
--Check for and note incorrect data by changing the searcg ShellHeightID
select * from SurveySH where ShellHeightID like 'CRSRVY_20230613_1_0233%' order by ShellHeightID

----update specific missing values by ShellHeightID
--Station 1 2023/03/14 survey
update [dbo].[SurveySH]
set [ShellHeight] = 54
where [ShellHeightID] like 'CRSRVY_20230314_1_0233_1_11_019'
update [dbo].[SurveySH]
set [ShellHeight] = 9
where [ShellHeightID] like 'CRSRVY_20230314_1_0233_1_11_020'
update [dbo].[SurveySH]
set [ShellHeight] = 13
where [ShellHeightID] like 'CRSRVY_20230314_1_0233_1_11_021'
update [dbo].[SurveySH]
set [ShellHeight] = 14
where [ShellHeightID] like 'CRSRVY_20230314_1_0233_1_11_022'
--Station 2 2023/06/14 survey
update [dbo].[SurveySH]
set [ShellHeight] = 40
where [ShellHeightID] like 'CRSRVY_20230613_1_0231_1_14_019'
update [dbo].[SurveySH]
set [ShellHeight] = 41
where [ShellHeightID] like 'CRSRVY_20230613_1_0231_1_14_020'
--Station 3 2023/06/14 survey
update [dbo].[SurveySH]
set [ShellHeight] = 15
where [ShellHeightID] like 'CRSRVY_20230613_1_0232_1_13_019'
update [dbo].[SurveySH]
set [ShellHeight] = 16
where [ShellHeightID] like 'CRSRVY_20230613_1_0232_1_13_020'

---delete excess/incorrect rows of shell heights 11-50
--Station 1 2023/03/14
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230314_1_0230_1_02_01%' and ShellHeightID not like 'CRSRVY_20230314_1_0230_1_02_010' or ShellHeightID like 'CRSRVY_20230314_1_0230_1_02_02%' or ShellHeightID like 'CRSRVY_20230314_1_0230_1_02_03%' or ShellHeightID like 'CRSRVY_20230314_1_0230_1_02_04%' or ShellHeightID like 'CRSRVY_20230314_1_0230_1_02_05%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230314_1_0230_1_03_01%' and ShellHeightID not like 'CRSRVY_20230314_1_0230_1_03_010' or ShellHeightID like 'CRSRVY_20230314_1_0230_1_03_02%' or ShellHeightID like 'CRSRVY_20230314_1_0230_1_03_03%' or ShellHeightID like 'CRSRVY_20230314_1_0230_1_03_04%' or ShellHeightID like 'CRSRVY_20230314_1_0230_1_03_05%' 
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230314_1_0230_1_04_01%' and ShellHeightID not like 'CRSRVY_20230314_1_0230_1_04_010' or ShellHeightID like 'CRSRVY_20230314_1_0230_1_04_02%' or ShellHeightID like 'CRSRVY_20230314_1_0230_1_04_03%' or ShellHeightID like 'CRSRVY_20230314_1_0230_1_04_04%' or ShellHeightID like 'CRSRVY_20230314_1_0230_1_04_05%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230314_1_0230_1_05_01%' and ShellHeightID not like 'CRSRVY_20230314_1_0230_1_05_010' or ShellHeightID like 'CRSRVY_20230314_1_0230_1_05_02%' or ShellHeightID like 'CRSRVY_20230314_1_0230_1_05_03%' or ShellHeightID like 'CRSRVY_20230314_1_0230_1_05_04%' or ShellHeightID like 'CRSRVY_20230314_1_0230_1_05_05%'
--Station 2 2023/06/13
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230613_1_0231_1_01_01%' and ShellHeightID not like 'CRSRVY_20230613_1_0231_1_01_010' or ShellHeightID like 'CRSRVY_20230613_1_0231_1_01_02%' or ShellHeightID like 'CRSRVY_20230613_1_0231_1_01_03%' or ShellHeightID like 'CRSRVY_20230613_1_0231_1_01_04%' or ShellHeightID like 'CRSRVY_20230613_1_0231_1_01_05%'  
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230613_1_0231_1_02_01%' and ShellHeightID not like 'CRSRVY_20230613_1_0231_1_02_010' or ShellHeightID like 'CRSRVY_20230613_1_0231_1_02_02%' or ShellHeightID like 'CRSRVY_20230613_1_0231_1_02_03%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230613_1_0231_1_03_01%' and ShellHeightID not like 'CRSRVY_20230613_1_0231_1_03_010' or ShellHeightID like 'CRSRVY_20230613_1_0231_1_03_02%' or ShellHeightID like 'CRSRVY_20230613_1_0231_1_03_03%' or ShellHeightID like 'CRSRVY_20230613_1_0231_1_03_04%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230613_1_0231_1_04_01%' and ShellHeightID not like 'CRSRVY_20230613_1_0231_1_04_010' or ShellHeightID like 'CRSRVY_20230613_1_0231_1_04_02%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230613_1_0231_1_05_01%' and ShellHeightID not like 'CRSRVY_20230613_1_0231_1_05_010' or ShellHeightID like 'CRSRVY_20230613_1_0231_1_05_02%' or ShellHeightID like 'CRSRVY_20230613_1_0231_1_05_03%'
--Station 3 2023/06/13
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230613_1_0232_1_01_01%' and ShellHeightID not like 'CRSRVY_20230613_1_0232_1_01_010' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_01_02%' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_01_03%' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_01_04%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230613_1_0232_1_02_01%' and ShellHeightID not like 'CRSRVY_20230613_1_0232_1_02_010' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_02_02%' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_02_03%' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_02_04%' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_02_05%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230613_1_0232_1_03_01%' and ShellHeightID not like 'CRSRVY_20230613_1_0232_1_03_010' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_03_02%' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_03_03%' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_03_04%' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_03_05%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230613_1_0232_1_04_01%' and ShellHeightID not like 'CRSRVY_20230613_1_0232_1_04_010' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_04_02%' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_04_03%' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_04_04%' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_04_05%' 
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230613_1_0232_1_05_01%' and ShellHeightID not like 'CRSRVY_20230613_1_0232_1_05_010' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_05_02%' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_05_03%' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_05_04%' or ShellHeightID like 'CRSRVY_20230613_1_0232_1_05_05%'

--Check data
select * from SurveySH where ShellHeightID  like 'CRSRVY_20230613_1_0232_1_13%' order by ShellHeightID

