-- Fix SampleEvent Locations

UPDATE hsdb.SampleEvent
Set LongitudeDec = -84.8491
WHERE SampleEventID = 'ABSRVY_20160623_1_0126_1'

UPDATE hsdb.SampleEvent
Set LongitudeDec = -84.79855
WHERE SampleEventID = 'ABSRVY_20160623_1_0149_1'

UPDATE hsdb.SampleEvent
Set LongitudeDec = -85.05497
WHERE SampleEventID = 'ABSRVY_20160628_1_0196_1';

-- Add comments for null and out of range values in WQ

GO
UPDATE hsdb.SampleEventWQ
SET Comments =
	CASE
WHEN SampleEventWQID = 'ABSRVY_20160623_1_0128_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160623_1_0132_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160623_1_0136_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160623_1_0137_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160623_1_0141_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160623_1_0142_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160623_1_0149_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160623_1_0150_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160623_1_0151_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160623_1_0152_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160627_1_0210_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160627_1_0211_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160627_1_0212_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160627_1_0223_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160627_1_0109_1_01' THEN 'No WQ recorded except depth; depth outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20160627_1_0119_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160627_1_0120_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160627_1_0122_1_01' THEN 'No WQ recorded except depth; depth outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20160627_1_0124_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160628_1_0191_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160628_1_0202_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160628_1_0203_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160628_1_0205_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160628_1_0224_1_01' THEN 'No WQ recorded except depth; depth outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20160628_1_0225_1_01' THEN 'No WQ recorded except depth; depth outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20160629_1_0168_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160629_1_0169_1_01' THEN 'pH not recorded, salinity outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20160629_1_0170_1_01' THEN 'pH not recorded, salinity outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20160629_1_0171_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160629_1_0172_1_01' THEN 'pH not recorded, salinity outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20160629_1_0174_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160629_1_0175_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSRVY_20160629_1_0177_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160629_1_0179_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160629_1_0180_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160629_1_0181_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160629_1_0182_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSRVY_20160629_1_0183_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160629_1_0218_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSRVY_20160629_1_0219_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSRVY_20160712_1_0173_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160712_1_0184_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160712_1_0185_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160712_1_0186_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160712_1_0192_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160712_1_0193_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160712_1_0194_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160712_1_0195_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160712_1_0215_1_01' THEN 'DO outside expected range'
ELSE Comments
END;
GO

-- Add comments for out of range values in Survey Quadrat

GO
UPDATE hsdb.SurveyQuadrat
SET Comments =
	CASE
WHEN QuadratID = 'ABSRVY_20160623_1_0126_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160623_1_0143_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160623_1_0145_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160623_1_0146_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160623_1_0147_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160623_1_0147_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160623_1_0147_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160627_1_0214_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160627_1_0214_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160627_1_0214_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160627_1_0216_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160627_1_0216_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160627_1_0108_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160627_1_0108_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160627_1_0110_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160627_1_0139_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160627_1_0139_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160627_1_0140_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160628_1_0198_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160628_1_0201_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160628_1_0209_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160712_1_0190_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160712_1_0190_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160712_1_0215_1_05' THEN 'Weight to volume ratio outside expected range'

	ELSE Comments
END;
GO