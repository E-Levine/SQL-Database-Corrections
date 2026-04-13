use [Oysters_26-03-31]
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

-- Remove weird CR srvy data:
Delete from hsdb.SurveyQuadrat where SampleEventID like '_023__1'


--EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-10-01', @CheckEnd = '2026-03-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
--EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-10-01', @CheckEnd = '2026-03-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
--EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-10-01', @CheckEnd = '2026-03-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';