--Database Errors
--Delete a duplicate record from SurveyQuadrat
delete T
from 
(
	select 
	* ,
	DupRank = ROW_NUMBER() OVER (
				  PARTITION BY QuadratID
				  ORDER BY (SELECT NULL)
				)
	from SurveyQuadrat
)
AS T
where DupRank > 1 and QuadratID like 'AB%'


-- SampleEvent fixes
update SampleEvent
set LatitudeDec = 29.68045, LongitudeDec = -85.0578
where SampleEventID ='ABSRVY_20230418_1_0308_1'

-- WQ
update SampleEventWQ
set Comments = 'DO outside expected range'
where SampleEventWQID = 'ABSRVY_20230407_1_0016_1_02'

update SampleEventWQ
set Comments = 'Salinity and turbidity not recorded'
where SampleEventWQID = 'ABSRVY_20230418_1_0308_1_01'

-- Survey
-- Fixes
delete from SurveySH where ShellHeightID = 'ABSRVY_20230509_1_0011_1_15_002'

insert into SurveySH (
ShellHeightID,
QuadratID,
ShellHeight,
DataStatus,
DateEntered,
EnteredBy,
DateProofed,
ProofedBy
)
VALUES
(
'ABSRVY_20230407_1_0096_1_02_019',
'ABSRVY_20230407_1_0096_1_02',
25,
'Proofed',
'2023-04-24',
'Abigail Ladner',
'2024-01-12',
'Sarah Paulsen'
)

-- Comments

GO
UPDATE SurveyQuadrat
SET Comments =
	CASE

WHEN QuadratID = 'ABSRVY_20230330_1_0156_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230330_1_0156_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230330_1_0158_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230407_1_0016_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230407_1_0016_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230407_1_0016_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230407_1_0016_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230407_1_0096_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230407_1_0096_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230407_1_0098_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230407_1_0100_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230407_1_0100_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230418_1_0162_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230418_1_0162_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230418_1_0007_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230509_1_0024_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230509_1_0024_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230509_1_0024_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230509_1_0102_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0156_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0156_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0156_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0156_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0156_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0158_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0158_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0158_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0158_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0158_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0158_1_07' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0158_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0158_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0158_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0158_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0308_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0308_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0308_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0308_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0308_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0162_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0162_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0162_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0162_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0162_1_07' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0162_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0162_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0162_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0162_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0162_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0167_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0167_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0167_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0167_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0167_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0167_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0167_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0016_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0016_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0016_1_07' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0016_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0016_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0016_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0016_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0019_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0019_1_07' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0019_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230907_1_0019_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230908_1_0007_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230908_1_0007_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20230908_1_0011_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20231010_1_0091_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20231010_1_0096_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20231010_1_0096_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20231010_1_0098_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20231010_1_0098_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20231010_1_0102_1_14' THEN 'Weight to volume ratio outside expected range'

ELSE Comments
END;
GO





