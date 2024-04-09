-- Fix Database Error

UPDATE hsdb.SurveyQuadrat
SET
SampleEventID = REPLACE(SampleEventID, 'ABSRVY_20160727_1_0162_1', 'ABSRVY_20160727_1_0162_2'),
QuadratID = REPLACE(QuadratID, 'ABSRVY_20160727_1_0162_1', 'ABSRVY_20160727_1_0162_2'),
AdminNotes = 'Second location sampled, Quadrat numbers left as sequential, only 5 quadrats at second location',
Comments = 'Second location sampled, Quadrat numbers left as sequential, only 5 quadrats at second location'
where QuadratID like 'ABSRVY_20160727_1_0162%' and QuadratNumber > 15

UPDATE hsdb.SurveySH
SET
ShellHeightID = REPLACE(ShellHeightID, 'ABSRVY_20160727_1_0162_1', 'ABSRVY_20160727_1_0162_2'),
QuadratID = REPLACE(QuadratID, 'ABSRVY_20160727_1_0162_1', 'ABSRVY_20160727_1_0162_2'),
AdminNotes = 'Second location sampled, Quadrat numbers left as sequential, only 5 quadrats at second location',
Comments = 'Second location sampled, Quadrat numbers left as sequential, only 5 quadrats at second location'
where QuadratID like 'ABSRVY_20160727_1_0162%' and cast(SUBSTRING(ShellHeightID, 26, 2) as INT) > 15

-- Fix SampleEvent Locations

UPDATE hsdb.SampleEvent
Set LongitudeDec = -84.8812
WHERE SampleEventID = 'ABSRVY_20170801_1_0090_1'

-- Add comments for null values in WQ

GO
UPDATE hsdb.SampleEventWQ
SET Comments =
	CASE
WHEN SampleEventWQID = 'ABSRVY_20160722_1_0090_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160722_1_0096_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160722_1_0098_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160722_1_0100_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160722_1_0102_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160722_1_0105_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160727_1_0155_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160727_1_0158_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160727_1_0160_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160727_1_0162_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160727_1_0162_2_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160727_1_0167_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160927_1_0007_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160927_1_0011_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160927_1_0016_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160927_1_0019_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160927_1_0024_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170502_1_0007_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170502_1_0011_1_01' THEN 'No WQ recorded'
WHEN SampleEventWQID = 'ABSRVY_20170502_1_0016_1_01' THEN 'No WQ recorded'
WHEN SampleEventWQID = 'ABSRVY_20170502_1_0019_1_01' THEN 'No WQ recorded'
WHEN SampleEventWQID = 'ABSRVY_20170502_1_0024_1_01' THEN 'No WQ recorded'
WHEN SampleEventWQID = 'ABSRVY_20170626_1_0090_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170626_1_0096_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170626_1_0098_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170626_1_0100_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170626_1_0102_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170626_1_0105_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170627_1_0155_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170627_1_0158_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170627_1_0160_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170627_1_0162_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170627_1_0167_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170801_1_0090_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170808_1_0096_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170808_1_0098_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170808_1_0100_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170808_1_0102_1_01' THEN 'No WQ recorded'
WHEN SampleEventWQID = 'ABSRVY_20170808_1_0105_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170811_1_0155_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170811_1_0158_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170811_1_0160_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170811_1_0162_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20170811_1_0167_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20171011_1_0007_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20171011_1_0011_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20171011_1_0016_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20171011_1_0019_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20171011_1_0024_1_01' THEN 'No WQ recorded except depth'
ELSE Comments
END;
GO

-- Add comments for out of range values in Survey Quadrat

GO
UPDATE hsdb.SurveyQuadrat
SET Comments =
	CASE
WHEN QuadratID = 'ABSRVY_20160722_1_0090_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160722_1_0090_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160722_1_0096_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160722_1_0098_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160722_1_0098_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160722_1_0100_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160722_1_0100_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160722_1_0102_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160727_1_0155_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160727_1_0155_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160727_1_0155_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160727_1_0167_1_07' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160727_1_0167_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160927_1_0011_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160927_1_0011_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160927_1_0011_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160927_1_0011_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160927_1_0011_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160927_1_0016_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160927_1_0016_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160927_1_0016_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160927_1_0016_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160927_1_0016_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160927_1_0024_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160927_1_0024_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160927_1_0024_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170502_1_0007_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170502_1_0007_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170502_1_0011_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170502_1_0019_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170502_1_0019_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170502_1_0024_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170502_1_0024_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170502_1_0024_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170626_1_0090_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170626_1_0090_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170626_1_0090_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170626_1_0090_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170626_1_0090_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170626_1_0098_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170626_1_0100_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170626_1_0100_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170626_1_0100_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170626_1_0100_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170626_1_0102_1_07' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170627_1_0158_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170627_1_0160_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170627_1_0162_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170627_1_0167_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170801_1_0090_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170808_1_0100_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170808_1_0100_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20170811_1_0158_1_09' THEN 'Weight outside expected range'
WHEN QuadratID = 'ABSRVY_20170811_1_0158_1_11' THEN 'Weight outside expected range'
WHEN QuadratID = 'ABSRVY_20170811_1_0158_1_13' THEN 'Weight and volume outside expected range'
WHEN QuadratID = 'ABSRVY_20170811_1_0167_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20171011_1_0016_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20171011_1_0019_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20171011_1_0019_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20171011_1_0019_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20171011_1_0019_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180504_1_0007_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180504_1_0011_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180504_1_0011_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180504_1_0011_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180504_1_0016_1_06' THEN 'Weight to volume ratio outside expected range'
ELSE Comments
END;
GO