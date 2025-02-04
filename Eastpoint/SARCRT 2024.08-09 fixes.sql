-- SA Recruitment 08/24 - 09/24

-- Database Errors
-- None

--WQ
--Fix errors
-- None

--Add WQ comments
GO
UPDATE SampleEventWQ
SET Comments = 'Turbidity outside expected range'
WHERE SampleEventWQID like 'SARCRT_202408%' and TurbidityYSI < -2
GO

UPDATE SampleEventWQ
SET Comments = 'Dissolved oxygen outside expected range'
WHERE SampleEventWQID = 'SARCRT_20240813_1_0389_1_02'

-- Recruitment
--Fix errors
-- None


--Add Recruitment comments

UPDATE Recruitment
SET Comments = 'High number of spat recorded'
where NumBottom > 50 and ShellID like 'SARCRT_2024%'

