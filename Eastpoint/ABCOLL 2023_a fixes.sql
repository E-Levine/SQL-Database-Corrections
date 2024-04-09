-- Only covers 1/1/23 - 2/28/23
-- Fixes
update ConditionIndex
set TotalWeight = 74.35
where OysterID = 'ABCC2301-24'

update ConditionIndex
set TotalWeight = 43.12
where OysterID = 'ABEC2301-10'

-- Comments
update SampleEventWQ
set Comments = 'Salinity outside expected range'
where SampleEventWQID = 'ABCOLL_20230201_1_0007_1_01'

update SampleEventWQ
set Comments = 'Salinity and pH outside expected range'
where SampleEventWQID = 'ABCOLL_20230201_1_0011_1_01'

-- CI Comments
GO
UPDATE ConditionIndex
SET Comments =
	CASE
WHEN OysterID = 'ABWC2302-09' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2302-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2302-25' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2301-01' THEN 'ShellLength and ShellWidth outside expected range'
WHEN OysterID = 'ABWC2302-01' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABEC2301-23' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC2301-08' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC2301-09' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC2301-20' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC2301-04' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2301-06' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2302-07' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2302-08' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2301-10' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2301-19' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2301-24' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC2302-15' THEN 'TotalWeight sums outside expected range'

ELSE Comments
END;
GO

-- Dermo comments
GO
UPDATE Dermo
SET Comments =
	CASE
WHEN OysterID = 'ABCD2302-21' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED2302-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED2302-21' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2301-04' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2302-25' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2302-20' THEN 'ShellLength, ShellWidth, and TotalWeight outside expected range'
WHEN OysterID = 'ABED2301-08' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2302-16' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2301-09' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2302-02' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2302-05' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2302-23' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2301-03' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2301-06' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2301-10' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2301-17' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2301-19' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2301-20' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2302-10' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2302-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2302-15' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2302-18' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2302-19' THEN 'TotalWeight outside expected range'


ELSE Comments
END;
GO
