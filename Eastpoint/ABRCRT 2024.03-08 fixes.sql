-- AB Recruitment 03/24 - 08/24

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
WHEN SampleEventWQID = 'ABRCRT_20240321_1_0007_1_01' THEN 'Salinity outside expected range; Turbidity failed CCV'
WHEN SampleEventWQID = 'ABRCRT_20240321_1_0007_1_02' THEN 'Salinity outside expected range; Turbidity failed CCV'
WHEN SampleEventWQID = 'ABRCRT_20240321_1_0011_1_01' THEN 'Salinity outside expected range; Turbidity failed CCV'
WHEN SampleEventWQID = 'ABRCRT_20240321_1_0011_1_02' THEN 'Salinity outside expected range; Turbidity failed CCV'
WHEN SampleEventWQID = 'ABRCRT_20240321_1_0024_1_01' THEN 'Salinity outside expected range; Turbidity failed CCV'
WHEN SampleEventWQID = 'ABRCRT_20240321_1_0024_1_02' THEN 'Salinity outside expected range; Turbidity failed CCV'
WHEN SampleEventWQID = 'ABRCRT_20240523_1_0308_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20240523_1_0167_1_02' THEN 'DO and pH outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20240523_1_0167_1_01' THEN 'DO and pH outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20240523_1_0158_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20240523_1_0158_1_01' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20240523_1_0156_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20240523_1_0156_1_01' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20240321_1_0156_1_02' THEN 'DO outside expected range; Turbidity failed CCV'
WHEN SampleEventWQID = 'ABRCRT_20240321_1_0167_1_01' THEN 'pH outside expected range; Turbidity failed CCV'
WHEN SampleEventWQID = 'ABRCRT_20240625_1_0167_1_01' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20240625_1_0167_1_02' THEN 'Turbidity outside expected range; '

ELSE Comments
END;
GO

-- Recruitment
--Fix errors
-- None


--Add Recruitment comments
-- None

