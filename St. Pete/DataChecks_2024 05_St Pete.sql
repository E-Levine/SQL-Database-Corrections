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

UPDATE [dbo].[SampleEventWQ]
set [Comments] = CONCAT(Comments, case when Comments is null then 'DO correct' else ', DO correct' end)
where [SampleEventWQID] like 'TBRCRT_20240118_1_0278_1_01'

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
 

EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-01-01', @CheckEnd = '2024-04-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-01-01', @CheckEnd = '2024-04-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-01-01', @CheckEnd = '2024-04-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-01-01', @CheckEnd = '2024-04-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-01-01', @CheckEnd = '2024-04-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
