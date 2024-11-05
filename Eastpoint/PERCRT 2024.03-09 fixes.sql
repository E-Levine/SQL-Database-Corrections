-- PE Recruitment 03/24 - 09/24

-- Database Errors
-- None

--WQ
--Fix errors
update SampleEventWQ
set SampleDepth = 2.25
where SampleEventWQID = 'PERCRT_20240920_1_0321_1_02'

--Add WQ comments
GO
UPDATE SampleEventWQ
SET Comments =
	CASE
WHEN SampleEventWQID = 'PERCRT_20240418_1_0314_1_02' THEN 'DO outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'PERCRT_20240614_1_0321_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20240614_1_0322_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20240716_1_0316_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20240716_1_0322_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20240820_1_0314_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20240820_1_0315_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20240820_1_0316_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20240820_1_0317_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20240515_1_0318_1_01' THEN 'pH outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20240515_1_0322_1_01' THEN 'pH outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20240614_1_0322_1_01' THEN 'pH outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20240920_1_0322_1_01' THEN 'pH outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20240418_1_0316_1_02' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'PERCRT_20240418_1_0317_1_02' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'PERCRT_20240418_1_0318_1_01' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'PERCRT_20240418_1_0318_1_02' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'PERCRT_20240418_1_0320_1_01' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'PERCRT_20240418_1_0320_1_02' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'PERCRT_20240418_1_0321_1_01' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'PERCRT_20240418_1_0322_1_01' THEN 'Turbidity outside expected range; pH failed CCV'
WHEN SampleEventWQID = 'PERCRT_20240820_1_0320_1_01' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20240820_1_0320_1_02' THEN 'Turbidity outside expected range; '

ELSE Comments
END;
GO

-- Recruitment
--Fix errors
-- None


--Add Recruitment comments
-- None

