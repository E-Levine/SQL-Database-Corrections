---Database corrections St Pete 2024/05/04 - E Levine
Use [Oysters_24-05-30]
go

--Jan-May RCRT 
-- SL,LW, CR Checks
--No issues

--LX 
--Remove incorrect trip date
DELETE FROM [dbo].[TripInfo]
WHERE [TripID] like 'LXRCRT_20240213%' 

--TB
--Remove sta 7 & 8 from 1/18/24 - collected 1/23/24; update missing count
DELETE FROM [dbo].[SampleEvent]
WHERE [SampleEventID] like 'TBRCRT_20240118_1_0528%' or [SampleEventID] like 'TBRCRT_20240118_1_0529%' 
DELETE FROM [dbo].[SampleEventWQ]
WHERE [SampleEventID] like 'TBRCRT_20240118_1_0528%' or [SampleEventID] like 'TBRCRT_20240118_1_0529%' 
DELETE FROM [dbo].[Recruitment]
WHERE [SampleEventID] like 'TBRCRT_20240118_1_0528%' or [SampleEventID] like 'TBRCRT_20240118_1_0529%' 

UPDATE [dbo].[Recruitment]
SET [NumBottom] = 0
WHERE [SampleEventID] like 'TBRCRT_20240326_1_0527%'and [ShellReplicate] = '3' and [ShellPosition] = 5

---Update comments for correct data, DOPct when missing
UPDATE [dbo].[SampleEventWQ]
set [Comments] = CONCAT(Comments, case when Comments is null then 'DO correct' else ', DO correct' end)
where [SampleEventWQID] like 'TBRCRT_20240118_1_0278_1_01'

UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 121.4 where [SampleEventWQID] like 'TBRCRT_20240118_1_0278_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 114.8 where [SampleEventWQID] like 'TBRCRT_20240118_1_0277_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 105.7 where [SampleEventWQID] like 'TBRCRT_20240118_1_0527_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 105 where [SampleEventWQID] like 'TBRCRT_20240123_1_0528_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 103.4 where [SampleEventWQID] like 'TBRCRT_20240227_1_0527_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 110.7 where [SampleEventWQID] like 'TBRCRT_20240227_1_0528_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 105.6 where [SampleEventWQID] like 'TBRCRT_20240227_1_0529_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 114.8 where [SampleEventWQID] like 'TBRCRT_20240227_1_0529_1_02'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 106.2 where [SampleEventWQID] like 'TBRCRT_20240326_1_0277_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 103.2 where [SampleEventWQID] like 'TBRCRT_20240326_1_0528_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 112.8 where [SampleEventWQID] like 'TBRCRT_20240326_1_0529_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 112 where [SampleEventWQID] like 'TBRCRT_20240326_1_0529_1_02'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 104.9 where [SampleEventWQID] like 'TBRCRT_20240423_1_0527_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 104.6 where [SampleEventWQID] like 'TBRCRT_20240423_1_0529_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 104.1 where [SampleEventWQID] like 'TBRCRT_20240423_1_0529_1_02'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 105.0 where [SampleEventWQID] like 'TBRCRT_20240521_1_0277_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 109.3 where [SampleEventWQID] like 'TBRCRT_20240521_1_0528_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 112.8 where [SampleEventWQID] like 'TBRCRT_20240521_1_0529_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 113.4 where [SampleEventWQID] like 'TBRCRT_20240521_1_0529_1_02'

