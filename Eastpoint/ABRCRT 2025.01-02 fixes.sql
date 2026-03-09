-- AB Recruitment 01/2025 - 02/2025

-- Database Errors
-- None

--WQ
--Fix errors
UPDATE
SampleEventWQ
Set SampleDepth = 0.25
where SampleEventWQID = 'ABRCRT_20250226_1_0167_1_01'

--Add WQ comments
GO
UPDATE SampleEventWQ
SET Comments =
	CASE

WHEN SampleEventWQID = 'ABRCRT_20250127_1_0156_1_01' THEN 'Turbidity failed ccv; Temperature outside expected range' 
WHEN SampleEventWQID = 'ABRCRT_20250127_1_0158_1_01' THEN 'Turbidity failed ccv; Temperature outside expected range' 
WHEN SampleEventWQID = 'ABRCRT_20250127_1_0308_1_01' THEN 'Turbidity failed ccv; Temperature outside expected range' 
WHEN SampleEventWQID = 'ABRCRT_20250127_1_0162_1_02' THEN 'Turbidity failed ccv; Temperature and Dissolved oxygen outside expected range' 
WHEN SampleEventWQID = 'ABRCRT_20250127_1_0011_1_01' THEN 'Turbidity failed ccv; Temperature and Dissolved oxygen outside expected range' 
WHEN SampleEventWQID = 'ABRCRT_20250127_1_0016_1_01' THEN 'Turbidity failed ccv; Temperature outside expected range' 
WHEN SampleEventWQID = 'ABRCRT_20250127_1_0019_1_01' THEN 'Turbidity failed ccv; Temperature outside expected range' 
WHEN SampleEventWQID = 'ABRCRT_20250127_1_0538_1_01' THEN 'Turbidity failed ccv; Temperature and Dissolved oxygen outside expected range' 
WHEN SampleEventWQID = 'ABRCRT_20250127_1_0539_1_01' THEN 'Turbidity failed ccv; Temperature outside expected range' 
WHEN SampleEventWQID = 'ABRCRT_20250127_1_0540_1_01' THEN 'Turbidity failed ccv; Temperature outside expected range' 
WHEN SampleEventWQID = 'ABRCRT_20250127_1_0100_1_01' THEN 'Turbidity failed ccv; Temperature outside expected range' 
WHEN SampleEventWQID = 'ABRCRT_20250127_1_0102_1_01' THEN 'Turbidity failed ccv; Temperature outside expected range' 
WHEN SampleEventWQID = 'ABRCRT_20250226_1_0007_1_01' THEN 'DO failed CCV; salinity outside expected range' 
WHEN SampleEventWQID = 'ABRCRT_20250127_1_0007_1_01' THEN 'Turbidity failed ccv; Dissolved oxygen outside expected range' 
WHEN SampleEventWQID = 'ABRCRT_20250127_1_0007_1_02' THEN 'Turbidity failed ccv; Dissolved oxygen outside expected range' 
WHEN SampleEventWQID = 'ABRCRT_20250127_1_0024_1_01' THEN 'Turbidity failed ccv; Dissolved oxygen outside expected range' 
WHEN SampleEventWQID = 'ABRCRT_20250226_1_0156_1_01' THEN 'DO failed CCV; pH outside expected range' 
WHEN SampleEventWQID = 'ABRCRT_20250226_1_0156_1_02' THEN 'DO failed CCV; pH outside expected range' 
WHEN SampleEventWQID = 'ABRCRT_20250226_1_0158_1_02' THEN 'DO failed CCV; pH outside expected range' 


ELSE Comments
END;
GO

-- Recruitment
--Fix errors
-- None


--Add Recruitment comments
-- None

