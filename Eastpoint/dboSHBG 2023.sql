-- Fix SHs
update dbo.ShellBudgetSH
set ShellHeight = 47
where ShellHeightID = 'ABSHBG_20230530_1_0310_1_09_002';

update dbo.ShellBudgetSH
set ShellHeight = 91
where ShellHeightID = 'ABSHBG_20230530_1_0310_1_09_011'

update dbo.ShellBudgetSH
set ShellHeight = 54
where ShellHeightID = 'ABSHBG_20230530_1_0310_1_12_008'

update dbo.ShellBudgetSH
set ShellHeight = 36
where ShellHeightID = 'ABSHBG_20230530_1_0311_1_15_014'

update dbo.ShellBudgetSH
set ShellHeight = 31
where ShellHeightID = 'ABSHBG_20230608_1_0309_1_11_006'

update dbo.ShellBudgetSH
set ShellHeight = 30
where ShellHeightID = 'ABSHBG_20231030_1_0309_1_12_025'

update dbo.ShellBudgetSH
set ShellHeight = 72
where ShellHeightID = 'ABSHBG_20231030_1_0310_1_05_055'

update dbo.ShellBudgetSH
set ShellHeight = 4
where ShellHeightID = 'ABSHBG_20231027_1_0022_1_10_033'
update dbo.ShellBudgetSH
set ShellHeight = 6
where ShellHeightID = 'ABSHBG_20231027_1_0022_1_10_034'
update dbo.ShellBudgetSH
set ShellHeight = 5
where ShellHeightID = 'ABSHBG_20231027_1_0022_1_10_035'
update dbo.ShellBudgetSH
set ShellHeight = 7
where ShellHeightID = 'ABSHBG_20231027_1_0022_1_10_036'
update dbo.ShellBudgetSH
set ShellHeight = 5
where ShellHeightID = 'ABSHBG_20231027_1_0022_1_10_037'

insert into dbo.ShellBudgetSH
(ShellHeightID, QuadratID, LiveOrDead, ShellHeight, DataStatus, DateEntered, DateProofed, EnteredBy, ProofedBy, AdminNotes)
VALUES
('ABSHBG_20231014_1_0311_1_03_022', 'ABSHBG_20231014_1_0311_1_03', 'Live', 68, 'Proofed', '2024-03-06', '2024-03-06', 'Matthew Davis', 'Matthew Davis', 'Not entered with ODIN, inserted with SSMS')

-- Fix quadrat data
update dbo.ShellBudgetQuadrat
set LiveOysterVolume = 0.1
where QuadratID = 'ABSHBG_20230530_1_0009_1_13'

update dbo.ShellBudgetQuadrat
set OysterShellVolume = 1.25
where QuadratID = 'ABSHBG_20230608_1_0309_1_08'

update dbo.ShellBudgetQuadrat
set OysterShellVolume = 0.01
where QuadratID = 'ABSHBG_20230608_1_0023_1_10'

update dbo.ShellBudgetQuadrat
set PlantedShellWeight = 0.15, PlantedShellVolume = 0.05
where QuadratID = 'ABSHBG_20230530_1_0103_1_02'

update dbo.ShellBudgetQuadrat
set NumDeadOysters = 12
where QuadratID = 'ABSHBG_20230530_1_0310_1_13'

update dbo.ShellBudgetQuadrat
set NumDeadOysters = 11
where QuadratID = 'ABSHBG_20230608_1_0309_1_02'

update dbo.ShellBudgetQuadrat
set TotalSampleVolume = 2.7, LiveOysterVolume = 1.7
where QuadratID = 'ABSHBG_20231014_1_0311_1_07'

update dbo.ShellBudgetQuadrat
set TotalSampleVolume = 0.3
where QuadratID = 'ABSHBG_20231030_1_0009_1_13'

update dbo.ShellBudgetQuadrat
set TotalSampleVolume = 0.6
where QuadratID = 'ABSHBG_20231027_1_0022_1_10'