UPDATE [dbo].[Recruitment] set NumBottom = 82 where [ShellID] like 'TBRCRT_20240521_1_0528_1_25'
UPDATE [dbo].[Recruitment] set NumBottom = 32 where [ShellID] like 'TBRCRT_20240521_1_0528_1_26'
UPDATE [dbo].[Recruitment] set NumBottom = 29 where [ShellID] like 'TBRCRT_20240521_1_0528_1_27'
UPDATE [dbo].[Recruitment] set NumBottom = 90 where [ShellID] like 'TBRCRT_20240521_1_0528_1_28'
UPDATE [dbo].[Recruitment] set NumBottom = 45 where [ShellID] like 'TBRCRT_20240521_1_0528_1_29'
UPDATE [dbo].[Recruitment] set NumBottom = 20 where [ShellID] like 'TBRCRT_20240521_1_0528_1_30'
UPDATE [dbo].[Recruitment] set NumBottom = NULL where [ShellID] like 'TBRCRT_20240521_1_0528_1_31'
UPDATE [dbo].[Recruitment] set NumBottom = NULL where [ShellID] like 'TBRCRT_20240521_1_0528_1_32'
UPDATE [dbo].[Recruitment] set NumBottom = NULL where [ShellID] like 'TBRCRT_20240521_1_0528_1_33'
UPDATE [dbo].[Recruitment] set NumBottom = NULL where [ShellID] like 'TBRCRT_20240521_1_0528_1_34'
UPDATE [dbo].[Recruitment] set NumBottom = NULL where [ShellID] like 'TBRCRT_20240521_1_0528_1_35'
UPDATE [dbo].[Recruitment] set NumBottom = NULL where [ShellID] like 'TBRCRT_20240521_1_0528_1_36'


--2023 Survey data
--TB
--Remove duplicate rows of data
DELETE T FROM (
	SELECT * , DupRank = ROW_NUMBER() OVER (PARTITION BY ShellHeightID ORDER BY (SELECT NULL))
	FROM SurveySH) AS T
WHERE DupRank > 1 and ShellHeightID like 'TB%'

--Add comments to stations without oysters
UPDATE [dbo].[SurveyQuadrat]
set [Comments] = CONCAT(Comments, case when Comments is null then 'No oysters found' else ', No oysters found' end)
where [SampleEventID] like 'TBSRVY_20230627_1_T002%' or [SampleEventID] like 'TBSRVY_20230627_1_T003%' or [SampleEventID] like 'TBSRVY_20230627_1_T005%' or [SampleEventID] like 'TBSRVY_20230627_1_T008%' or [SampleEventID] like 'TBSRVY_20230627_1_T009%'or [SampleEventID] like 'TBSRVY_20230822_1_T013%'

--Update data status
UPDATE [dbo].[SurveyQuadrat]
set [DataStatus] = 'Proofed',
	[DateProofed] = '2024-05-17 00:00:00',
	[ProofedBy] = 'Erica Levine',
	[Comments] = ''
where [SampleEventID] like 'TBSRVY_20231221_1_0277%' or [QuadratID] like 'TBSRVY_20231221_1_0291%'

UPDATE [dbo].[SurveySH]
set [DataStatus] = 'Proofed',
	[DateProofed] = '2024-05-17 00:00:00',
	[ProofedBy] = 'Erica Levine',
	[Comments] = ''
where [QuadratID] like 'TBSRVY_20231221_1_0277%' or [QuadratID] like 'TBSRVY_20231221_1_0291%'

--Update SRVY DOPct data
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 100.3 where [SampleEventWQID] like 'TBSRVY_20230627_1_T007_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 107.8 where [SampleEventWQID] like 'TBSRVY_20230627_1_T010_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 146.4 where [SampleEventWQID] like 'TBSRVY_20230822_1_T019_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 129.8 where [SampleEventWQID] like 'TBSRVY_20231101_1_T023_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 117.5 where [SampleEventWQID] like 'TBSRVY_20231101_1_T024_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 137.9 where [SampleEventWQID] like 'TBSRVY_20231101_1_T026_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 104.3 where [SampleEventWQID] like 'TBSRVY_20231221_1_0278_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 206.5 where [SampleEventWQID] like 'TBSRVY_20230822_1_T018_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 112.5 where [SampleEventWQID] like 'TBSRVY_20231221_1_0277_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 115.2 where [SampleEventWQID] like 'TBSRVY_20231221_1_0527_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 104.9 where [SampleEventWQID] like 'TBSRVY_20240226_1_T029_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 143.8 where [SampleEventWQID] like 'TBSRVY_20240226_1_T030_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 144.3 where [SampleEventWQID] like 'TBSRVY_20240226_1_T032_1_01'

