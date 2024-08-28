use [Oysters_24-08-28]
go

--Cage data: CR
--Update missing SH
UPDATE [dbo].[CageCount] set TotalCount = 16 where [CageCountID] like 'CRCAGE_20240813_1_0231_1_R_B'
INSERT INTO CageSH(ShellHeightID, CageCountID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes)
VALUES ('CRCAGE_20240813_1_0231_1_R_B_16', 'CRCAGE_20240813_1_0231_1_R_B', '56', 'Entered', '2024-08-27 00:00:00', 'Erica Levine', '2024-08-27 00:00:00', 'Erica Levine', NULL, NULL, NULL, NULL);

--Sediment Trap: TB
--TB 07/2024 - GOOD.
--LW/CR 8/2024
UPDATE [dbo].[SedimentTrap]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data confirmed' else ' Data confirmed' end)
where [CupSampleID] like 'LWL2408-02-1' or [CupSampleID] like 'CRE2408-01-1' or [CupSampleID] like 'CRE2408-01-2' or [CupSampleID] like 'CRE2408-02-1' or [CupSampleID] like 'CRE2408-02-2' 

--Dermo data: SL, LW, LX
--SL, LX
UPDATE [dbo].[Dermo]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data confirmed' else ' Data confirmed' end)
where [OysterID] like 'SLND2408-08' or [OysterID] like 'LXND2408-13'

--RCRT: 
--Remove incorrectly created trips
DELETE from [dbo].[TripInfo] where [TripID] like 'CRRCRT_20240806_1%' or [TripID] like 'LWRCRT_20240820_1'
--Correct incorrect deployed dates
UPDATE [dbo].[Recruitment] set DeployedDate = '2024-07-09' where SampleEventID like 'LWRCRT_20240806_1_0235_1' or SampleEventID like 'LWRCRT_20240806_1_0237_1'
--Confirm TB data
UPDATE [dbo].[SampleEventWQ]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data confirmed' else ' Data confirmed' end)
where [SampleEventWQID] like 'TBRCRT_20240823_1_0528_1_01' or [SampleEventWQID] like 'TBRCRT_20240823_1_0527_1_01' or [SampleEventWQID] like 'TBRCRT_20240823_1_0529_1_02' or [SampleEventWQID] like 'TBRCRT_20240823_1_0278_1_01' or [SampleEventWQID] like 'TBRCRT_20240823_1_0277_1_01'


EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-08-01', @CheckEnd = '2024-08-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-07-01', @CheckEnd = '2024-07-31', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-08-01', @CheckEnd = '2024-08-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-08-01', @CheckEnd = '2024-08-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-08-01', @CheckEnd = '2024-08-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-08-01', @CheckEnd = '2024-08-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-08-01', @CheckEnd = '2024-08-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-08-01', @CheckEnd = '2024-08-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-08-01', @CheckEnd = '2024-08-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksWave] @CheckStart = '2024-01-01', @CheckEnd = '2024-01-31', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';