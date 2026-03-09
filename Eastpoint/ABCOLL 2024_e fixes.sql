-- AB Collections 10/2024 - 12/2024
-- Fixes

-- SampleEvent
UPDATE dbo.SampleEvent
SET LongitudeDec = -84.87095
WHERE SampleEventID = 'ABCOLL_20241107_1_0539_1'

-- SampleEventWQ
UPDATE dbo.SampleEventWQ
SET Salinity = 32.53
WHERE SampleEventWQID = 'ABCOLL_20241107_1_0538_1_02'

--ConditionIndex
-- None

--Dermo
-- None

--Repro
-- None

--------
-- Comments
-- WQ

GO
UPDATE SampleEventWQ
SET Comments =
	CASE

WHEN SampleEventWQID = 'ABCOLL_20241001_1_0007_1_01' THEN 'Salinity and pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20241001_1_0007_1_02' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20241001_1_0011_1_01' THEN 'Salinity and pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20241001_1_0024_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20241001_1_0158_1_02' THEN 'Turbidity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20241001_1_0538_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20241202_1_0007_1_02' THEN 'DissolvedOxygen outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20241202_1_0011_1_01' THEN 'DissolvedOxygen outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20241202_1_0011_1_02' THEN 'DissolvedOxygen outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20241202_1_0024_1_01' THEN 'DissolvedOxygen outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20241202_1_0024_1_02' THEN 'DissolvedOxygen outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20241202_1_0538_1_01' THEN 'DissolvedOxygen outside expected range'

ELSE Comments
END;
GO

-- CI Comments

GO
UPDATE ConditionIndex
SET Comments =
	CASE

WHEN OysterID = 'ABCC2412-10' THEN 'ShellHeight, ShellWidth, TotalWeight outside expected range'
WHEN OysterID = 'ABCC2412-20' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2410-22' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABEC2412-15' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2410-12' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCC2410-13' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCC2411-07' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABEC2412-06' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC2410-02' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2410-06' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2411-01' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2411-02' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2411-13' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2411-17' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2411-25' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2412-01' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2410-05' THEN 'TotalWeight and TissueWetWeight outside expected range'
WHEN OysterID = 'ABEC2410-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2411-18' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2411-21' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC2411-04' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2412-06' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC2412-04' THEN 'TotalWeight outside expected range'


ELSE Comments
END;
GO

-- Dermo comments
GO
UPDATE Dermo
SET Comments =
	CASE

WHEN OysterID = 'ABWD2411-14' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2410-10' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2411-18' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2411-20' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCD2412-17' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2410-02' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2410-09' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2410-18' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2410-25' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2411-12' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2411-21' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2412-01' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2412-03' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2412-09' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2411-02' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD2412-11' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD2412-13' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD2412-18' THEN 'TotalWeight outside expected range'

ELSE Comments
END;
GO