--Update comments to confirm data
UPDATE [dbo].[SurveyQuadrat]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data correct' else ', Data correct' end)
where [QuadratID] like 'TBSRVY_20230321_1_0278_1_05' or [QuadratID] like 'TBSRVY_20230321_1_0277_1_03' or [QuadratID] like 'TBSRVY_20230321_1_0277_1_04' or [QuadratID] like 'TBSRVY_20230321_1_0527_1_05' or [QuadratID] like 'TBSRVY_20230321_1_0528_1_04' or [QuadratID] like 'TBSRVY_20230321_1_0529_1_04' or [QuadratID] like 'TBSRVY_20230627_1_T006_1_01' or [QuadratID] like 'TBSRVY_20230627_1_T006_1_04'  or [QuadratID] like 'TBSRVY_20230627_1_T006_1_05' or [QuadratID] like 'TBSRVY_20230627_1_T007_1_03' or [QuadratID] like 'TBSRVY_20231101_1_T023_1_02' or [QuadratID] like 'TBSRVY_20231101_1_T023_1_03' or [QuadratID] like 'TBSRVY_20231221_1_0527_1_03' or [QuadratID] like 'TBSRVY_20231221_1_0527_1_04' or [QuadratID] like 'TBSRVY_20231227_1_0528_1_02' or [QuadratID] like 'TBSRVY_20231227_1_0529_1_02' or [QuadratID] like 'TBSRVY_20240226_1_T031_1_%' or [QuadratID] like 'TBSRVY_20240326_1_0278_1_04' or [QuadratID] like 'TBSRVY_20240326_1_0527_1_03'

UPDATE [dbo].[SurveySH]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data correct' else ', Data correct' end)
where [ShellHeightID] like 'TBSRVY_20230627_1_T006_1_01_001'

--Update Live count
UPDATE [dbo].[SurveyQuadrat]
set NumLive = 7 
where [QuadratID] like 'TBSRVY_20230822_1_T018_1_03'

--CR SRVY data
UPDATE [dbo].[SurveyQuadrat]
set [QuadratID] = 'CRSRVY_20230914_1_C009_1_01',
	[QuadratNumber] = 1,
	[DateEntered] = '2024-05-28 00:00:00',
	[EnteredBy] = 'Erica Levine'
where [SampleEventID] like 'CRSRVY_20230914_1_C009_1'
UPDATE [dbo].[SurveySH]
set [DataStatus] = 'Proofed',
	[DateProofed] = '2024-05-28 00:00:00',
	[ProofedBy] = 'Erica Levine'
where [QuadratID] like 'CRSRVY_20230914_1_C009_1_01'

--Remove duplicate rows of data
DELETE T FROM (
	SELECT * , DupRank = ROW_NUMBER() OVER (PARTITION BY ShellHeightID ORDER BY (SELECT NULL))
	FROM SurveySH) AS T
WHERE DupRank > 1 and ShellHeightID like 'CR%'
DELETE T FROM (
	SELECT * , DupRank = ROW_NUMBER() OVER (PARTITION BY QuadratID ORDER BY (SELECT NULL))
	FROM SurveyQuadrat) AS T
WHERE DupRank > 1 and QuadratID like 'CRSRVY_20230613_1_0232_1_02%'

--Update SRVY DOPct data
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 101.8 where [SampleEventWQID] like 'CRSRVY_20230110_1_0232_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 112.2 where [SampleEventWQID] like 'CRSRVY_20230613_1_C001_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 102.5 where [SampleEventWQID] like 'CRSRVY_20230620_1_C005_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 104.7 where [SampleEventWQID] like 'CRSRVY_20230620_1_C007_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 140.9 where [SampleEventWQID] like 'CRSRVY_20230620_1_C008_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 105.3 where [SampleEventWQID] like 'CRSRVY_20240221_1_C032_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 106.6 where [SampleEventWQID] like 'CRSRVY_20240221_1_C033_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 103.8 where [SampleEventWQID] like 'CRSRVY_20240221_1_C034_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 106.4 where [SampleEventWQID] like 'CRSRVY_20240221_1_C035_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 107.1 where [SampleEventWQID] like 'CRSRVY_20240221_1_C036_1_01'

