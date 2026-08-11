use [Oysters_26-08-11]
go

-- Dermo/Repro checks
-- 05/2023 All. Good
--09/2023 LW
update SampleEventWQ set Comments = 'Temperature not taken' where SampleEventWQID = 'LWCOLL_20230905_1_0240_1_01'
-- 10/2023 All.
update SampleEvent set DataStatus = 'Proofed', DateProofed = '2026-08-11 00:00:00.0000000', ProofedBy = 'Erica Williams' where SampleEventID = 'SLCOLL_20231004_1_0600_1'
update SampleEventWQ set Comments = 'Salinity value confirmed' where SampleEventWQID = 'SLCOLL_20231004_1_0271_1_01'
update SampleEventWQ set Comments = 'pH value confirmed' where SampleEventWQID = 'CRCOLL_20231010_1_0230_1_01'
update SampleEventWQ set 
	Temperature = 26.9,
	Salinity = 0.35,
	DissolvedOxygen = 4.27,
	pH = 7.69,
	Depth = 0.90, 
	SampleDepth = 0.90,
	Secchi = 0.65, 
	TurbidityYSI = 4.95,
	TurbidityHach = 6.03,
	Comments = NULL,
	CollectionTime = '0913',
	PercentDissolvedOxygen = 52.5,
	DataStatus = 'Proofed', 
	DateProofed = '2026-08-11 00:00:00.0000000', 
	ProofedBy = 'Erica Williams' 
where SampleEventID = 'SLCOLL_20231004_1_0600_1'
--11/2023 LW. Good.
--01/2024 LW. Good.
--06/2026 TB. Dermo good.
--07/2026 TB. Dermo-sex ratio project.
update Dermo set Comments = CONCAT('Sex ratio project sample ', Comments) where OysterID like 'TBRD2607%'

--RCRT
--07/2026 TB Good.

--SRVY 
--10/2025 TB.
delete from SurveyQuadrat where QuadratID is NULL
update SurveyQuadrat set QuadratID = 'TBSRVY_20251023_1_T067_1_01',  QuadratNumber = 1, 
	DataStatus = 'Proofed', DateProofed = '2026-08-11 00:00:00.0000000', ProofedBy = 'Erica Williams' where SampleEventID = 'TBSRVY_20251023_1_T067_1'
update SurveyQuadrat set QuadratID = 'TBSRVY_20251023_1_T069_1_01', QuadratNumber = 1, 
	DataStatus = 'Proofed', DateProofed = '2026-08-11 00:00:00.0000000', ProofedBy = 'Erica Williams' where SampleEventID = 'TBSRVY_20251023_1_T069_1'
update SurveyQuadrat set QuadratID = 'TBSRVY_20251023_1_T072_1_01', QuadratNumber = 1, 
	DataStatus = 'Proofed', DateProofed = '2026-08-11 00:00:00.0000000', ProofedBy = 'Erica Williams' where SampleEventID = 'TBSRVY_20251023_1_T072_1'
update SurveyQuadrat set QuadratID = 'TBSRVY_20251023_1_T073_1_01', QuadratNumber = 1, 
	DataStatus = 'Proofed', DateProofed = '2026-08-11 00:00:00.0000000', ProofedBy = 'Erica Williams' where SampleEventID = 'TBSRVY_20251023_1_T073_1' 
update SurveyQuadrat set QuadratID = 'TBSRVY_20251023_1_T074_1_01', QuadratNumber = 1, 
	DataStatus = 'Proofed', DateProofed = '2026-08-11 00:00:00.0000000', ProofedBy = 'Erica Williams' where SampleEventID = 'TBSRVY_20251023_1_T074_1' 
update SurveyQuadrat set QuadratID = 'TBSRVY_20251023_1_T075_1_01', QuadratNumber = 1, 
	DataStatus = 'Proofed', DateProofed = '2026-08-11 00:00:00.0000000', ProofedBy = 'Erica Williams' where SampleEventID = 'TBSRVY_20251023_1_T075_1' 
update SurveyQuadrat set QuadratID = 'TBSRVY_20251023_1_T076_1_01', QuadratNumber = 1, 
	DataStatus = 'Proofed', DateProofed = '2026-08-11 00:00:00.0000000', ProofedBy = 'Erica Williams' where SampleEventID = 'TBSRVY_20251023_1_T076_1' 
update SurveyQuadrat set QuadratID = 'TBSRVY_20251023_1_T077_1_01', QuadratNumber = 1, 
	DataStatus = 'Proofed', DateProofed = '2026-08-11 00:00:00.0000000', ProofedBy = 'Erica Williams' where SampleEventID = 'TBSRVY_20251023_1_T077_1' 
