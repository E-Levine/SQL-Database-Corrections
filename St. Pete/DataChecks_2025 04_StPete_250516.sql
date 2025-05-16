use [Oysters] -- E Williams completed 2025/05/16

--SKIP: DONE TO OYSTERS db 04/21/2025:Adding/correcting for extra LXN COLL samples
DELETE FROM [dbo].[Dermo] where OysterID like 'LXND2503%'
Delete FROM [dbo].[TripInfo] where TripID like 'LXCOLL_20250318_2' or TripID like 'LXCOLL_20250318_3'
Delete FROM [dbo].[SampleEvent] where TripID like 'LXCOLL_20250318_2'
Delete FROM [dbo].[SampleEventWQ] where SampleEventID like 'LXCOLL_20250318_2%'
--Run LX_COLL_Dermo_2025_EW file

--Correct sample number SLS dermo and repro
UPDATE [dbo].[Dermo] set OysterID = 'SLSD2503-15' where OysterID = 'SLSD2503-25'
UPDATE [dbo].[Repro] set OysterID = 'SLSD2503-15' where OysterID = 'SLSD2503-25'

--Remove example trips
DELETE from [dbo].TripInfo where TripID = 'CRCOLL_20250401_1'
DELETE from [dbo].TripInfo where TripID = 'CRCAGE_20250401_1'
DELETE from [dbo].TripInfo where TripID = 'LWSDTP_20250401_1'

--April DERMO: SL,LX,LW,CR
UPDATE [dbo].Dermo set TotalWeight = '18.59' where OysterID = 'SLSD2504-05'

--April SDTP: LW 
--April RCRT: SL, LW, LX, CR, TB
UPDATE [dbo].[SampleEventWQ] set TurbidityHach = '9.41' where SampleEventWQID = 'TBRCRT_20250422_1_0529_1_02'

--April Cages
DELETE from [dbo].CageCount where SampleEventID like 'CRCAGE_20250401%'
DELETE from [dbo].CageSH where CageCountID like 'CRCAGE_20250401%'
INSERT INTO [dbo].[CageSH] (ShellHeightID, CageCountID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('CRCAGE_20250415_1_0232_1_R_Y_01', 'CRCAGE_20250415_1_0232_1_R_Y', 'Z', 'Proofed', '2025-04-25 00:00:00', 'Erica Williams', '2025-04-25 00:00:00', 'Erica Williams', NULL, NULL, 'Entered vis SMSS', NULL)

EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-01-01', @CheckEnd = '2025-03-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
--EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-01-01', @CheckEnd = '2025-03-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams'; --Not running due to LH extra samples.
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-01-01', @CheckEnd = '2025-03-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-01-01', @CheckEnd = '2025-03-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2025-04-01', @CheckEnd = '2025-04-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-04-01', @CheckEnd = '2025-04-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-04-01', @CheckEnd = '2025-04-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-04-01', @CheckEnd = '2025-04-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-04-01', @CheckEnd = '2025-04-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-04-01', @CheckEnd = '2025-04-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-04-01', @CheckEnd = '2025-04-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-04-01', @CheckEnd = '2025-04-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-04-01', @CheckEnd = '2025-04-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';