--Update comments to confirm data
UPDATE [dbo].[SurveyQuadrat]
set [Comments] = CONCAT(Comments, case when Comments is null then 'No TIG SRVY' else ', No TIG SRVY' end)
where [QuadratID] like 'CRSRVY_20230110_1%' 

UPDATE [dbo].[SurveyQuadrat]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data correct' else ', Data correct' end)
where [QuadratID] like 'CRSRVY_20230912_1_0230_1_12' or [QuadratID] like 'CRSRVY_20231030_1_C022_1_01' or [QuadratID] like 'CRSRVY_20240312_1_0232_1_13'

UPDATE [dbo].[SurveySH] set [ShellHeight] = 19 where [ShellHeightID] like 'CRSRVY_20231030_1_C022_1_02_011'

UPDATE [dbo].[SurveyQuadrat]
set [Comments] = CONCAT(Comments, case when Comments is null then 'SHs 42-50 not measured' else ', SHs 42-50 not measured' end)
where [QuadratID] like 'CRSRVY_20230613_1_0231_1_11' 
UPDATE [dbo].[SurveyQuadrat] set [NumLive] = 24 where [QuadratID] like 'CRSRVY_20231219_1_0231_1_15' 
UPDATE [dbo].[SurveyQuadrat] set [NumLive] = 25 where [QuadratID] like 'CRSRVY_20240312_1_0233_1_14' 
INSERT INTO [dbo].[SurveySH](ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy)
VALUES  ('CRSRVY_20240312_1_0230_1_11_014', 'CRSRVY_20240312_1_0230_1_11', 14, 'Proofed', '2024-05-28 00:00:00', 'Erica Levine', '2024-05-28 00:00:00', 'Erica Levine'),
	('CRSRVY_20240312_1_0230_1_12_014', 'CRSRVY_20240312_1_0230_1_12', 14, 'Proofed', '2024-05-28 00:00:00', 'Erica Levine', '2024-05-28 00:00:00', 'Erica Levine')

--SL 2023 Survey data
--Remove duplicate rows of data
DELETE T FROM (
	SELECT * , DupRank = ROW_NUMBER() OVER (PARTITION BY ShellHeightID ORDER BY (SELECT NULL))
	FROM SurveySH) AS T
WHERE DupRank > 1 and ShellHeightID like 'SL%'
DELETE T FROM (
	SELECT * , DupRank = ROW_NUMBER() OVER (PARTITION BY QuadratID ORDER BY (SELECT NULL))
	FROM SurveyQuadrat) AS T
WHERE DupRank > 1 and QuadratID like 'SL%'

--Add comment for no oysters
UPDATE [dbo].[SurveyQuadrat]
set [Comments] = CONCAT(Comments, case when Comments is null then 'No oysters found' else ', No oysters found' end)
where [SampleEventID] like 'SLSRVY_20230523_1_L020_1_01%' or [SampleEventID] like 'SLSRVY_20230523_1_L022_1_01%' or [SampleEventID] like 'SLSRVY_20230523_1_L024_1_01%' or [SampleEventID] like 'SLSRVY_20230523_1_L025_1_01%' or [SampleEventID] like 'SLSRVY_20230523_1_L026_1_01%' or [SampleEventID] like 'SLSRVY_20230523_1_L027_1_01%' or [SampleEventID] like 'SLSRVY_20230523_1_L029_1_01' or [SampleEventID] like 'SLSRVY_20230523_1_L030_1_01' or [SampleEventID] like 'SLSRVY_20230523_1_L033_1_01'
--Add comment for SL Random SRVY with only 1 quad
UPDATE [dbo].[SurveyQuadrat]
set [Comments] = CONCAT(Comments, case when Comments is null then 'SL random SRVY-only 1 quad' else ', SL random SRVY-only 1 quad' end)
where [SampleEventID] like 'SLSRVY_20230523_1_L0%'
UPDATE [dbo].[SampleEventWQ]
set [Comments] = CONCAT(Comments, case when Comments is null then 'No WQ collected' else ', No WQ collected' end)
where [SampleEventWQID] like 'SLSRVY_20230523_1_L035_1_01%'

