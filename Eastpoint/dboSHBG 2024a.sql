-- Fix quadrat data
update dbo.ShellBudgetQuadrat
set LiveOysterVolume = 1.35
where QuadratID = 'ABSHBG_20240529_1_0311_1_05';

update dbo.ShellBudgetQuadrat
set BlackAndOtherSubstrateVolume = 0,
BlackAndOtherSubstrateWeight = 0,
Comments = null
where QuadratID = 'ABSHBG_20240529_1_0311_1_10';

update dbo.ShellBudgetQuadrat
set PlantedShellVolume = 0.15
where QuadratID = 'ABSHBG_20240419_1_0009_1_01';

update dbo.ShellBudgetQuadrat
set NumDeadOysters = 1
where QuadratID = 'ABSHBG_20240529_1_0530_1_05';


-- Fix SHs
update dbo.ShellBudgetSH
set ShellHeight = 10
where ShellHeightID = 'ABSHBG_20240424_1_0023_1_03_024';

update dbo.ShellBudgetSH
set ShellHeight = 10
where ShellHeightID = 'ABSHBG_20240424_1_0023_1_11_031';

update dbo.ShellBudgetSH
set ShellHeight = 36
where ShellHeightID = 'ABSHBG_20240529_1_0310_1_04_005';


-- Fix Location data
update dbo.SampleEvent
set LongitudeDec = -84.92710
where SampleEventID = 'ABSHBG_20240419_1_0009_1'




-- Add Quadrat comments
GO
UPDATE dbo.ShellBudgetQuadrat
SET Comments =
	CASE
WHEN QuadratID = 'ABSHBG_20240419_1_0009_1_05' THEN 'Ratio of LiveOysterWeight to LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240419_1_0009_1_07' THEN 'OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20240419_1_0009_1_08' THEN 'Sum of component volumes outside expected range; OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20240419_1_0009_1_14' THEN 'OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20240419_1_0009_1_15' THEN 'OtherBiotaWeight outside expected range; Ratio of LiveOysterWeight to LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240419_1_0309_1_01' THEN 'LiveOysterVolume outside expected range; OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20240419_1_0309_1_03' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range; OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20240419_1_0309_1_04' THEN 'LiveOysterWeight and LiveOysterVolume, OtherBiotaWeight, and Ratio of PlantedShellWeight to PlantedShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240419_1_0309_1_06' THEN 'LiveOysterWeight and LiveOysterVolume, OtherBiotaWeight, and Ratio of PlantedShellWeight to PlantedShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240419_1_0309_1_08' THEN 'OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20240419_1_0309_1_09' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range; OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20240419_1_0309_1_10' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range; OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20240419_1_0309_1_11' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range; OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20240419_1_0309_1_12' THEN 'LiveOysterVolume outside expected range; OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20240419_1_0309_1_13' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range; OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20240419_1_0309_1_14' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range; OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20240419_1_0309_1_15' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range; OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20240424_1_0017_1_03' THEN 'Ratio of OysterShellWeight to OysterShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240424_1_0023_1_01' THEN 'Ratio of OysterShellWeight to OysterShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0310_1_01' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0310_1_02' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range; Ratio of HashWeight to HashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0310_1_04' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range; OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0310_1_06' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0310_1_07' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range; OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0310_1_13' THEN 'LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0310_1_14' THEN 'Ratio of HashWeight to HashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0311_1_02' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0311_1_03' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0311_1_05' THEN 'Ratio of PlantedShellWeight to PlantedShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0311_1_07' THEN 'Ratio of LiveOysterWeight to LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0311_1_10' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range; Ratio of PlantedShellWeight to PlantedShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0311_1_11' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range; Ratio of PlantedShellWeight to PlantedShellVolume outside expected range; Ratio of HashWeight to HashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0311_1_12' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0311_1_13' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0311_1_14' THEN 'OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0311_1_15' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0530_1_11' THEN 'Ratio of PlantedShellWeight to PlantedShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20240529_1_0530_1_14' THEN 'Ratio of TotalWeight to TotalVolume outside expected range; Ratio of HashWeight to HashVolume outside expected range'

ELSE Comments
END;
GO 