update SurveySH set QuadratID = 'TBSRVY_20251023_1_T067_1_01', DataStatus = 'Proofed', DateProofed = '2026-08-11 00:00:00.0000000', ProofedBy = 'Erica Williams' where ShellHeightID = 'TBSRVY_20251023_1_T067_1_00_001'
update SurveySH set ShellHeightID = 'TBSRVY_20251023_1_T067_1_01_001' where QuadratID = 'TBSRVY_20251023_1_T067_1_01'
update SurveySH set QuadratID = 'TBSRVY_20251023_1_T069_1_01', DataStatus = 'Proofed', DateProofed = '2026-08-11 00:00:00.0000000', ProofedBy = 'Erica Williams' where ShellHeightID = 'TBSRVY_20251023_1_T069_1_00_001'
update SurveySH set ShellHeightID = 'TBSRVY_20251023_1_T069_1_01_001' where QuadratID = 'TBSRVY_20251023_1_T069_1_01'
update SurveySH set QuadratID = 'TBSRVY_20251023_1_T072_1_01', DataStatus = 'Proofed', DateProofed = '2026-08-11 00:00:00.0000000', ProofedBy = 'Erica Williams' where ShellHeightID = 'TBSRVY_20251023_1_T072_1_00_001'
update SurveySH set ShellHeightID = 'TBSRVY_20251023_1_T072_1_01_001' where QuadratID = 'TBSRVY_20251023_1_T072_1_01'
update SurveySH set QuadratID = 'TBSRVY_20251023_1_T073_1_01', DataStatus = 'Proofed', DateProofed = '2026-08-11 00:00:00.0000000', ProofedBy = 'Erica Williams' where ShellHeightID = 'TBSRVY_20251023_1_T073_1_00_001'
update SurveySH set ShellHeightID = 'TBSRVY_20251023_1_T073_1_01_001' where QuadratID = 'TBSRVY_20251023_1_T073_1_01'
update SurveySH set QuadratID = 'TBSRVY_20251023_1_T074_1_01', DataStatus = 'Proofed', DateProofed = '2026-08-11 00:00:00.0000000', ProofedBy = 'Erica Williams' where ShellHeightID = 'TBSRVY_20251023_1_T074_1_00_001'
update SurveySH set ShellHeightID = 'TBSRVY_20251023_1_T074_1_01_001' where QuadratID = 'TBSRVY_20251023_1_T074_1_01'
update SurveySH set QuadratID = 'TBSRVY_20251023_1_T075_1_01', DataStatus = 'Proofed', DateProofed = '2026-08-11 00:00:00.0000000', ProofedBy = 'Erica Williams' where ShellHeightID = 'TBSRVY_20251023_1_T075_1_00_001'
update SurveySH set ShellHeightID = 'TBSRVY_20251023_1_T075_1_01_001' where QuadratID = 'TBSRVY_20251023_1_T075_1_01'
update SurveySH set QuadratID = 'TBSRVY_20251023_1_T076_1_01', DataStatus = 'Proofed', DateProofed = '2026-08-11 00:00:00.0000000', ProofedBy = 'Erica Williams' where ShellHeightID = 'TBSRVY_20251023_1_T076_1_00_001'
update SurveySH set ShellHeightID = 'TBSRVY_20251023_1_T076_1_01_001' where QuadratID = 'TBSRVY_20251023_1_T076_1_01'
update SurveySH set QuadratID = 'TBSRVY_20251023_1_T077_1_01', DataStatus = 'Proofed', DateProofed = '2026-08-11 00:00:00.0000000', ProofedBy = 'Erica Williams' where ShellHeightID = 'TBSRVY_20251023_1_T077_1_00_001'
update SurveySH set ShellHeightID = 'TBSRVY_20251023_1_T077_1_01_001' where QuadratID = 'TBSRVY_20251023_1_T077_1_01'


EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-05-01', @CheckEnd = '2023-05-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-05-01', @CheckEnd = '2023-05-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-05-01', @CheckEnd = '2023-05-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-05-01', @CheckEnd = '2023-05-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-09-01', @CheckEnd = '2023-11-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-10-01', @CheckEnd = '2023-10-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-10-01', @CheckEnd = '2023-10-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
--EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-10-01', @CheckEnd = '2023-10-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-01-01', @CheckEnd = '2024-01-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-07-01', @CheckEnd = '2026-02-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-07-01', @CheckEnd = '2026-07-28', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2025-10-01', @CheckEnd = '2025-10-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';