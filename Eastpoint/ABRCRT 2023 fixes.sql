-- Database Errors
-- Staff didn't save proof
UPDATE Recruitment
Set DataStatus = 'Proofed', ProofedBy = 'Isaac Sencer', DateProofed = '2023-10-02'
where ShellID like 'ABRCRT_20230724_1_0100_1%'

UPDATE Recruitment
Set DataStatus = 'Proofed', ProofedBy = 'Isaac Sencer', DateProofed = '2023-12-20'
where ShellID like 'ABRCRT_20230915_1_0016_1%'

UPDATE Recruitment
Set DataStatus = 'Proofed', ProofedBy = 'James Heiser', DateProofed = '2024-02-14'
where ShellID like 'ABRCRT_20231220_1_0156_1%'

-- WQ
-- Fixes
update SampleEventWQ
set pH = NULL, Comments = 'pH failed CCV'
where SampleEventWQID like 'ABRCRT_20230206%'

update SampleEventWQ
set Comments = 'pH failed CCV'
where SampleEventWQID like 'ABRCRT_20231019%'

-- Add Comments
GO
UPDATE SampleEventWQ
SET Comments =
	CASE
WHEN SampleEventWQID = 'ABRCRT_20230111_1_0162_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABRCRT_20230111_1_0162_1_02' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABRCRT_20230206_1_0167_1_01' THEN 'pH failed CCV; DO outside expected range'
WHEN SampleEventWQID = 'ABRCRT_20230724_1_0007_1_02' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABRCRT_20230206_1_0007_1_01' THEN 'pH failed CCV; Salinity outside expected range'
WHEN SampleEventWQID = 'ABRCRT_20230626_1_0308_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABRCRT_20230626_1_0308_1_02' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABRCRT_20230626_1_0167_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABRCRT_20230724_1_0158_1_02' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABRCRT_20230724_1_0167_1_01' THEN 'Salinity and DO outside expected range'
WHEN SampleEventWQID = 'ABRCRT_20230724_1_0007_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABRCRT_20230815_1_0167_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABRCRT_20230309_1_0011_1_02' THEN 'Turbidity outside expected range'
WHEN SampleEventWQID = 'ABRCRT_20230309_1_0024_1_02' THEN 'Turbidity outside expected range'

ELSE Comments
END;
GO

-- Recruitment
-- fixes
update Recruitment
set Comments = 'shell missing'
where ShellID = 'ABRCRT_20230915_1_0100_1_17'

update Recruitment
set Comments = NULL
where ShellID = 'ABRCRT_20230915_1_0100_1_18'

update Recruitment
set NumBottom = NULL
where shellid = 'ABRCRT_20231220_1_0156_1_18'

-- Add Comments
UPDATE Recruitment
SET Comments = 'High number of spat recorded'
where NumBottom >50 and ShellID like 'AB%'
