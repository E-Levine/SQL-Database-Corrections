-- AB Recruitment 05/2025 - 09/2025

-- Database Errors
-- None

--WQ
--Fix errors
update SampleEventWQ
set
TurbidityYSI = null,
Comments = 'Turbidity failed CCV'
where SampleEventWQID like 'ABRCRT_20250619_1_0156_1_0%'
or SampleEventWQID like 'ABRCRT_20250619_1_0158_1_0%'
or SampleEventWQID like 'ABRCRT_20250619_1_0308_1_0%'
or SampleEventWQID like 'ABRCRT_20250619_1_0162_1_0%'
or SampleEventWQID like 'ABRCRT_20250619_1_0167_1_0%'


--Add WQ comments
GO
UPDATE SampleEventWQ
SET Comments =
	CASE
WHEN SampleEventWQID = 'ABRCRT_20250325_1_0158_1_02' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20250422_1_0007_1_01' THEN 'Salinity outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20250522_1_0156_1_01' THEN 'Salinity; Turbidity outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20250522_1_0156_1_02' THEN 'Salinity outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20250522_1_0158_1_01' THEN 'Salinity; Turbidity outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20250522_1_0158_1_02' THEN 'Salinity; Turbidity outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20250522_1_0162_1_02' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20250522_1_0167_1_01' THEN 'Salinity; Turbidity outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20250522_1_0167_1_02' THEN 'Salinity; Turbidity outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20250718_1_0011_1_01' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20250718_1_0011_1_02' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'ABRCRT_20250820_1_0007_1_02' THEN 'Turbidity outside expected range; '

ELSE Comments
END;
GO

-- Recruitment
--Fix errors
-- None


--Add Recruitment comments
-- None

