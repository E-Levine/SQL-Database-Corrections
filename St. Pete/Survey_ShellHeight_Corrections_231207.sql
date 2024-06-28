--Code to correct, delete, or send back errors in survey data: - COMPLETED 2023/12/07
--Shell Heights
--Check data in local copy first
USE OystersEL_231129
GO

--Check Fixed location IDs for reference - change estuary as needed
select * from FixedLocations where Estuary = 'CR'
--Check for and note incorrect data by changing the search ShellHeightID
select * from SurveySH where ShellHeightID like 'CRSRVY_20230613_1_0233%' order by ShellHeightID
select * from TripInfo where TripID like 'CRSRVY_2023%' 

--Reset trips needing re-entry/proofing
update [dbo].[TripInfo]
set [DataStatus] = 'Not Entered',  DateProofed = NULL, ProofedBy = NULL
where [TripID] = 'CRSRVY_20230314_1' or [TripID] = 'CRSRVY_20230613_1'

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

---Update data to "Entered" for re-entry in ODIN for most quads 1-5 & 11-15
--Station 2, 3, 4 2023/03/14 
update [dbo].[SurveySH]
set DataStatus = 'Entered', DateProofed = NULL, ProofedBy = NULL
where ShellHeightID  like 'CRSRVY_20230314_1_0231_1_01%' or ShellHeightID  like 'CRSRVY_20230314_1_0231_1_02%' or ShellHeightID  like 'CRSRVY_20230314_1_0231_1_03%' or ShellHeightID  like 'CRSRVY_20230314_1_0231_1_04%' or ShellHeightID  like 'CRSRVY_20230314_1_0231_1_05%' or ShellHeightID  like 'CRSRVY_20230314_1_0231_1_1%' and ShellHeightID not like 'CRSRVY_20230314_1_0231_1_10%'
update [dbo].[SurveySH]
set DataStatus = 'Entered', DateProofed = NULL, ProofedBy = NULL
where ShellHeightID  like 'CRSRVY_20230314_1_0232_1_01%' or ShellHeightID  like 'CRSRVY_20230314_1_0232_1_02%' or ShellHeightID  like 'CRSRVY_20230314_1_0232_1_03%' or ShellHeightID  like 'CRSRVY_20230314_1_0232_1_04%' or ShellHeightID  like 'CRSRVY_20230314_1_0232_1_05%' or ShellHeightID  like 'CRSRVY_20230314_1_0232_1_1%' and ShellHeightID not like 'CRSRVY_20230314_1_0232_1_10%'
update [dbo].[SurveySH]
set DataStatus = 'Entered', DateProofed = NULL, ProofedBy = NULL
where ShellHeightID  like 'CRSRVY_20230314_1_0233_1_01%' or ShellHeightID  like 'CRSRVY_20230314_1_0233_1_02%' or ShellHeightID  like 'CRSRVY_20230314_1_0233_1_03%' or ShellHeightID  like 'CRSRVY_20230314_1_0233_1_04%' or ShellHeightID  like 'CRSRVY_20230314_1_0233_1_05%' or ShellHeightID  like 'CRSRVY_20230314_1_0233_1_12%'
--Station 2, 3 2023/06/13
update [dbo].[SurveySH]
set DataStatus = 'Entered', DateProofed = NULL, ProofedBy = NULL
where ShellHeightID  like 'CRSRVY_20230613_1_0231_1_11%' or ShellHeightID  like 'CRSRVY_20230613_1_0231_1_12%' or ShellHeightID  like 'CRSRVY_20230613_1_0231_1_13%' or ShellHeightID  like 'CRSRVY_20230613_1_0231_1_15%'
update [dbo].[SurveySH]
set DataStatus = 'Entered', DateProofed = NULL, ProofedBy = NULL
where ShellHeightID  like 'CRSRVY_20230613_1_0232_1_11%' or ShellHeightID  like 'CRSRVY_20230613_1_0232_1_12%' or ShellHeightID  like 'CRSRVY_20230613_1_0232_1_14%' or ShellHeightID  like 'CRSRVY_20230613_1_0232_1_15%'

