-- Database Errors
-- Staff didn't save proof
UPDATE Recruitment
Set DataStatus = 'Proofed', ProofedBy = 'Isaac Sencer', DateProofed = '2023-12-12'
where ShellID like 'PERCRT_20231018_1_0315_1%'

--WQ
--Fix errors
update SampleEventWQ
set Depth = 2.75
where SampleEventWQID like 'PERCRT_20231219_1_0320_1_0%'

--Add WQ comments
GO
UPDATE SampleEventWQ
SET Comments =
	CASE
WHEN SampleEventWQID = 'PERCRT_20230628_1_0313_1_02' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'PERCRT_20230726_1_0313_1_02' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'PERCRT_20230726_1_0315_1_02' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'PERCRT_20230822_1_0315_1_02' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'PERCRT_20230822_1_0316_1_02' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'PERCRT_20230822_1_0319_1_02' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'PERCRT_20230822_1_0322_1_02' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'PERCRT_20230919_1_0322_1_02' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'PERCRT_20230726_1_0322_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'PERCRT_20230726_1_0322_1_02' THEN 'DO and pH outside expected range'
WHEN SampleEventWQID = 'PERCRT_20231018_1_0322_1_01' THEN 'pH outside expected range; clear water, low turbidity, and high secchi'
WHEN SampleEventWQID = 'PERCRT_20230516_1_0320_1_01' THEN 'Turditiy outside expected range; pH failed CCV; lots of drills'
WHEN SampleEventWQID = 'PERCRT_20231018_1_0315_1_01' THEN 'Turditiy outside expected range; clear water, low turbidity, and high secchi'
WHEN SampleEventWQID = 'PERCRT_20231018_1_0316_1_01' THEN 'Turditiy outside expected range; clear water, low turbidity, and high secchi'
WHEN SampleEventWQID = 'PERCRT_20231018_1_0318_1_01' THEN 'Turditiy outside expected range; clear water, low turbidity, and high secchi'
WHEN SampleEventWQID = 'PERCRT_20231018_1_0318_1_02' THEN 'Turditiy outside expected range; clear water, low turbidity, and high secchi'
WHEN SampleEventWQID = 'PERCRT_20231018_1_0319_1_01' THEN 'Turditiy outside expected range; clear water, low turbidity, and high secchi'
WHEN SampleEventWQID = 'PERCRT_20231018_1_0320_1_01' THEN 'Turditiy outside expected range; clear water, low turbidity, and high secchi'
WHEN SampleEventWQID = 'PERCRT_20231018_1_0321_1_01' THEN 'Turditiy outside expected range; clear water, low turbidity, and high secchi'

ELSE Comments
END;
GO

-- Recruitment
--Fix errors
update Recruitment
set NumBottom = 0
where ShellID = 'PERCRT_20230120_1_0315_1_23'
or ShellID = 'PERCRT_20230628_1_0321_1_02'

--Add Recruitment comments

