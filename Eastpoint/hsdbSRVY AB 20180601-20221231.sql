-- Fix data entry errors
update hsdb.SurveyQuadrat
set TotalVolume = 1.0 where QuadratID ='ABSRVY_20210323_1_0007_1_10'

update hsdb.SurveyQuadrat
set TotalWeight = 0.5 where QuadratID = 'ABSRVY_20210928_1_0011_1_08'

update hsdb.SurveyQuadrat
set TotalWeight = 0.4 where QuadratID = 'ABSRVY_20210928_1_0011_1_09'

update hsdb.SurveyQuadrat
set TotalWeight = 0.8 where QuadratID = 'ABSRVY_20220920_1_0011_1_02'

update hsdb.SurveyQuadrat
set TotalWeight = 0.4 where QuadratID = 'ABSRVY_20220922_1_0100_1_15'

update hsdb.SurveyQuadrat
set TotalWeight = 0.2 where QuadratID = 'ABSRVY_20220926_1_0167_1_02'

update hsdb.SurveyQuadrat
set NumLive = 1 where QuadratID = 'ABSRVY_20200618_1_0158_1_08'
OR QuadratID = 'ABSRVY_20200925_1_0011_1_11'
OR QuadratID = 'ABSRVY_20200927_1_0016_1_10'
OR QuadratID = 'ABSRVY_20201001_1_0156_1_13'
OR QuadratID = 'ABSRVY_20220308_1_0007_1_12'

-- Add comments for null and out of range values in WQ

GO
UPDATE hsdb.SampleEventWQ
SET Comments =
	CASE
WHEN SampleEventWQID = 'ABSRVY_20180607_1_0100_2_01' THEN 'No WQ recorded'
WHEN SampleEventWQID = 'ABSRVY_20180608_1_0167_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20180815_1_0090_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSRVY_20180816_1_0090_2_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSRVY_20180816_1_0096_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSRVY_20180816_1_0098_1_01' THEN 'DO outside expected range, pH not recorded'
WHEN SampleEventWQID = 'ABSRVY_20180816_1_0100_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSRVY_20180816_1_0102_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSRVY_20180816_1_0105_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSRVY_20180817_1_0155_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSRVY_20180817_1_0158_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSRVY_20180817_1_0160_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSRVY_20180817_1_0162_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSRVY_20180817_1_0167_1_01' THEN 'DO outside expected range, pH not recorded'
WHEN SampleEventWQID = 'ABSRVY_20180918_1_0007_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20190507_1_0007_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20190605_1_0096_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20190605_1_0102_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20190611_1_0155_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20190611_1_0160_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20190611_1_0167_1_01' THEN 'DO and pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20190730_1_0090_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20190730_1_0096_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20190730_1_0098_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20190730_1_0100_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20190730_1_0105_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20190731_1_0155_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20190731_1_0158_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20190731_1_0160_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20190731_1_0162_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20190731_1_0167_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20190829_1_0090_1_01' THEN 'No WQ recorded'
WHEN SampleEventWQID = 'ABSRVY_20190829_1_0090_2_01' THEN 'No WQ recorded'
WHEN SampleEventWQID = 'ABSRVY_20190829_1_0090_3_01' THEN 'No WQ recorded'
WHEN SampleEventWQID = 'ABSRVY_20190829_1_0090_4_01' THEN 'No WQ recorded'
WHEN SampleEventWQID = 'ABSRVY_20200618_1_0155_1_01' THEN 'DO and pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20200618_1_0158_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20200618_1_0167_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20201001_1_0007_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20210323_1_0102_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20210324_1_0167_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20210331_1_0016_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20210331_1_0019_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20210331_1_0024_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20210331_1_0100_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20210407_1_0160_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20210929_1_0156_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20210929_1_0158_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSRVY_20210929_1_0167_1_01' THEN 'DO outside expected range'
ELSE Comments
END;
GO

-- Add comments for null values in Survey Quadrat

GO
UPDATE hsdb.SurveyQuadrat
SET Comments =
	CASE
WHEN QuadratID = 'ABSRVY_20210331_1_0100_1_01' THEN 'Volume not recorded'
WHEN QuadratID = 'ABSRVY_20210331_1_0100_1_10' THEN 'Volume not recorded'
WHEN QuadratID = 'ABSRVY_20210331_1_0100_1_13' THEN 'Volume not recorded'
WHEN QuadratID = 'ABSRVY_20220920_1_0102_1_09' THEN 'Volume not recorded'
ELSE Comments
END;
GO

-- Add comments for out of range values in Survey Quadrat

GO
UPDATE hsdb.SurveyQuadrat
SET Comments =
	CASE
