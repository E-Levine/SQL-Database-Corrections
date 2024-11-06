-- SA Recruitment 04/24 - 07/24

-- Database Errors
-- None

--WQ
--Fix errors
update SampleEventWQ
set Secchi = 2.5
where SampleEventWQID like 'SARCRT_20240507_1_0385%'

update SampleEventWQ
set Depth = 3.25
where SampleEventWQID like 'SARCRT_20240607_1_0382%'

--Add WQ comments
GO
UPDATE SampleEventWQ
SET Comments =
	CASE
WHEN SampleEventWQID = 'SARCRT_20240415_1_0380_1_01' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'SARCRT_20240415_1_0380_1_02' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'SARCRT_20240415_1_0381_1_01' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'SARCRT_20240415_1_0381_1_02' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'SARCRT_20240415_1_0382_1_01' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'SARCRT_20240415_1_0382_1_02' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'SARCRT_20240415_1_0383_1_01' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'SARCRT_20240415_1_0383_1_02' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'SARCRT_20240415_1_0384_1_01' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'SARCRT_20240415_1_0384_1_02' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'SARCRT_20240415_1_0385_1_01' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'SARCRT_20240415_1_0386_1_01' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'SARCRT_20240415_1_0386_1_02' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'SARCRT_20240415_1_0387_1_02' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'SARCRT_20240415_1_0388_1_02' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'SARCRT_20240415_1_0389_1_02' THEN 'Turbidity outside expected range; pH failed CCV'

ELSE Comments
END;
GO

-- Recruitment
--Fix errors
-- None


--Add Recruitment comments

UPDATE Recruitment
SET Comments = 'High number of spat recorded'
where NumBottom > 50 and ShellID like 'SARCRT_2024%'

