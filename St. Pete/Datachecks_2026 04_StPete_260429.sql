use [Oysters] --COMPLETED 260429
go

-- Correct Cage station in CR for Feb 2026
UPDATE hsdb.CageCount SET 
    CageCountID = REPLACE(CageCountID, '0232', '0233'),
    SampleEventID = REPLACE(SampleEventID, '0232', '0233')
WHERE CageCountID LIKE 'CRCAGE_20260217_1_0232_%' OR CageCountID LIKE 'CRCAGE_20260113_1_0232_%' OR SampleEventID LIKE 'CRCAGE_20260217_1_0232_%' OR SampleEventID LIKE 'CRCAGE_20260113_1_0232_%';
UPDATE hsdb.CageSH SET 
    ShellHeightID = REPLACE(ShellHeightID, '0232', '0233'),
    CageCountID = REPLACE(CageCountID, '0232', '0233')
WHERE ShellHeightID LIKE 'CRCAGE_20260217_1_0232_%' OR ShellHeightID LIKE 'CRCAGE_20260113_1_0232_%' OR CageCountID LIKE 'CRCAGE_20260217_1_0232_%' OR CageCountID LIKE 'CRCAGE_20260113_1_0232_%';
-- Correct mismatched Comments
UPDATE target SET 
    target.Comments = source.Comments
FROM hsdb.CageCount AS target
JOIN hsdb.CageCount AS source
ON source.CageCountID = 'CRCAGE_20260217_1_0233_1_R_Y'
WHERE target.CageCountID like 'CRCAGE_20260217_1_0233_1_D%';

UPDATE target SET 
    target.Comments = source.Comments
FROM hsdb.CageCount AS target
JOIN hsdb.CageCount AS source
ON source.CageCountID = 'LXCAGE_20260106_1_0243_1_D_B'
WHERE target.CageCountID = 'LXCAGE_20260106_1_0243_1_R_B';

-- Remove weird/test CR srvy data:
Delete from hsdb.SurveyQuadrat where SampleEventID like '_023__1'
Delete from SurveyQuadrat where SampleEventID = 'CRSRVY_20260401_1_0230_1'
Delete from SurveySH where QuadratID like 'CRSRVY_20260401_1_0230_1%'

--CAGE Apr 2026: Correct LX Cage
Delete from CageSH where ShellHeightID = 'LXCAGE_20260413_1_0243_1_R_Y_26'
UPDATE CageSH set ShellHeight = 56 where ShellHeightID = 'LXCAGE_20260413_1_0243_1_R_Y_25'
UPDATE CageCount set TotalCount = 0 where CageCountID = 'LXCAGE_20260413_1_0243_1_R_R'
Delete from CageSH where ShellHeightID = 'CRCAGE_20260416_1_0231_1_R_B_30'

--SDTP, RCRT Apr 2026 - Good

--COLL Apr 2026, Repro Jan-Maar
UPDATE [dbo].[Dermo] set Comments = CONCAT('Sex ratio project sample ', Comments) where OysterID = 'LXND2602-16' or OysterID = 'LXND2602-17' or OysterID = 'LXND2602-18' or 
	OysterID = 'LXND2602-19' or OysterID like 'LXND2602-2%' or OysterID like 'LXND2602-3%' or OysterID like 'LXND2602-4%'


EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-10-01', @CheckEnd = '2026-03-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-10-01', @CheckEnd = '2026-03-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-10-01', @CheckEnd = '2026-03-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-04-01', @CheckEnd = '2026-04-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-04-01', @CheckEnd = '2026-04-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-04-01', @CheckEnd = '2026-04-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2026-04-01', @CheckEnd = '2026-04-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-04-01', @CheckEnd = '2026-04-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-04-01', @CheckEnd = '2026-04-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-04-01', @CheckEnd = '2026-04-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-04-01', @CheckEnd = '2026-04-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';