-- Fix SH / Count data
UPDATE hsdb.SurveySH
Set ShellHeight = 44
WHERE ShellHeightID = 'ABSRVY_20160524_1_0045_1_04_001'

-- Add comments for null and out of range values in WQ

GO
UPDATE hsdb.SampleEventWQ
SET Comments =
	CASE
WHEN SampleEventWQID = 'ABSRVY_20160512_1_0050_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20160512_1_0070_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20160523_1_0051_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20160523_1_0052_1_01' THEN 'DO and pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20160523_1_0053_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20160523_1_0054_1_01' THEN 'DO and pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20160512_1_0028_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160512_1_0029_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160512_1_0030_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160512_1_0031_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160512_1_0032_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160512_1_0033_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160512_1_0034_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160512_1_0036_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160512_1_0037_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160512_1_0058_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160512_1_0059_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160512_1_0060_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160512_1_0061_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160512_1_0068_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160512_1_0069_1_01' THEN 'No WQ recorded except depth, depth outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20160512_1_0071_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160523_1_0055_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160523_1_0077_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160523_1_0078_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160523_1_0079_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160523_1_0081_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160523_1_0082_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160524_1_0043_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160524_1_0046_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160524_1_0115_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160524_1_0116_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160524_1_0117_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160524_1_0118_1_01' THEN 'No WQ recorded except depth'
WHEN SampleEventWQID = 'ABSRVY_20160524_1_0138_1_01' THEN 'No WQ recorded except depth'

ELSE Comments
END;
GO

-- Add comments for out of range values in Survey Quadrat

GO
UPDATE hsdb.SurveyQuadrat
SET Comments =
	CASE
WHEN QuadratID = 'ABSRVY_20160512_1_0039_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160512_1_0039_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160512_1_0050_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160512_1_0063_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160512_1_0064_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160512_1_0066_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160512_1_0066_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160523_1_0057_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160523_1_0057_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160523_1_0072_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160523_1_0072_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160523_1_0072_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160523_1_0073_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160523_1_0073_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160523_1_0073_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160523_1_0073_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160523_1_0074_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160523_1_0074_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160523_1_0074_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160523_1_0074_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160523_1_0074_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160523_1_0075_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160523_1_0075_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160523_1_0076_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160524_1_0042_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160524_1_0045_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160524_1_0112_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160524_1_0112_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160524_1_0112_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160524_1_0114_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160524_1_0115_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160524_1_0115_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160524_1_0117_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160524_1_0117_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160524_1_0117_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20160524_1_0117_1_05' THEN 'Weight to volume ratio outside expected range'

ELSE Comments
END;
GO
