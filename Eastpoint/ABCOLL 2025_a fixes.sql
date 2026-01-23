-- AB Collections 01/2025 - 07/2025
-- Fixes

-- SampleEvent
-- None

-- SampleEventWQ
-- None

--ConditionIndex
UPDATE ConditionIndex
SET ShellWidth = 36.99
WHERE OysterID = 'ABEC2504-15'

UPDATE ConditionIndex
SET TotalWeight = 186.23
WHERE OysterID = 'ABCC2503-23'

UPDATE ConditionIndex
SET TotalWeight = 179.90
WHERE OysterID = 'ABCC2505-12'

--Dermo
UPDATE Dermo
SET ShellWidth = 38.31
WHERE OysterID = 'ABCD2505-06'

UPDATE Dermo
SET TotalWeight = 206.86
WHERE OysterID = 'ABED2506-03'

UPDATE Dermo
SET TotalWeight = 119.99
WHERE OysterID = 'ABED2506-14'

UPDATE Dermo
SET TotalWeight = 216.36
WHERE OysterID = 'ABCD2507-02'

UPDATE Dermo
SET ShellLength = 62.64
WHERE OysterID = 'ABCD2507-18'

--Repro
UPDATE Repro
SET ReproStage = 'Z'
WHERE OysterID = 'ABED2505-18'

--------
-- Comments
-- WQ

GO
UPDATE SampleEventWQ
SET Comments =
	CASE
WHEN SampleEventWQID = 'ABCOLL_20250203_1_0158_1_01' THEN 'DissolvedOxygen outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20250203_1_0007_1_02' THEN 'DissolvedOxygen outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20250203_1_0011_1_01' THEN 'DissolvedOxygen outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20250203_1_0011_1_02' THEN 'DissolvedOxygen outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20250203_1_0024_1_01' THEN 'DissolvedOxygen outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20250203_1_0024_1_02' THEN 'DissolvedOxygen outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20250203_1_0539_1_01' THEN 'DissolvedOxygen outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20250203_1_0539_1_02' THEN 'DissolvedOxygen outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20250303_1_0007_1_01' THEN 'No secchi; Turbidity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20250303_1_0007_1_02' THEN 'No secchi; Turbidity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20250505_1_0158_1_02' THEN 'Turbidity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20250505_1_0007_1_02' THEN 'Turbidity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20250505_1_0024_1_02' THEN 'Turbidity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20250701_1_0007_1_02' THEN 'Turbidity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20250701_1_0011_1_02' THEN 'Turbidity outside expected range'

ELSE Comments
END;
GO

-- CI Comments

GO
UPDATE ConditionIndex
SET Comments =
	CASE
WHEN OysterID = 'ABEC2501-05' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2504-04' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2504-20' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2505-10' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2504-06' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABCC2505-19' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2501-12' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC2503-03' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABEC2504-12' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCC2507-02' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCC2502-06' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABCC2503-08' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2506-07' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2502-09' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC2502-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2503-06' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2505-02' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2506-01' THEN 'TotalWeight outside expected range'

ELSE Comments
END;
GO

-- Dermo comments
GO
UPDATE Dermo
SET Comments =
	CASE
WHEN OysterID = 'ABWD2501-05' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED2503-16' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2505-06' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2506-08' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABED2506-04' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2502-05' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2505-07' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2505-10' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABCD2506-05' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABCD2507-04' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABCD2501-07' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED2502-13' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2503-09' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED2503-02' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD2504-09' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2505-11' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD2505-12' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD2505-16' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD2505-24' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2506-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2506-13' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD2506-09' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD2506-15' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2507-01' THEN 'TotalWeight outside expected range'

ELSE Comments
END;
GO
