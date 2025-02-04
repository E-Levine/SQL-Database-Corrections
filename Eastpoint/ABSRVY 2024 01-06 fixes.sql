-- AB Survey 01/24 - 06/24

--Database Errors
--none


-- SampleEvent fixes


-- WQ
update SampleEventWQ
set Comments = 'Salinity outside expected range'
where SampleEventWQID like 'ABSRVY_20240419_1_0007_1_%'

-- Quadrat
update SurveyQuadrat
set NumDead = 0, NumDrills = 0, Comments = null
where QuadratID = 'ABSRVY_20240401_1_0100_1_03'

update SurveyQuadrat
set TotalVolume = 0.05
where QuadratID = 'ABSRVY_20240405_1_0016_1_14'

-- SHs
update SurveySH
set ShellHeight = 22
where ShellHeightID = 'ABSRVY_20240401_1_0100_1_03_019'

update SurveySH
set ShellHeight = 3
where ShellHeightID = 'ABSRVY_20240401_1_0100_1_03_020'

update SurveySH
set ShellHeight = 6
where ShellHeightID = 'ABSRVY_20240401_1_0100_1_03_021'

-- Survey
-- Fixes

insert into SurveySH (
ShellHeightID,
QuadratID,
ShellHeight,
DataStatus,
DateEntered,
EnteredBy,
DateProofed,
ProofedBy
)
VALUES
(
'ABSRVY_20240405_1_0019_1_07_007',
'ABSRVY_20240405_1_0019_1_07',
20,
'Proofed',
'2024-12-16',
'Matthew Davis',
'2024-12-16',
'Matthew Davis'
)

-- Comments

UPDATE SurveyQuadrat
SET Comments = 'Weight to volume ratio outside expected range'
WHERE
QuadratID = 'ABSRVY_20240401_1_0538_1_02' OR
QuadratID = 'ABSRVY_20240401_1_0538_1_07' OR
QuadratID = 'ABSRVY_20240401_1_0538_1_08' OR
QuadratID = 'ABSRVY_20240401_1_0538_1_10' OR
QuadratID = 'ABSRVY_20240401_1_0538_1_11' OR
QuadratID = 'ABSRVY_20240401_1_0538_1_12' OR
QuadratID = 'ABSRVY_20240401_1_0539_1_03' OR
QuadratID = 'ABSRVY_20240401_1_0539_1_09' OR
QuadratID = 'ABSRVY_20240401_1_0540_1_09' OR
QuadratID = 'ABSRVY_20240401_1_0540_1_14' OR
QuadratID = 'ABSRVY_20240401_1_0100_1_05' OR
QuadratID = 'ABSRVY_20240405_1_0016_1_06' OR
QuadratID = 'ABSRVY_20240405_1_0016_1_08' OR
QuadratID = 'ABSRVY_20240405_1_0016_1_14' OR
QuadratID = 'ABSRVY_20240405_1_0024_1_05' OR
QuadratID = 'ABSRVY_20240405_1_0024_1_07' OR
QuadratID = 'ABSRVY_20240405_1_0024_1_08' OR
QuadratID = 'ABSRVY_20240405_1_0024_1_09' OR
QuadratID = 'ABSRVY_20240405_1_0024_1_10' OR
QuadratID = 'ABSRVY_20240419_1_0011_1_01' OR
QuadratID = 'ABSRVY_20240419_1_0011_1_02' OR
QuadratID = 'ABSRVY_20240419_1_0011_1_03'




