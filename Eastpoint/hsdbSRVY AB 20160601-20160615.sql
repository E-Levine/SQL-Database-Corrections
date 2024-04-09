
-- Add comments for null and out of range values in WQ
update hsdb.SampleEventWQ set Comments = 'WQ not recorded' 
where SampleEventWQID like 'ABSRVY_20160609%' or SampleEventWQID like 'ABSRVY_20160613%'


-- Add comments for null and out of range values in Survey Quadrat

GO
UPDATE hsdb.SurveyQuadrat
SET Comments =
	CASE
	
WHEN QuadratID = 'ABSRVY_20160609_1_0096_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160609_1_0096_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160609_1_0096_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160609_1_0098_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160609_1_0100_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160609_1_0102_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160609_1_0102_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160609_1_0102_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160609_1_0102_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160609_1_0105_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160609_1_0105_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160609_1_0105_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160609_1_0105_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160613_1_0155_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160613_1_0158_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160613_1_0158_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160613_1_0162_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160613_1_0162_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160613_1_0162_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160613_1_0167_1_12' THEN 'Weight to volume ratio outside expected range'

ELSE Comments
END;
GO