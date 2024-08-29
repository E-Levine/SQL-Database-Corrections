use [Oysters_24-08-28]
go

--FixedLocation info: Cages
UPDATE [dbo].[FixedLocations] set Cage = 'N' where Estuary like 'TB' or StationName like 'SL-N-4'

--Cage data: CR
--Update missing SH
UPDATE [dbo].[CageCount] set TotalCount = 16 where [CageCountID] like 'CRCAGE_20240813_1_0231_1_R_B'
insert into CageSH(ShellHeightID, CageCountID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes)
values ('CRCAGE_20240813_1_0231_1_R_B_16', 'CRCAGE_20240813_1_0231_1_R_B', '56', 'Entered', '2024-08-27 00:00:00', 'Erica Levine', '2024-08-27 00:00:00', 'Erica Levine', NULL, NULL, NULL, NULL);

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

--CAGE LX 3-10/2023
--10/2023 Missing SHs
UPDATE [dbo].[CageSH] set ShellHeight = 51 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_19'
UPDATE [dbo].[CageSH] set ShellHeight = 36 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_20'
UPDATE [dbo].[CageSH] set ShellHeight = 46 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_21'
UPDATE [dbo].[CageSH] set ShellHeight = 36 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_22'
UPDATE [dbo].[CageSH] set ShellHeight = 41 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_23'
UPDATE [dbo].[CageSH] set ShellHeight = 56 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_24'
UPDATE [dbo].[CageSH] set ShellHeight = 35 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_25'
UPDATE [dbo].[CageSH] set ShellHeight = 44 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_26'
UPDATE [dbo].[CageSH] set ShellHeight = 53 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_27'
UPDATE [dbo].[CageSH] set ShellHeight = 41 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_28'
UPDATE [dbo].[CageSH] set ShellHeight = 57 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_29'
UPDATE [dbo].[CageSH] set ShellHeight = 49 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_30'
UPDATE [dbo].[CageSH] set ShellHeight = 46 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_01'
UPDATE [dbo].[CageSH] set ShellHeight = 47 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_02'
UPDATE [dbo].[CageSH] set ShellHeight = 51 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_03'
UPDATE [dbo].[CageSH] set ShellHeight = 28 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_04'
UPDATE [dbo].[CageSH] set ShellHeight = 51 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_05'
UPDATE [dbo].[CageSH] set ShellHeight = 51 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_06'
UPDATE [dbo].[CageSH] set ShellHeight = 52 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_07'
UPDATE [dbo].[CageSH] set ShellHeight = 55 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_08'
UPDATE [dbo].[CageSH] set ShellHeight = 62 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_09'
UPDATE [dbo].[CageSH] set ShellHeight = 61 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_10'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_11'
UPDATE [dbo].[CageSH] set ShellHeight = 33 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_12'
UPDATE [dbo].[CageSH] set ShellHeight = 54 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_13'
UPDATE [dbo].[CageSH] set ShellHeight = 58 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_14'
UPDATE [dbo].[CageSH] set ShellHeight = 48 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_15'
UPDATE [dbo].[CageSH] set ShellHeight = 46 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_16'
UPDATE [dbo].[CageSH] set ShellHeight = 58 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_17'
UPDATE [dbo].[CageSH] set ShellHeight = 52 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_18'
UPDATE [dbo].[CageSH] set ShellHeight = 54 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_19'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_20'
UPDATE [dbo].[CageSH] set ShellHeight = 37 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_21'
UPDATE [dbo].[CageSH] set ShellHeight = 48 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_22'
UPDATE [dbo].[CageSH] set ShellHeight = 37 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_23'
UPDATE [dbo].[CageSH] set ShellHeight = 35 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_24'
UPDATE [dbo].[CageSH] set ShellHeight = 41 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_25'
UPDATE [dbo].[CageSH] set ShellHeight = 43 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_26'
UPDATE [dbo].[CageSH] set ShellHeight = 45 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_27'
UPDATE [dbo].[CageSH] set ShellHeight = 63 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_28'
UPDATE [dbo].[CageSH] set ShellHeight = 32 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_29'
UPDATE [dbo].[CageSH] set ShellHeight = 52 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_30'
UPDATE [dbo].[CageSH] set ShellHeight = 65 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_01'
UPDATE [dbo].[CageSH] set ShellHeight = 55 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_02'
UPDATE [dbo].[CageSH] set ShellHeight = 44 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_03'
UPDATE [dbo].[CageSH] set ShellHeight = 51 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_04'
UPDATE [dbo].[CageSH] set ShellHeight = 35 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_05'
UPDATE [dbo].[CageSH] set ShellHeight = 53 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_06'
UPDATE [dbo].[CageSH] set ShellHeight = 31 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_07'
UPDATE [dbo].[CageSH] set ShellHeight = 57 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_08'
UPDATE [dbo].[CageSH] set ShellHeight = 48 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_09'
UPDATE [dbo].[CageSH] set ShellHeight = 36 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_10'
UPDATE [dbo].[CageSH] set ShellHeight = 42 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_11'
UPDATE [dbo].[CageSH] set ShellHeight = 36 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_12'
UPDATE [dbo].[CageSH] set ShellHeight = 48 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_13'
UPDATE [dbo].[CageSH] set ShellHeight = 46 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_14'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_15'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_16'
UPDATE [dbo].[CageSH] set ShellHeight = 43 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_17'
UPDATE [dbo].[CageSH] set ShellHeight = 45 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_18'
UPDATE [dbo].[CageSH] set ShellHeight = 60 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_19'
UPDATE [dbo].[CageSH] set ShellHeight = 54 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_20'
UPDATE [dbo].[CageSH] set ShellHeight = 61 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_21'
UPDATE [dbo].[CageSH] set ShellHeight = 35 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_22'
UPDATE [dbo].[CageSH] set ShellHeight = 39 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_23'
UPDATE [dbo].[CageSH] set ShellHeight = 49 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_24'
UPDATE [dbo].[CageSH] set ShellHeight = 58 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_25'
UPDATE [dbo].[CageSH] set ShellHeight = 41 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_26'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_27'
UPDATE [dbo].[CageSH] set ShellHeight = 53 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_28'
UPDATE [dbo].[CageSH] set ShellHeight = 41 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_29'
UPDATE [dbo].[CageSH] set ShellHeight = 43 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_30'
UPDATE [dbo].[CageSH] set ShellHeight = 53 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_01'
UPDATE [dbo].[CageSH] set ShellHeight = 68 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_02'
UPDATE [dbo].[CageSH] set ShellHeight = 42 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_03'
UPDATE [dbo].[CageSH] set ShellHeight = 43 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_04'
UPDATE [dbo].[CageSH] set ShellHeight = 37 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_05'
UPDATE [dbo].[CageSH] set ShellHeight = 41 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_06'
UPDATE [dbo].[CageSH] set ShellHeight = 79 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_07'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_08'
UPDATE [dbo].[CageSH] set ShellHeight = 72 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_09'
UPDATE [dbo].[CageSH] set ShellHeight = 38 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_10'
UPDATE [dbo].[CageSH] set ShellHeight = 49 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_11'
UPDATE [dbo].[CageSH] set ShellHeight = 45 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_12'
UPDATE [dbo].[CageSH] set ShellHeight = 37 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_13'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_14'
UPDATE [dbo].[CageSH] set ShellHeight = 54 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_01'
UPDATE [dbo].[CageSH] set ShellHeight = 53 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_02'
UPDATE [dbo].[CageSH] set ShellHeight = 61 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_03'
UPDATE [dbo].[CageSH] set ShellHeight = 69 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_04'
UPDATE [dbo].[CageSH] set ShellHeight = 43 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_05'
UPDATE [dbo].[CageSH] set ShellHeight = 65 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_06'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_07'
UPDATE [dbo].[CageSH] set ShellHeight = 47 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_08'
UPDATE [dbo].[CageSH] set ShellHeight = 59 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_09'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_10'
UPDATE [dbo].[CageSH] set ShellHeight = 44 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_11'
UPDATE [dbo].[CageSH] set ShellHeight = 46 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_12'
UPDATE [dbo].[CageSH] set ShellHeight = 61 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_13'
UPDATE [dbo].[CageSH] set ShellHeight = 55 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_14'
UPDATE [dbo].[CageSH] set ShellHeight = 56 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_15'
UPDATE [dbo].[CageSH] set ShellHeight = 48 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_16'
UPDATE [dbo].[CageSH] set ShellHeight = 40 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_17'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_18'
UPDATE [dbo].[CageSH] set ShellHeight = 43 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_19'
UPDATE [dbo].[CageSH] set ShellHeight = 55 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_01'
UPDATE [dbo].[CageSH] set ShellHeight = 49 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_02'
UPDATE [dbo].[CageSH] set ShellHeight = 62 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_03'
UPDATE [dbo].[CageSH] set ShellHeight = 60 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_04'
UPDATE [dbo].[CageSH] set ShellHeight = 53 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_05'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_06'
UPDATE [dbo].[CageSH] set ShellHeight = 48 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_07'
UPDATE [dbo].[CageSH] set ShellHeight = 68 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_08'
UPDATE [dbo].[CageSH] set ShellHeight = 68 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_09'
UPDATE [dbo].[CageSH] set ShellHeight = 54 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_10'
UPDATE [dbo].[CageSH] set ShellHeight = 51 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_11'
UPDATE [dbo].[CageSH] set ShellHeight = 47 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_12'
UPDATE [dbo].[CageSH] set ShellHeight = 68 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_13'
UPDATE [dbo].[CageSH] set ShellHeight = 64 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_14'
UPDATE [dbo].[CageSH] set ShellHeight = 44 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_15'
UPDATE [dbo].[CageSH] set ShellHeight = 46 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_16'
UPDATE [dbo].[CageSH] set ShellHeight = 47 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_17'
UPDATE [dbo].[CageSH] set ShellHeight = 65 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_18'
UPDATE [dbo].[CageSH] set ShellHeight = 53 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_19'
UPDATE [dbo].[CageSH] set ShellHeight = 49 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_20'


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
EXECUTE [dbo].[spChecksCage] @CheckStart = '2023-03-01', @CheckEnd = '2023-10-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';