---Database corrections St Pete 2024/01/04 - E Levine
Use [Oysters_24-05-15]
go

--Jan-Apr RCRT 
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


EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-01-01', @CheckEnd = '2024-04-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-01-01', @CheckEnd = '2024-04-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-01-01', @CheckEnd = '2024-04-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-01-01', @CheckEnd = '2024-04-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-01-01', @CheckEnd = '2024-04-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2023-01-01', @CheckEnd = '2024-05-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
