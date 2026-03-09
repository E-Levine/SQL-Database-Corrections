-- SA Recruitment 10/24 - 03/25

-- Database Errors
-- None

--WQ
--Fix errors
-- None

--Add WQ comments
GO
UPDATE SampleEventWQ
SET Comments = 'Temperature outside expected range'
WHERE SampleEventWQID like 'SARCRT_202501%' and Temperature < 10
GO

UPDATE SampleEventWQ
SET Comments = 'Dissolved oxygen outside expected range'
WHERE SampleEventWQID = 'SARCRT_20241014_1_0384_1_02' or
SampleEventWQID = 'SARCRT_20241014_1_0387_1_02' or
SampleEventWQID = 'SARCRT_20241014_1_0388_1_02' or
SampleEventWQID = 'SARCRT_20241014_1_0389_1_02'

-- Recruitment
--Fix errors
-- None


--Add Recruitment comments

UPDATE Recruitment
SET Comments = 'High number of spat recorded'
where NumBottom > 50 and ShellID like 'SARCRT_2024%'