--Check data
select * from SurveySH where ShellHeightID  like 'CRSRVY_20230613_1_0232_1_13%' order by ShellHeightID


---Code above run for re-entry and corrections. Data re-entered as approriate and secondary checks performed 12/7/2023.
--Remove NULL rows CR 3/14/23 St2 & St 3, Q1-5
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230314_1_0231_1_01_01%' and ShellHeightID not like 'CRSRVY_20230314_1_0231_1_01_010' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_01_02%' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_01_03%' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_01_04%' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_01_05%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230314_1_0231_1_02_01%' and ShellHeightID not like 'CRSRVY_20230314_1_0231_1_02_010' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_02_02%' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_02_03%' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_02_04%' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_02_05%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230314_1_0231_1_03_01%' and ShellHeightID not like 'CRSRVY_20230314_1_0231_1_03_010' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_03_02%' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_03_03%' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_03_04%' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_03_05%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230314_1_0231_1_04_01%' and ShellHeightID not like 'CRSRVY_20230314_1_0231_1_04_010' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_04_02%' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_04_03%' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_04_04%' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_04_05%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230314_1_0231_1_05_01%' and ShellHeightID not like 'CRSRVY_20230314_1_0231_1_05_010' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_05_02%' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_05_03%' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_05_04%' or ShellHeightID like 'CRSRVY_20230314_1_0231_1_05_05%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230314_1_0232_1_01_01%' and ShellHeightID not like 'CRSRVY_20230314_1_0232_1_01_010' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_01_02%' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_01_03%' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_01_04%' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_01_05%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230314_1_0232_1_02_01%' and ShellHeightID not like 'CRSRVY_20230314_1_0232_1_02_010' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_02_02%' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_02_03%' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_02_04%' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_02_05%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230314_1_0232_1_03_01%' and ShellHeightID not like 'CRSRVY_20230314_1_0232_1_03_010' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_03_02%' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_03_03%' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_03_04%' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_03_05%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230314_1_0232_1_04_01%' and ShellHeightID not like 'CRSRVY_20230314_1_0232_1_04_010' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_04_02%' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_04_03%' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_04_04%' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_04_05%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230314_1_0232_1_05_01%' and ShellHeightID not like 'CRSRVY_20230314_1_0232_1_05_010' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_05_02%' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_05_03%' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_05_04%' or ShellHeightID like 'CRSRVY_20230314_1_0232_1_05_05%'
--Remove rows CR 3/14/23 St4, Q1 (9-22), 2 (11-31), 4  (11-43)
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230314_1_0233_1_01_01%' or ShellHeightID like 'CRSRVY_20230314_1_0233_1_01_009' or ShellHeightID like 'CRSRVY_20230314_1_0233_1_01_02%' or ShellHeightID like 'CRSRVY_20230314_1_0233_1_01_03%' or ShellHeightID like 'CRSRVY_20230314_1_0233_1_01_04%' or ShellHeightID like 'CRSRVY_20230314_1_0233_1_01_05%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230314_1_0233_1_02_01%' and ShellHeightID not like 'CRSRVY_20230314_1_0233_1_02_010' or ShellHeightID like 'CRSRVY_20230314_1_0233_1_02_02%' or ShellHeightID like 'CRSRVY_20230314_1_0233_1_02_03%' or ShellHeightID like 'CRSRVY_20230314_1_0233_1_02_04%' or ShellHeightID like 'CRSRVY_20230314_1_0233_1_02_05%'
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230314_1_0233_1_04_01%' and ShellHeightID not like 'CRSRVY_20230314_1_0233_1_04_010' or ShellHeightID like 'CRSRVY_20230314_1_0233_1_04_02%' or ShellHeightID like 'CRSRVY_20230314_1_0233_1_04_03%' or ShellHeightID like 'CRSRVY_20230314_1_0233_1_04_04%' or ShellHeightID like 'CRSRVY_20230314_1_0233_1_04_05%'
--Remove SH#10 Q4 Cr 6/13/23
delete from [dbo].[SurveySH]
where ShellHeightID like 'CRSRVY_20230613_1_0232_1_04_010'
