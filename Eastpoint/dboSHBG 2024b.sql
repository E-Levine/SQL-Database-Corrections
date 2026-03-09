-- Fixes for AB Shell Budget 07/2024 - 12/2024

-- Fix quadrat data
update dbo.ShellBudgetQuadrat
set 
LiveOysterVolume = null,
PlantedShellVolume = null,
ShellHashVolume = null,
Comments = 'LiveOyster, PlantedShell, and ShellHash volumes marked as questionable and removed'
where QuadratID = 'ABSHBG_20241112_1_0104_1_07';

-- Fix SHs
-- none

-- Add WQ comments
GO
UPDATE dbo.SampleEventWQ
SET Comments = 
	CASE

WHEN SampleEventWQID = 'ABSHBG_20241205_1_0309_1_01' THEN 'TurbidityYSI outside expected range'
WHEN SampleEventWQID = 'ABSHBG_20241205_1_0017_1_01' THEN 'TurbidityYSI outside expected range'
WHEN SampleEventWQID = 'ABSHBG_20241205_1_0017_1_02' THEN 'TurbidityYSI outside expected range'

ELSE Comments
END;
GO 

-- Add Quadrat comments
GO
UPDATE dbo.ShellBudgetQuadrat
SET Comments =
	CASE
WHEN QuadratID = 'ABSHBG_20241112_1_0103_1_02' THEN 'HashWeight to HashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20241112_1_0104_1_08' THEN 'LiveOysterWeight to LiveOysterVolume ratio outside expected range'
WHEN QuadratID = 'ABSHBG_20241125_1_0310_1_06' THEN 'LiveOysterVolume and OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20241125_1_0310_1_08' THEN 'OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20241125_1_0310_1_15' THEN 'HashWeight to HashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20241125_1_0311_1_01' THEN 'LiveOysterWeight to LiveOysterVolume ratio outside expected range'
WHEN QuadratID = 'ABSHBG_20241125_1_0311_1_02' THEN 'LiveOysterVolume and HashWeight outside expected ranges'
WHEN QuadratID = 'ABSHBG_20241125_1_0311_1_10' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20241125_1_0311_1_12' THEN 'LiveOysterWeight to LiveOysterVolume ratio outside expected range'
WHEN QuadratID = 'ABSHBG_20241125_1_0311_1_14' THEN 'HashWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20241125_1_0311_1_15' THEN 'HashWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20241125_1_0530_1_06' THEN 'OysterShellWeight to OysterShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20241205_1_0009_1_07' THEN 'PlantedShellWeight to PlantedShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20241205_1_0009_1_12' THEN 'HashWeight to HashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20241205_1_0017_1_06' THEN 'PlantedShellWeight to PlantedShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20241205_1_0017_1_07' THEN 'OysterShellWeight to OysterShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20241205_1_0023_1_05' THEN 'LiveOysterWeight to LiveOysterVolume ratio outside expected range'
WHEN QuadratID = 'ABSHBG_20241205_1_0309_1_01' THEN 'LiveOysterVolume and OtherBiotaWeight outside expected ranges'
WHEN QuadratID = 'ABSHBG_20241205_1_0309_1_04' THEN 'OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20241205_1_0309_1_07' THEN 'LiveOysterWeight to LiveOysterVolume ratio outside expected range; OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20241205_1_0309_1_08' THEN 'OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20241205_1_0309_1_09' THEN 'OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20241205_1_0309_1_10' THEN 'PlantedShellWeight to PlantedShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20241205_1_0309_1_11' THEN 'OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20241205_1_0309_1_13' THEN 'OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20241205_1_0309_1_14' THEN 'OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20241205_1_0309_1_15' THEN 'OtherBiotaWeight outside expected range'

ELSE Comments
END;
GO 