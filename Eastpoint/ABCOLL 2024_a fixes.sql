-- AB Collections 01/2024 - 04/2024
-- Fixes

-- SampleEvent
UPDATE dbo.SampleEvent
SET LongitudeDec = -84.92702
WHERE SampleEventID = 'ABCOLL_20240104_1_0007_1'


--ConditionIndex
UPDATE dbo.ConditionIndex
SET ShellDryWeight = 184.02
WHERE OysterID = 'ABWC2404-04'

--Dermo
-- None

--Repro
-- None

--------
-- Comments

update SampleEventWQ
set Comments = 'Salinity and Turbidity outside expected range'
where SampleEventWQID like 'ABCOLL_20240402_1_0007_1_%'

update SampleEventWQ
set Comments = 'DissolvedOxygen outside expected range'
where SampleEventWQID = 'ABCOLL_20240201_1_0158_1_02' or
 SampleEventWQID = 'ABCOLL_20240201_1_0011_1_02' or
 SampleEventWQID = 'ABCOLL_20240201_1_0024_1_01' or
 SampleEventWQID = 'ABCOLL_20240201_1_0024_1_02' 

update SampleEventWQ
set Comments = 'Turbidity outside expected range'
where SampleEventWQID = 'ABCOLL_20240402_1_0011_1_01'

-- CI Comments

update dbo.ConditionIndex
set Comments = null where comments = ''


GO
UPDATE ConditionIndex
SET Comments =
	CASE

WHEN OysterID = 'ABWC2401-22' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2402-19' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2403-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2404-11' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2404-23' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2403-21' THEN 'ShellLength; ShellWidth; TotalWeight outside expected ranges'
WHEN OysterID = 'ABEC2402-19' THEN 'ShellLength; TotalWeight outside expected ranges'
WHEN OysterID = 'ABWC2404-19' THEN 'ShellLength; TotalWeight outside expected ranges'
WHEN OysterID = 'ABCC2403-20' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC2404-08' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC2401-05' THEN 'ShellWidth; TotalWeight outside expected ranges'
WHEN OysterID = 'ABWC2401-12' THEN 'ShellWidth; TotalWeight outside expected ranges'
WHEN OysterID = 'ABEC2401-02' THEN 'ShellWidth; TotalWeight outside expected ranges'
WHEN OysterID = 'ABWC2402-14' THEN 'ShellWidth; TotalWeight outside expected ranges'
WHEN OysterID = 'ABWC2403-07' THEN 'ShellWidth; TotalWeight outside expected ranges'
WHEN OysterID = 'ABWC2403-09' THEN 'ShellWidth; TotalWeight outside expected ranges'
WHEN OysterID = 'ABWC2403-10' THEN 'ShellWidth; TotalWeight outside expected ranges'
WHEN OysterID = 'ABWC2403-13' THEN 'ShellWidth; TotalWeight outside expected ranges'
WHEN OysterID = 'ABWC2404-05' THEN 'ShellWidth; TotalWeight outside expected ranges'
WHEN OysterID = 'ABWC2404-06' THEN 'ShellWidth; TotalWeight outside expected ranges'
WHEN OysterID = 'ABWC2404-12' THEN 'ShellWidth; TotalWeight outside expected ranges'
WHEN OysterID = 'ABWC2401-03' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2402-08' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC2402-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2403-01' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2403-03' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2403-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2403-11' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2403-17' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2404-16' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC2404-03' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC2404-19' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2404-22' THEN 'ShellWetWeight outside expected range'

ELSE Comments
END;
GO

-- Dermo comments
GO
UPDATE Dermo
SET Comments =
	CASE
WHEN OysterID = 'ABCD2401-14' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2402-02' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2402-17' THEN 'ShellLength; ShellWetWeight outside expected range'
WHEN OysterID = 'ABWD2402-07' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2403-24' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABED2404-04' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2401-02' THEN 'ShellWidth; TotalWeight outside expected range'
WHEN OysterID = 'ABWD2402-01' THEN 'ShellWidth; TotalWeight outside expected range'
WHEN OysterID = 'ABWD2402-04' THEN 'ShellWidth; TotalWeight outside expected range'
WHEN OysterID = 'ABWD2403-04' THEN 'ShellWidth; TotalWeight outside expected range'
WHEN OysterID = 'ABWD2403-11' THEN 'ShellWidth; TotalWeight outside expected range'
WHEN OysterID = 'ABWD2403-18' THEN 'ShellWidth; TotalWeight outside expected range'
WHEN OysterID = 'ABWD2403-20' THEN 'ShellWidth; TotalWeight outside expected range'
WHEN OysterID = 'ABWD2404-02' THEN 'ShellWidth; TotalWeight outside expected range'
WHEN OysterID = 'ABWD2404-03' THEN 'ShellWidth; TotalWeight outside expected range'
WHEN OysterID = 'ABWD2404-06' THEN 'ShellWidth; TotalWeight outside expected range'
WHEN OysterID = 'ABWD2404-13' THEN 'ShellWidth; TotalWeight outside expected range'
WHEN OysterID = 'ABWD2404-15' THEN 'ShellWidth; TotalWeight outside expected range'
WHEN OysterID = 'ABWD2404-24' THEN 'ShellWidth; TotalWeight outside expected range'
WHEN OysterID = 'ABED2404-07' THEN 'ShellWidth; TotalWeight outside expected range'
WHEN OysterID = 'ABWD2403-01' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2403-02' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2403-07' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2403-22' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2403-25' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2404-12' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED2404-19' THEN 'TotalWeight outside expected range'

ELSE Comments
END;
GO
