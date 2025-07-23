use [Oysters_25-07-23]
go


--Update Datalogger locations --COMPLETED in OYSTERS
--UPDATE FixedLocations set Dataloggers = 'Y' where StationNameNumber = 'TB Braden River 8' or StationNameNumber = 'LW-L-2-2' 
--LXN sex ratio repro samples for June-July 2025 added to Oysters 7/22/25

--RCRT: TB 06/2025, SL/LX/LW 07/2025

--SDTP: LW 07/2025

--CAGE: 06/2025, SL/LX 07/2025
UPDATE dbo.CageCount set [Comments] = CONCAT(Comments, ', 29 deployed-miscounted') where CageCountID like 'LXCAGE_20250708_1_0243_1_D_B%'

--COLL: TB 06/2024 Repro. LW 04-05/2025, CERP 04-05/2025, LW/LX/SL dermo 07/2025, TB 06/2025
UPDATE dbo.ConditionIndex set [Comments] = 'Shallow' where OysterID like 'TBRC2406-04%'
DELETE from TripInfo where TripID = 'TBCOLL_20250630_1'
UPDATE dbo.SampleEventWQ set [Secchi] = 0.30 where SampleEventWQID like 'TBCOLL_20250623_1_0529_1_01%'

EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-06-01', @CheckEnd = '2025-06-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-07-01', @CheckEnd = '2025-07-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-07-01', @CheckEnd = '2025-07-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-07-01', @CheckEnd = '2025-07-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-07-01', @CheckEnd = '2025-07-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2025-07-01', @CheckEnd = '2025-07-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-06-01', @CheckEnd = '2025-06-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-06-01', @CheckEnd = '2025-07-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-06-01', @CheckEnd = '2025-07-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-06-01', @CheckEnd = '2024-06-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-04-01', @CheckEnd = '2025-05-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-01-01', @CheckEnd = '2025-05-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-04-01', @CheckEnd = '2025-05-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-04-01', @CheckEnd = '2025-05-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';