update dbo.ShellBudgetQuadrat
set TotalSampleWeight = 1.09
where QuadratID = 'ABSHBG_20231014_1_0104_1_02'

update dbo.ShellBudgetQuadrat
set TotalSampleVolume = 0.3
where QuadratID = 'ABSHBG_20231030_1_0009_1_06'

update dbo.ShellBudgetQuadrat
set LiveOysterWeight = 4.66
where QuadratID = 'ABSHBG_20231014_1_0311_1_12'

update dbo.ShellBudgetQuadrat
set OysterShellVolume = 0.05
where QuadratID = 'ABSHBG_20231014_1_0104_1_08'

update dbo.ShellBudgetQuadrat
set OysterShellVolume = 0.4
where QuadratID = 'ABSHBG_20231027_1_0022_1_01'

update dbo.ShellBudgetQuadrat
set OysterShellVolume = 0.4, PlantedShellVolume = 2.5, ShellHashVolume = 0.2
where QuadratID = 'ABSHBG_20231030_1_0309_1_05'

update dbo.ShellBudgetQuadrat
set ShellHashVolume = 0.15
where QuadratID = 'ABSHBG_20231014_1_0530_1_07'

update dbo.ShellBudgetQuadrat
set ShellHashVolume = 0.25
where QuadratID = 'ABSHBG_20231027_1_0023_1_11'



-- Add Quadrat comments
GO
UPDATE dbo.ShellBudgetQuadrat
SET Comments =
	CASE
