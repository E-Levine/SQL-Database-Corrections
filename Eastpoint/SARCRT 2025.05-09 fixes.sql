-- SA Recruitment 05/2025 - 09/2025

-- Database Errors
-- None

--WQ
--Fix errors
UPDATE SampleEventWQ
SET Salinity = 29.16
Where SampleEventWQID = 'SARCRT_20250711_1_0384_1_02'

UPDATE SampleEventWQ
SET Salinity = null,
Comments = 'Salinity not recorded'
Where SampleEventWQID = 'SARCRT_20250711_1_0386_1_02'


--Add WQ comments
GO
UPDATE SampleEventWQ
SET Comments =
	CASE

WHEN SampleEventWQID = 'PERCRT_20250617_1_0313_1_01' THEN 'pH outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250617_1_0313_1_02' THEN 'pH outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250617_1_0314_1_01' THEN 'pH outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250617_1_0314_1_02' THEN 'pH outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250617_1_0315_1_01' THEN 'pH, Turbidity outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250617_1_0315_1_02' THEN 'pH outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250617_1_0316_1_01' THEN 'pH, Turbidity outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250617_1_0316_1_02' THEN 'pH outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250617_1_0317_1_01' THEN 'pH outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250617_1_0318_1_01' THEN 'pH outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250617_1_0319_1_01' THEN 'pH outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250617_1_0322_1_01' THEN 'pH outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250716_1_0313_1_01' THEN 'pH outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250716_1_0314_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250716_1_0316_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250716_1_0317_1_02' THEN 'DO outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250716_1_0322_1_01' THEN 'pH outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250912_1_0314_1_01' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250912_1_0314_1_02' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250912_1_0315_1_01' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250912_1_0315_1_02' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250912_1_0316_1_01' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250912_1_0316_1_02' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250912_1_0317_1_01' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250912_1_0318_1_01' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250912_1_0318_1_02' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250912_1_0319_1_02' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250912_1_0320_1_02' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250912_1_0321_1_01' THEN 'Turbidity outside expected range; '
WHEN SampleEventWQID = 'PERCRT_20250912_1_0321_1_02' THEN 'Turbidity outside expected range; '

ELSE Comments
END;
GO

-- Recruitment
--Fix errors
-- None


--Add Recruitment comments
UPDATE Recruitment
SET Comments = 'High number of spat reported' 
where NumBottom > 50 AND
ShellID like 'SARCRT_20250%'

