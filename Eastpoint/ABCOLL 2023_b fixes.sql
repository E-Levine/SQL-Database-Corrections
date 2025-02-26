-- Only covers 3/1/23 - 12/31/23
-- Fixes
-- SampleEvent
UPDATE dbo.SampleEvent SET LatitudeDec = 29.6917666666667, LongitudeDec = -85.1088166666667 WHERE SampleEventID = 'ABCOLL_20230306_1_0156_1';
UPDATE dbo.SampleEvent SET LatitudeDec = 29.6927833333333, LongitudeDec = -85.0894333333333 WHERE SampleEventID = 'ABCOLL_20230306_1_0158_1';
UPDATE dbo.SampleEvent SET LatitudeDec = 29.7361333333333, LongitudeDec = -84.9269166666667 WHERE SampleEventID = 'ABCOLL_20230306_1_0007_1';
UPDATE dbo.SampleEvent SET LatitudeDec = 29.7122666666667, LongitudeDec = -84.9161 WHERE SampleEventID = 'ABCOLL_20230306_1_0011_1';
UPDATE dbo.SampleEvent SET LatitudeDec = 29.71285, LongitudeDec = -84.9003833333333 WHERE SampleEventID = 'ABCOLL_20230306_1_0024_1';
UPDATE dbo.SampleEvent SET LatitudeDec = 29.7139166666667, LongitudeDec = -84.88375 WHERE SampleEventID = 'ABCOLL_20230306_1_0091_1';
UPDATE dbo.SampleEvent SET LatitudeDec = 29.6812, LongitudeDec = -84.8690833333333 WHERE SampleEventID = 'ABCOLL_20230306_1_0096_1';
UPDATE dbo.SampleEvent SET LatitudeDec = 29.692, LongitudeDec = -85.1091333333333 WHERE SampleEventID = 'ABCOLL_20230404_1_0156_1';

UPDATE dbo.SampleEvent SET LatitudeDec = 29.712850
WHERE SampleEventID = 'ABCOLL_20231106_1_0024_1'

UPDATE dbo.ConditionIndex
SET ShellWidth = 39.82
WHERE OysterID = 'ABCC2310-13'

UPDATE dbo.ConditionIndex
SET ShellWetWeight = null, Comments = 'ShellWetWeight not recorded'
WHERE OysterID = 'ABEC2303-10'

UPDATE dbo.ConditionIndex
SET TotalWeight = null, Comments = 'TotalWeight not recorded'
WHERE OysterID = 'ABEC2304-16'

UPDATE dbo.ConditionIndex
SET ShellWetWeight = null, Comments = 'ShellWetWeight not recorded'
WHERE OysterID = 'ABEC2305-07'

UPDATE dbo.ConditionIndex
SET TotalWeight = 59.68
WHERE OysterID = 'ABEC2307-15'

UPDATE dbo.ConditionIndex
SET TotalWeight = 39.78
WHERE OysterID = 'ABEC2308-10'

UPDATE dbo.ConditionIndex
SET TotalWeight = 44.98
WHERE OysterID = 'ABEC2308-11'

UPDATE dbo.ConditionIndex
SET 
TissueWetWeight = 27.92,
ShellWetWeight = 234.8,
TissueDryWeight = 6.35,
ShellDryWeight = 208
WHERE OysterID = 'ABWC2312-15'

UPDATE dbo.ConditionIndex
SET 
TissueWetWeight = 10.37,
ShellWetWeight = 64.37,
TissueDryWeight = 3.26,
ShellDryWeight = 61.78
WHERE OysterID = 'ABWC2312-16'

--Dermo
UPDATE dbo.Dermo
SET Comments = null
WHERE OysterID = 'ABED2308-07'

UPDATE dbo.Dermo
SET ShellWetWeight = 91.09
WHERE OysterID = 'ABED2309-18'

UPDATE dbo.Dermo
SET ShellWetWeight = 78.74
WHERE OysterID = 'ABED2309-19'

UPDATE dbo.Dermo
SET ShellHeight = 79.95
WHERE OysterID = 'ABED2311-11'

--Repro

UPDATE dbo.Repro
SET Parasite = 'Yes'
WHERE OysterID = 'ABCD2309-03'


--------
-- Comments

update SampleEventWQ
set Comments = 'Salinity outside expected range'
where SampleEventWQID = 'ABCOLL_20230404_1_0007_1_01'

update SampleEventWQ
set Comments = 'Salinity outside expected range'
where SampleEventWQID = 'ABCOLL_20230404_1_0007_1_02'