WHEN QuadratID = 'ABSHBG_20230530_1_0009_1_01' THEN 'OtherBiotaWeight outside expected range; Sum of component volumes outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0009_1_04' THEN 'Ratio of TotalWeight to TotalVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0009_1_06' THEN 'OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0009_1_10' THEN 'Ratio of TotalWeight to TotalVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0009_1_12' THEN 'Ratio of OysterShellWeight to OysterShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0009_1_15' THEN 'Ratio of OysterShellWeight to OysterShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0103_1_02' THEN 'Live Oyster volume not recorded; Ratio of ShellHashWeight to ShellHashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0103_1_12' THEN 'Ratios of TotalWeight to TotalVolume, and  ShellHashWeight to ShellHashVolume outside expected ranges'
WHEN QuadratID = 'ABSHBG_20230530_1_0104_1_04' THEN 'Ratios of TotalWeight to TotalVolume, and  ShellHashWeight to ShellHashVolume outside expected ranges'
WHEN QuadratID = 'ABSHBG_20230530_1_0310_1_02' THEN 'Ratio of PlantedShellWeight to PlantedShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0310_1_03' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0310_1_05' THEN 'LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0310_1_06' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0310_1_08' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0310_1_13' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0310_1_14' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0310_1_15' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0311_1_07' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0311_1_08' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0311_1_09' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0311_1_10' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0311_1_12' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0311_1_13' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0311_1_14' THEN 'Ratio of PlantedShellWeight to PlantedShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0311_1_15' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0530_1_08' THEN 'Ratio of ShellHashWeight to ShellHashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0530_1_10' THEN 'Ratio of PlantedShellWeight to PlantedShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230530_1_0530_1_14' THEN 'Ratio of PlantedShellWeight to PlantedShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230608_1_0017_1_09' THEN 'Ratio of ShellHashWeight to ShellHashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230608_1_0017_1_11' THEN 'Ratio of ShellHashWeight to ShellHashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230608_1_0017_1_12' THEN 'OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20230608_1_0022_1_03' THEN 'Ratios of TotalWeight to TotalVolume, and  ShellHashWeight to ShellHashVolume outside expected ranges'
WHEN QuadratID = 'ABSHBG_20230608_1_0022_1_11' THEN 'HashWeight and HashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230608_1_0023_1_09' THEN 'HashWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20230608_1_0023_1_11' THEN 'HashWeight and HashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230608_1_0023_1_12' THEN 'HashWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20230608_1_0023_1_13' THEN 'HashWeight and HashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230608_1_0023_1_14' THEN 'HashWeight outside expected range; Ratio of ShellHashWeight to ShellHashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230608_1_0023_1_15' THEN 'HashWeight and HashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230608_1_0309_1_03' THEN 'ShellHashVolume not recorded; LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230608_1_0309_1_04' THEN 'Ratios of OysterShellWeight to OysterShellVolume, and ShellHashWeight to ShellHashVolume outside expected ranges'
WHEN QuadratID = 'ABSHBG_20230608_1_0309_1_05' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230608_1_0309_1_06' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230608_1_0309_1_09' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230608_1_0309_1_11' THEN 'LiveOysterVolume and OysterShellWeight outside expected ranges; Ratio of LiveOysterWeight to LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230608_1_0309_1_12' THEN 'OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20230608_1_0309_1_14' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20230608_1_0309_1_15' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231014_1_0103_1_05' THEN 'Ratio of ShellHashWeight to ShellHashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231014_1_0103_1_09' THEN 'Ratio of PlantedShellWeight to PlantedShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231014_1_0103_1_10' THEN 'Ratios of OysterShellWeight to OysterShellVolume, and PlantedShellWeight to PlantedShellVolume, and ShellHashWeight to ShellHashVolume  outside expected ranges'
WHEN QuadratID = 'ABSHBG_20231014_1_0104_1_06' THEN 'Ratio of OysterShellWeight to OysterShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231014_1_0104_1_09' THEN 'Ratio of ShellHashWeight to ShellHashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231014_1_0311_1_08' THEN 'Ratio of OysterShellWeight to OysterShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231014_1_0311_1_10' THEN 'LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231014_1_0311_1_12' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231014_1_0311_1_13' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231014_1_0311_1_14' THEN 'OtherBiotaWeight and LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231014_1_0311_1_15' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231014_1_0530_1_14' THEN 'Ratio of TotalWeight to TotalVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231027_1_0017_1_01' THEN 'NumDrills outside expected range'
WHEN QuadratID = 'ABSHBG_20231027_1_0017_1_02' THEN 'NumDrills outside expected range'
WHEN QuadratID = 'ABSHBG_20231027_1_0017_1_04' THEN 'Ratio of TotalWeight to TotalVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231027_1_0017_1_05' THEN 'Ratio of OysterShellWeight to OysterShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231027_1_0022_1_01' THEN 'Ratio of ShellHashWeight to ShellHashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231027_1_0023_1_07' THEN 'Ratio of PlantedShellWeight to PlantedShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231030_1_0009_1_05' THEN 'Sum of component volumes outside expected range; Ratio of PlantedShellWeight to PlantedShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231030_1_0009_1_11' THEN 'Ratio of TotalWeight to TotalVolume, and ShellHashWeight to ShellHashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231030_1_0309_1_02' THEN 'OtherBiotaWeight outside expected range; Ratio of ShellHashWeight to ShellHashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231030_1_0309_1_08' THEN 'OtherBiotaWeight outside expected range; Ratio of ShellHashWeight to ShellHashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231030_1_0309_1_10' THEN 'OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20231030_1_0309_1_12' THEN 'Ratio of OysterShellWeight to OysterShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231030_1_0309_1_15' THEN 'Ratio of OysterShellWeight to OysterShellVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231030_1_0310_1_02' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231030_1_0310_1_04' THEN 'OtherBiotaWeight outside expected range'
WHEN QuadratID = 'ABSHBG_20231030_1_0310_1_05' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231030_1_0310_1_06' THEN 'LiveOysterWeight and LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231030_1_0310_1_11' THEN 'Ratio of ShellHashWeight to ShellHashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231030_1_0310_1_12' THEN 'Ratios of OysterShellWeight to OysterShellVolume, and  ShellHashWeight to ShellHashVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231030_1_0310_1_13' THEN 'LiveOysterVolume outside expected range'
WHEN QuadratID = 'ABSHBG_20231030_1_0310_1_15' THEN 'LiveOysterWeight and LiveOysterVolume,  ShellHashWeight to ShellHashVolume outside expected range'

ELSE Comments
END;
GO 