UPDATE [dbo].[SurveySH] set ShellHeight = 32 where [ShellHeightID] like 'SLSRVY_20230906_1_0257_1_14_003'
UPDATE [dbo].[SurveySH] set ShellHeight = 44 where [ShellHeightID] like 'SLSRVY_20230906_1_0257_1_14_004'
UPDATE [dbo].[SurveySH] set ShellHeight = 43 where [ShellHeightID] like 'SLSRVY_20230906_1_0257_1_14_005'
UPDATE [dbo].[SurveySH] set ShellHeight = 56 where [ShellHeightID] like 'SLSRVY_20230906_1_0257_1_14_010'
UPDATE [dbo].[SurveySH] set ShellHeight = 63 where [ShellHeightID] like 'SLSRVY_20240306_1_0255_1_09_006'
UPDATE [dbo].[SurveySH] set ShellHeight = 24 where [ShellHeightID] like 'SLSRVY_20240306_1_0257_1_01_002'


UPDATE [dbo].[SurveySH]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data correct' else ', Data correct' end)
where [ShellHeightID] like 'SLSRVY_20230523_1_L012_1_01_006' or [ShellHeightID] like 'SLSRVY_20240306_1_0271_1_11_010'

DELETE FROM [dbo].[SurveySH] WHERE [ShellHeightID] like 'SLSRVY_20230523_1_L007_1_01_002%' or [ShellHeightID] like 'SLSRVY_20230523_1_L007_1_01_003%' or [ShellHeightID] like 'SLSRVY_20230523_1_L007_1_01_004%' or [ShellHeightID] like 'SLSRVY_20230523_1_L007_1_01_005%' 
DELETE FROM [dbo].[SurveySH] WHERE [ShellHeightID] like 'SLSRVY_20230523_1_L008_1_01_006%' or [ShellHeightID] like 'SLSRVY_20230523_1_L008_1_01_007%' or [ShellHeightID] like 'SLSRVY_20230523_1_L008_1_01_008%' or [ShellHeightID] like 'SLSRVY_20230523_1_L008_1_01_009%'
DELETE FROM [dbo].[SurveySH] WHERE [ShellHeightID] like 'SLSRVY_20230523_1_L010_1_01_002%' or [ShellHeightID] like 'SLSRVY_20230523_1_L010_1_01_003%' or [ShellHeightID] like 'SLSRVY_20230523_1_L010_1_01_004%' or [ShellHeightID] like 'SLSRVY_20230523_1_L010_1_01_005' or [ShellHeightID] like 'SLSRVY_20230523_1_L010_1_01_006%' or [ShellHeightID] like 'SLSRVY_20230523_1_L010_1_01_007%' or [ShellHeightID] like 'SLSRVY_20230523_1_L010_1_01_008%' or [ShellHeightID] like 'SLSRVY_20230523_1_L010_1_01_009%' or [ShellHeightID] like 'SLSRVY_20230523_1_L010_1_01_010%'
DELETE FROM [dbo].[SurveySH] WHERE [ShellHeightID] like 'SLSRVY_20230523_1_L014_1_01_002%'
DELETE FROM [dbo].[SurveySH] WHERE [ShellHeightID] like 'SLSRVY_20230523_1_L016_1_01_001%'


--LW 2023 Survey data
--Remove duplicate rows of data
DELETE T FROM (
	SELECT * , DupRank = ROW_NUMBER() OVER (PARTITION BY ShellHeightID ORDER BY (SELECT NULL))
	FROM SurveySH) AS T
