-- Add comments for nulls and out of range values in WQ

GO
UPDATE hsdb.SampleEventWQ
SET Comments =
	CASE

WHEN SampleEventWQID = 'SASRVY_20220829_1_0359_1_01' THEN 'OY, negative turbidity, depth outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220829_1_0359_1_02' THEN 'OY, negative turbidity, depth outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220829_1_0360_1_01' THEN 'OY, negative turbidity, depth outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220829_1_0360_1_02' THEN 'OY, negative turbidity, depth and DO outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220829_1_0361_1_01' THEN 'OY, negative turbidity, depth outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220829_1_0361_1_02' THEN 'OY, negative turbidity, depth outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220829_1_0363_1_01' THEN 'MU, negative turbidity, depth outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220829_1_0363_1_02' THEN 'MU, negative turbidity, DO and depth outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220829_1_0371_1_01' THEN 'MU, negative turbidity, depth outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220829_1_0371_1_02' THEN 'MU, negative turbidity, depth outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220829_1_0373_1_02' THEN 'OY, negative turbidity, DO outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220829_1_0376_1_02' THEN 'OY, negative turbidity, DO outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220829_1_0377_1_02' THEN 'OY, negative turbidity, DO outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220830_1_0362_1_02' THEN 'MU, negative turbidity, DO outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220830_1_0364_1_01' THEN 'MU, negative turbidity, depth outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220830_1_0364_1_02' THEN 'MU, negative turbidity, DO and depth outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220830_1_0365_1_02' THEN 'MU, DO outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220830_1_0369_1_02' THEN 'MU, negative turbidity, DO outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220830_1_0370_1_02' THEN 'MU, negative turbidity, DO outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220914_1_0335_1_01' THEN 'SA, ph outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220914_1_0341_1_01' THEN 'MU, ph outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220914_1_0341_1_02' THEN 'MU, ph outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220914_1_0343_1_01' THEN 'OY, ph outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220914_1_0343_1_02' THEN 'OY, ph outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220914_1_0345_1_01' THEN 'MU, ph outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220914_1_0345_1_02' THEN 'MU, DO and pH outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220914_1_0348_1_01' THEN 'OY, ph outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220914_1_0348_1_02' THEN 'OY, DO and pH outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220921_1_0349_1_02' THEN 'SA, DO outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220921_1_0351_1_02' THEN 'OY, DO outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220921_1_0356_1_02' THEN 'SA, Lease, DO outside expected range'
WHEN SampleEventWQID = 'SASRVY_20220921_1_0358_1_02' THEN 'OY, DO outside expected range; Bad place for spat traps'
WHEN SampleEventWQID = 'SASRVY_20220921_1_0357_1_01' THEN 'OY, Lease, No WQ taken'
WHEN SampleEventWQID = 'SASRVY_20220914_1_0347_1_01' THEN 'OY, dive cut short by diver (stung), No WQ taken'

ELSE Comments
END;
GO

-- Add comments for out of range values in Survey Quadrat

GO
UPDATE hsdb.SurveyQuadrat
SET Comments =
	CASE

WHEN QuadratID = 'SASRVY_20220829_1_0360_1_05' THEN 'Small sample weights, out of range weight to volume ratios'
WHEN QuadratID = 'SASRVY_20220829_1_0361_1_02' THEN 'Small sample weights, out of range weight to volume ratios'
WHEN QuadratID = 'SASRVY_20220829_1_0372_1_02' THEN 'out of range weight to volume ratios'
WHEN QuadratID = 'SASRVY_20220829_1_0375_1_01' THEN 'Small sample weights, out of range weight to volume ratios'
WHEN QuadratID = 'SASRVY_20220829_1_0375_1_03' THEN 'Small sample weights, out of range weight to volume ratios'
WHEN QuadratID = 'SASRVY_20220829_1_0378_1_03' THEN 'Small sample weights, out of range weight to volume ratios'
WHEN QuadratID = 'SASRVY_20220829_1_0378_1_04' THEN 'Small sample weights, out of range weight to volume ratios'
WHEN QuadratID = 'SASRVY_20220830_1_0367_1_01' THEN 'Small sample weights, out of range weight to volume ratios'
WHEN QuadratID = 'SASRVY_20220914_1_0350_1_03' THEN 'Small sample weights, out of range weight to volume ratios'
WHEN QuadratID = 'SASRVY_20220921_1_0357_1_02' THEN 'Small sample weights, out of range weight to volume ratios'
WHEN QuadratID = 'SASRVY_20220921_1_0357_1_03' THEN 'Small sample weights, out of range weight to volume ratios'
WHEN QuadratID = 'SASRVY_20220921_1_0357_1_04' THEN 'Small sample weights, out of range weight to volume ratios'
WHEN QuadratID = 'SASRVY_20220921_1_0357_1_05' THEN 'Small sample weights, out of range weight to volume ratios'
WHEN QuadratID = 'SASRVY_20220921_1_0358_1_02' THEN 'Small sample weights, out of range weight to volume ratios'
WHEN QuadratID = 'SASRVY_20220921_1_0358_1_03' THEN 'Small sample weights, out of range weight to volume ratios'
WHEN QuadratID = 'SASRVY_20220921_1_0358_1_05' THEN 'Small sample weights, out of range weight to volume ratios'

ELSE Comments
END;
GO