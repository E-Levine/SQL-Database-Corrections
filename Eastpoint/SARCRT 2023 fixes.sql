-- Trip Comments
update TripInfo
set Comments = 'Initial deployment'
where TripID = 'SARCRT_20230123_1'

-- WQ
-- Fixes
update SampleEventWQ
set Salinity = 29.43
where SampleEventWQID = 'SARCRT_20230620_1_0382_1_02'

update SampleEventWQ
set TurbidityYSI = NULL, Comments = 'Turbidity failed CCV'
where SampleEventWQID like 'SARCRT_20231013%'

-- Add Comments
GO
UPDATE SampleEventWQ
SET Comments =
	CASE

WHEN SampleEventWQID = 'SARCRT_20230718_1_0390_1_01' THEN 'Temperature outside expected range'
WHEN SampleEventWQID = 'SARCRT_20230814_1_0385_1_01' THEN 'Temperature outside expected range'
WHEN SampleEventWQID = 'SARCRT_20230814_1_0386_1_01' THEN 'Temperature outside expected range'
WHEN SampleEventWQID = 'SARCRT_20230814_1_0390_1_01' THEN 'Temperature outside expected range'
WHEN SampleEventWQID = 'SARCRT_20230718_1_0385_1_02' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'SARCRT_20230718_1_0386_1_02' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'SARCRT_20231013_1_0390_1_01' THEN 'Turbidity failed CCV; pH outside expected range'
WHEN SampleEventWQID = 'SARCRT_20231205_1_0388_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'SARCRT_20231205_1_0388_1_02' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'SARCRT_20231205_1_0389_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'SARCRT_20231205_1_0389_1_02' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'SARCRT_20231205_1_0390_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'SARCRT_20231205_1_0390_1_02' THEN 'pH outside expected range'

ELSE Comments
END;
GO

-- Recruitment
-- Remove incorrect initial deploy records
delete from Recruitment
where shellID like 'SARCRT_20230123%'


--Add Recruitment comments
UPDATE Recruitment
SET Comments = 'High number of spat recorded'
where NumBottom > 50 and ShellID like 'SARCRT_2023%'