WHEN QuadratID = 'ABSRVY_20220926_1_0162_1_13' THEN 'Weight and volume outside expected range'
WHEN QuadratID = 'ABSRVY_20200925_1_0024_1_01' THEN 'Weight and volume outside expected range'
WHEN QuadratID = 'ABSRVY_20200925_1_0100_1_04' THEN 'Weight and volume outside expected range'
WHEN QuadratID = 'ABSRVY_20220922_1_0100_1_07' THEN 'Weight and volume outside expected range'
WHEN QuadratID = 'ABSRVY_20200925_1_0100_1_02' THEN 'Weight outside expected range'
WHEN QuadratID = 'ABSRVY_20200925_1_0024_1_02' THEN 'Weight outside expected range'
WHEN QuadratID = 'ABSRVY_20200925_1_0100_1_07' THEN 'Weight outside expected range'
WHEN QuadratID = 'ABSRVY_20200925_1_0100_1_13' THEN 'Weight outside expected range'
WHEN QuadratID = 'ABSRVY_20200925_1_0100_1_05' THEN 'Weight outside expected range'
WHEN QuadratID = 'ABSRVY_20200925_1_0100_1_15' THEN 'Weight outside expected range'
WHEN QuadratID = 'ABSRVY_20180816_1_0100_1_07' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180816_1_0100_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220324_1_0100_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0100_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0100_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0100_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0100_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0100_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200610_1_0100_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0096_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0096_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0096_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0096_1_07' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0096_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0096_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0100_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0100_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0100_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0100_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0100_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0100_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220308_1_0024_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220308_1_0024_1_07' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220308_1_0024_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220922_1_0100_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220926_1_0308_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220926_1_0167_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200925_1_0024_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200925_1_0100_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180607_1_0100_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180816_1_0100_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180816_1_0100_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180918_1_0024_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0100_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0102_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0102_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190730_1_0100_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190924_1_0019_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190924_1_0024_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190924_1_0024_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200610_1_0098_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200610_1_0100_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200610_1_0100_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200610_1_0100_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200618_1_0155_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210324_1_0167_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210324_1_0167_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210324_1_0167_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210324_1_0167_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210324_1_0167_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0016_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0024_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0024_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0024_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0096_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0098_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0100_1_07' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210927_1_0098_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210927_1_0100_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210927_1_0102_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210928_1_0024_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210928_1_0024_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210928_1_0024_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210928_1_0024_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210929_1_0162_1_07' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210929_1_0162_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220308_1_0024_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220324_1_0100_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220324_1_0100_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220922_1_0019_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190507_1_0024_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0102_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190924_1_0024_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200610_1_0098_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200610_1_0098_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200618_1_0155_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210324_1_0167_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0096_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180816_1_0098_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180607_1_0100_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200925_1_0100_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220324_1_0100_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220926_1_0158_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180607_1_0100_2_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180918_1_0011_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0090_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220324_1_0016_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0098_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0100_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0100_1_07' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0100_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200925_1_0102_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180607_1_0100_2_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180607_1_0102_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180607_1_0102_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180607_1_0102_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180607_1_0102_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180816_1_0098_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180816_1_0100_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0098_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0100_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190730_1_0090_1_07' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190730_1_0098_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190730_1_0098_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200610_1_0090_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200618_1_0155_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200618_1_0155_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200925_1_0096_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210324_1_0156_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0096_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0098_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210927_1_0100_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210927_1_0100_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220324_1_0100_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220920_1_0024_1_07' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220922_1_0100_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220926_1_0167_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200927_1_0162_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180918_1_0016_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180918_1_0024_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180918_1_0024_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180918_1_0024_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190507_1_0024_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190507_1_0024_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190507_1_0024_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0098_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0102_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190730_1_0102_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190829_1_0090_4_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190829_1_0090_4_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190829_1_0090_4_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190924_1_0016_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190924_1_0024_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200610_1_0090_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200610_1_0090_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200610_1_0098_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200610_1_0100_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200610_1_0100_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210927_1_0098_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210928_1_0011_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210928_1_0011_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210928_1_0011_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210929_1_0162_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200927_1_0016_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180816_1_0096_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190829_1_0090_4_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220324_1_0016_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220920_1_0024_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190507_1_0024_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180816_1_0090_2_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190507_1_0024_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0096_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200927_1_0016_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200927_1_0016_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180607_1_0100_2_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190507_1_0024_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190507_1_0024_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0090_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0096_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0096_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190611_1_0167_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190611_1_0167_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190730_1_0090_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190730_1_0100_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190829_1_0090_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190924_1_0019_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200610_1_0096_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200927_1_0016_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210323_1_0102_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0016_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220324_1_0016_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220324_1_0102_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220920_1_0102_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0090_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190731_1_0162_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220324_1_0102_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190731_1_0158_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180608_1_0167_1_07' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180816_1_0090_2_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220922_1_0100_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200927_1_0016_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180607_1_0102_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180816_1_0090_2_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180816_1_0096_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180816_1_0096_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180816_1_0098_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180817_1_0162_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180918_1_0016_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0090_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190611_1_0160_1_07' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190611_1_0162_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190611_1_0162_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190730_1_0102_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190731_1_0167_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190829_1_0090_3_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200618_1_0167_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220324_1_0102_1_07' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180608_1_0162_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180816_1_0105_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180918_1_0019_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190611_1_0162_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190611_1_0162_1_08' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190730_1_0102_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190829_1_0090_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180816_1_0105_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180608_1_0167_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180816_1_0105_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180918_1_0016_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190730_1_0098_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200618_1_0167_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0016_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210927_1_0016_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210927_1_0096_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180607_1_0090_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190507_1_0024_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190731_1_0167_1_09' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190829_1_0090_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200927_1_0016_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20210331_1_0019_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220308_1_0007_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180607_1_0090_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190731_1_0167_1_13' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220324_1_0102_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190507_1_0011_1_03' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190507_1_0016_1_06' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0090_1_02' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190507_1_0016_1_07' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190507_1_0024_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190731_1_0158_1_04' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190605_1_0090_1_12' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190730_1_0090_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190731_1_0167_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220324_1_0098_1_05' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220920_1_0102_1_01' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190731_1_0167_1_11' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180607_1_0090_1_14' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180607_1_0096_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20190730_1_0100_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20200610_1_0096_1_15' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20220329_1_0156_1_10' THEN 'Weight to volume ratio outside expected range'
WHEN QuadratID = 'ABSRVY_20180608_1_0158_1_12' THEN 'Weight to volume ratio outside expected range'
ELSE Comments
END;
GO