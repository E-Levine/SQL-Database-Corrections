-- AB Collections 07/2024 - 08/2024
-- Fixes

-- SampleEvent
UPDATE dbo.SampleEvent
SET Comments = 'No oysters collected'
WHERE SampleEventID = 'ABCOLL_20240801_1_0019_1'


--ConditionIndex
UPDATE dbo.ConditionIndex
SET Comments = null
WHERE Comments = ''

UPDATE dbo.ConditionIndex
SET TissueDryWeight = 1.98
WHERE OysterID = 'ABEC2407-19'

UPDATE dbo.ConditionIndex
SET ShellWetWeight = null,
Comments = 'ShellWetWeight not recorded; TotalWeight outside expected range'
WHERE OysterID = 'ABWC2408-11'

UPDATE dbo.ConditionIndex
SET ShellWetWeight = 187.82
WHERE OysterID = 'ABEC2408-19'

--Dermo
UPDATE dbo.Dermo
SET ShellHeight = 99.47
WHERE OysterID = 'ABWD2408-18'


--Repro
-- None

--------
-- Comments
-- WQ

GO
UPDATE SampleEventWQ
SET Comments =
	CASE

WHEN SampleEventWQID = 'ABCOLL_20240708_1_0007_1_01' THEN 'Temperature and DissolvedOxygen outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20240708_1_0007_1_02' THEN 'DissolvedOxygen outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20240708_1_0011_1_01' THEN 'Temperature and DissolvedOxygen outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20240708_1_0011_1_02' THEN 'Temperature and DissolvedOxygen outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20240708_1_0024_1_01' THEN 'Temperature outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20240708_1_0024_1_02' THEN 'Temperature outside expected range'

ELSE Comments
END;
GO

-- CI Comments

GO
UPDATE ConditionIndex
SET Comments =
	CASE

WHEN OysterID = 'ABCC2408-19' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2408-11' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2408-04' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC2408-19' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC2408-20' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC2407-01' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2407-03' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2407-17' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2407-21' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2408-01' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2408-02' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2408-09' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2408-10' THEN 'ShellWidth, TotalWeight, and TissueWetWeight outside expected range'
WHEN OysterID = 'ABWC2408-12' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2408-13' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2408-18' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2408-23' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2407-07' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2407-13' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2407-23' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC2407-11' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2408-07' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2408-11' THEN 'ShellWetWeight not recorded; TotalWeight outside expected range'
WHEN OysterID = 'ABWC2408-15' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2408-25' THEN 'TotalWeight outside expected range'

ELSE Comments
END;
GO

-- Dermo comments
GO
UPDATE Dermo
SET Comments =
	CASE

WHEN OysterID = 'ABWD2407-03' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2407-24' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2408-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2408-22' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED2408-25' THEN 'ShellLength, ShellWidth, and TotalWeight outside expected range'
WHEN OysterID = 'ABCD2407-02' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2408-24' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2407-11' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2407-17' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2407-25' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2408-01' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2408-03' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2408-07' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2408-09' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2408-11' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2408-12' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2408-13' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2408-19' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2407-07' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2407-13' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2408-02' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2408-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2408-08' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2408-15' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2408-16' THEN 'TotalWeight outside expected range'

ELSE Comments
END;
GO
