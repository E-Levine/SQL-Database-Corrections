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


select * from SurveySH where ShellHeightID  like 'CRSRVY_20230613_1_0232_1_13%' order by ShellHeightID

