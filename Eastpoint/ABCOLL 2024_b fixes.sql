-- AB Collections 05/2024 - 06/2024
-- Fixes

-- SampleEvent
-- none


--ConditionIndex
UPDATE dbo.ConditionIndex
SET TotalWeight = 297.8,
Comments = 'TotalWeight outside expected range'
WHERE OysterID = 'ABWC2405-01'

--Dermo
UPDATE dbo.Dermo
SET ShellWetWeight = null,
Comments = 'ShellWetWeight not recorded'
WHERE OysterID = 'ABCD2405-23'

UPDATE dbo.Dermo
SET ShellWetWeight = null,
Comments = 'ShellWetWeight not recorded'
WHERE OysterID = 'ABED2405-13'

UPDATE dbo.Dermo
SET ShellWetWeight = null,
Comments = 'ShellWetWeight not recorded'
WHERE OysterID = 'ABED2405-14'

UPDATE dbo.Dermo
SET ShellWetWeight = null,
Comments = 'ShellWetWeight not recorded'
WHERE OysterID = 'ABED2405-15'

UPDATE dbo.Dermo
SET ShellWidth = null,
Comments = 'ShellWidth not recorded'
WHERE OysterID = 'ABCD2406-11'

--Repro
-- None

--------
-- Comments
-- WQ
-- none

-- CI Comments

GO
UPDATE ConditionIndex
SET Comments =
	CASE

WHEN OysterID = 'ABWC2406-21' THEN 'ShellHeight, ShellWidth, and TotalWeight outside expected ranges'
WHEN OysterID = 'ABWC2405-19' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2406-14' THEN 'ShellLength, ShellWidth, and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2406-24' THEN 'ShellLength, ShellWidth, and TotalWeight outside expected range'
WHEN OysterID = 'ABCC2406-03' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABCC2405-20' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC2406-03' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCC2406-02' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCC2406-11' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC2405-08' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2405-11' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2405-20' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2405-25' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2406-01' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2406-02' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2406-05' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2406-09' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2406-10' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2406-13' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2405-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2405-24' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2406-07' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2406-12' THEN 'TotalWeight outside expected range'

ELSE Comments
END;
GO

-- Dermo comments
GO
UPDATE Dermo
SET Comments =
	CASE

WHEN OysterID = 'ABED2405-02' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED2405-20' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2406-08' THEN 'ShellLength, ShellWidth, and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2405-17' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2406-17' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2405-07' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2406-01' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2406-03' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2405-01' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2405-03' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2405-19' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2406-02' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2406-04' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2406-06' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2406-10' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2406-11' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2406-21' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2405-25' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD2405-17' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2406-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2406-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2406-23' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2406-25' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD2405-15' THEN 'ShellWetWeight outside expected range'
WHEN OysterID = 'ABED2405-12' THEN 'ShellWetWeight outside expected range'

ELSE Comments
END;
GO