update SampleEventWQ
set Comments = 'Salinity outside expected range'
where SampleEventWQID = 'ABCOLL_20230404_1_0011_1_01'

update SampleEventWQ
set Comments = 'Salinity outside expected range'
where SampleEventWQID = 'ABCOLL_20230404_1_0024_1_01'

update SampleEventWQ
set Comments = 'DissolvedOxygen outside expected range'
where SampleEventWQID = 'ABCOLL_20230801_1_0011_1_01'

update SampleEventWQ
set Comments = 'Turbidity outside expected range'
where SampleEventWQID = 'ABCOLL_20230605_1_0007_1_02'

update SampleEventWQ
set Comments = 'Turbidity outside expected range'
where SampleEventWQID = 'ABCOLL_20230905_1_0011_1_02'


-- CI Comments

update dbo.ConditionIndex
set Comments = null where comments = ''


GO
UPDATE ConditionIndex
SET Comments =
	CASE
WHEN OysterID = 'ABCC2303-17' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCC2307-14' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC2308-06' THEN 'WetWeights do not sum within the expected value; ShellWetWeight outside expected range'
WHEN OysterID = 'ABCC2311-04' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCC2312-11' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2304-18' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABEC2307-14' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2309-14' THEN 'not all wet tissue kept; WetWeights do not sum within the expected value'
WHEN OysterID = 'ABEC2312-09' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABEC2312-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2303-01' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2303-03' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2303-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2303-11' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2303-15' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2304-01' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2304-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2304-08' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2304-10' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2304-11' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2304-12' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2304-14' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC2304-16' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2304-17' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2304-18' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2304-21' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2304-23' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2305-02' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2305-04' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2305-12' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2305-20' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2305-22' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2306-01' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2306-03' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2306-05' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC2306-19' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2307-01' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2307-03' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2307-05' THEN 'TotalWeight and TissueWetWeight outside expected range'
WHEN OysterID = 'ABWC2307-07' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2307-11' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2307-15' THEN 'TotalWeight outside expected range; WetWeights do not sum within the expected value; ShellWetWeight and ShellDryWeight outside expected range'
WHEN OysterID = 'ABWC2307-18' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2307-22' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2307-24' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2308-01' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2308-03' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2308-04' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2308-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2308-06' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2308-11' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2308-12' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2308-15' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2308-17' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2308-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2308-24' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2309-03' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2309-07' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2309-11' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC2309-13' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2309-25' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2310-08' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC2310-10' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2310-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2311-03' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2311-04' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2311-06' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2311-07' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2311-10' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2311-13' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2311-21' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2311-23' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC2312-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2312-14' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC2312-15' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2312-17' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2312-18' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC2312-21' THEN 'ShellWidth and TotalWeight outside expected range'

ELSE Comments
END;
GO

-- Dermo comments
GO
UPDATE Dermo
SET Comments =
	CASE
WHEN OysterID = 'ABED2304-04' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED2304-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2305-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED2305-14' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED2306-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2309-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2312-08' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2306-20' THEN 'ShellLength, ShellWidth, and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2303-05' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2303-02' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2304-18' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2304-23' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2308-02' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2308-16' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2308-21' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABED2308-06' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABED2308-07' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2310-10' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABED2310-17' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD2303-13' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2303-21' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2304-04' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2304-08' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2304-09' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2304-13' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2304-15' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2304-22' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2305-06' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2305-23' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2306-11' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2306-12' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2306-21' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2306-22' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2307-08' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2307-17' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2307-18' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2307-22' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2308-08' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2308-09' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2308-12' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2308-24' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2309-05' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2309-13' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2309-15' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2311-04' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2311-07' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2311-09' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2311-15' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2312-20' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2312-23' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD2303-01' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2303-03' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2303-04' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2303-06' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2303-09' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2303-11' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2303-22' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2304-02' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2304-03' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2304-11' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2304-12' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2304-21' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2304-25' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2305-12' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2305-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2305-20' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2306-01' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2306-04' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2306-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2306-08' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2306-09' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2306-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2306-17' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2306-18' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2306-24' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2307-02' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2307-04' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2307-06' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2307-10' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2307-13' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2307-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2307-16' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2307-20' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED2307-22' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2308-01' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2308-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2308-20' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2308-25' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2310-08' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2310-18' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2310-23' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2311-06' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2311-11' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2311-13' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2311-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2311-19' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2312-07' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2312-15' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2312-18' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD2312-21' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED2312-03' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED2304-15' THEN 'ShellWetWeight outside expected range'
WHEN OysterID = 'ABCD2311-17' THEN 'ShellWetWeight outside expected range'

ELSE Comments
END;
GO
