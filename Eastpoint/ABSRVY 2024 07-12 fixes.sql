-- AB Survey 07/24 - 12/24

--Database Errors
--none


-- SampleEvent fixes


-- WQ
update SampleEventWQ
set Comments = 'Salinity outside expected range'
where SampleEventWQID = 'ABSRVY_20241001_1_0007_1_01'

update SampleEventWQ
set Comments = 'DissolvedOxygen outside expected range'
where SampleEventWQID like 'ABSRVY_20240923_1_0156%' or
SampleEventWQID like 'ABSRVY_20240923_1_0158%'

-- Quadrat
-- none

-- SHs
--none

-- Survey
-- Fixes

-- Comments

UPDATE SurveyQuadrat
SET Comments = 'Weight to volume ratio outside expected range'
WHERE
QuadratID = 'ABSRVY_20240919_1_0016_1_07' OR
QuadratID = 'ABSRVY_20240919_1_0019_1_07' OR
QuadratID = 'ABSRVY_20240919_1_0019_1_09' OR
QuadratID = 'ABSRVY_20240919_1_0102_1_02' OR
QuadratID = 'ABSRVY_20240919_1_0102_1_04' OR
QuadratID = 'ABSRVY_20240919_1_0102_1_05' OR
QuadratID = 'ABSRVY_20240923_1_0156_1_03' OR
QuadratID = 'ABSRVY_20240923_1_0158_1_06' OR
QuadratID = 'ABSRVY_20240923_1_0158_1_11' OR
QuadratID = 'ABSRVY_20240923_1_0158_1_12' OR
QuadratID = 'ABSRVY_20240923_1_0158_1_13' OR
QuadratID = 'ABSRVY_20240923_1_0158_1_15' OR
QuadratID = 'ABSRVY_20240923_1_0308_1_11' OR
QuadratID = 'ABSRVY_20241001_1_0007_1_08' OR
QuadratID = 'ABSRVY_20241001_1_0007_1_11' OR
QuadratID = 'ABSRVY_20241001_1_0007_1_12' OR
QuadratID = 'ABSRVY_20241001_1_0011_1_10' OR
QuadratID = 'ABSRVY_20241001_1_0011_1_12' OR
QuadratID = 'ABSRVY_20241001_1_0011_1_15' OR
QuadratID = 'ABSRVY_20241001_1_0024_1_03' OR
QuadratID = 'ABSRVY_20241001_1_0024_1_07' OR
QuadratID = 'ABSRVY_20241001_1_0539_1_06' OR
QuadratID = 'ABSRVY_20241001_1_0539_1_08' OR
QuadratID = 'ABSRVY_20241001_1_0539_1_09' OR
QuadratID = 'ABSRVY_20241001_1_0539_1_13' OR
QuadratID = 'ABSRVY_20241001_1_0100_1_03' OR
QuadratID = 'ABSRVY_20241001_1_0100_1_06' OR
QuadratID = 'ABSRVY_20241001_1_0100_1_07' OR
QuadratID = 'ABSRVY_20241001_1_0100_1_08' OR
QuadratID = 'ABSRVY_20241001_1_0100_1_09' OR
QuadratID = 'ABSRVY_20241001_1_0100_1_10' OR
QuadratID = 'ABSRVY_20241001_1_0100_1_14' 


