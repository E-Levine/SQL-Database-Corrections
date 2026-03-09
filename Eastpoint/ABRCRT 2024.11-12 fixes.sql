-- AB Recruitment 11/24 - 12/24

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

WHEN SampleEventWQID = 'ABRCRT_20241218_1_0156_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20241218_1_0162_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20241218_1_0007_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20241218_1_0011_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20241218_1_0024_1_01' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20241218_1_0024_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20241218_1_0167_1_01' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20241218_1_0100_1_01' THEN 'Turbidity outside expected range; '

ELSE Comments
END;
GO

-- Recruitment
--Fix errors
-- None


--Add Recruitment comments
-- None