WHERE DupRank > 1 and ShellHeightID like 'LW%'
DELETE T FROM (
	SELECT * , DupRank = ROW_NUMBER() OVER (PARTITION BY QuadratID ORDER BY (SELECT NULL))
	FROM SurveyQuadrat) AS T
WHERE DupRank > 1 and QuadratID like 'LW%'

UPDATE [dbo].[SurveySH] set ShellHeight = 44 where [ShellHeightID] like 'LWSRVY_20230905_1_0312_1_15_010'
UPDATE [dbo].[SurveySH] set ShellHeight = 21 where [ShellHeightID] like 'LWSRVY_20240305_1_0240_1_10_002'

DELETE FROM [dbo].[TripInfo] WHERE [TripID] like 'LWSRVY_20230207_1%'


--LX 2023 Survey data
UPDATE [dbo].[SampleEventWQ]
set [Comments] = CONCAT(Comments, case when Comments is null then 'WQ same as dermo' else ', WQ same as dermo' end)
where [SampleEventWQID] like 'LXSRVY_20230906_1_0244_1_01%'

UPDATE [dbo].[SurveyQuadrat] set [NumLive] = 8 where [QuadratID] like 'LXSRVY_20230308_1_0247_1_02' 


--CR Sediment traps 04-05/2024 - no issues
--LW SDTP 
--Add in missing CrucibleDWs for May 2024
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 46.4 where [CupSampleID] like 'LWL2405-01-1'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = NULL where [CupSampleID] like 'LWL2405-01-2'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 45.5 where [CupSampleID] like 'LWL2405-01-3'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = NULL where [CupSampleID] like 'LWL2405-01-4'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 25.7 where [CupSampleID] like 'LWL2405-02-1'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 30.5 where [CupSampleID] like 'LWL2405-02-2'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 34.9 where [CupSampleID] like 'LWL2405-02-3'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 38.9 where [CupSampleID] like 'LWL2405-02-4'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 21.4 where [CupSampleID] like 'LWL2405-03-1'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 25.4 where [CupSampleID] like 'LWL2405-03-2'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 31.8 where [CupSampleID] like 'LWL2405-03-3'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 22.1 where [CupSampleID] like 'LWL2405-03-4'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 39.9 where [CupSampleID] like 'LWR2405-02-1'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 41.4 where [CupSampleID] like 'LWR2405-02-2'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 47.9 where [CupSampleID] like 'LWR2405-02-3'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 45.2 where [CupSampleID] like 'LWR2405-02-4'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 32.8 where [CupSampleID] like 'LWR2405-03-1'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 37.5 where [CupSampleID] like 'LWR2405-03-2'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 29.9 where [CupSampleID] like 'LWR2405-03-3'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 33.4 where [CupSampleID] like 'LWR2405-03-4'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 35.4 where [CupSampleID] like 'LWR2405-04-1'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 32.2 where [CupSampleID] like 'LWR2405-04-2'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 29.6 where [CupSampleID] like 'LWR2405-04-3'
UPDATE [dbo].[SedimentTrap] set [CrucibleDW] = 41.9 where [CupSampleID] like 'LWR2405-04-4'
--TB SDTP - no issues

EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-01-01', @CheckEnd = '2024-05-31', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-01-01', @CheckEnd = '2024-05-31', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-01-01', @CheckEnd = '2024-05-31', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-01-01', @CheckEnd = '2024-05-31', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-01-01', @CheckEnd = '2024-05-31', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2023-01-01', @CheckEnd = '2024-05-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2023-01-01', @CheckEnd = '2024-05-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2023-01-01', @CheckEnd = '2024-05-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2023-01-01', @CheckEnd = '2024-05-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2023-01-01', @CheckEnd = '2024-05-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-04-01', @CheckEnd = '2024-05-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-04-01', @CheckEnd = '2024-05-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-04-01', @CheckEnd = '2024-05-31', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
