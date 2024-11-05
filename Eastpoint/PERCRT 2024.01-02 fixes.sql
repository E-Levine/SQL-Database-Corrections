-- Database Errors
-- None

--WQ
--Fix errors
-- None

--Add WQ comments
GO
UPDATE SampleEventWQ
SET Comments =
	CASE
WHEN SampleEventWQID = 'PERCRT_20240215_1_0322_1_01' THEN 'Depth not recorded'
WHEN SampleEventWQID = 'PERCRT_20240215_1_0322_1_02' THEN 'Depth and SampleDepth not recorded'
WHEN Temperature < 10 THEN 'Temperature outside expected range; subzero air temps day before'

ELSE Comments
END;
GO

-- Recruitment
--Fix errors
update Recruitment
set NumBottom = 0
where ShellID = 'PERCRT_20240215_1_0317_1_23'

--Add Recruitment comments

