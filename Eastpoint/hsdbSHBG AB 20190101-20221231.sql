-- Fix Database Errors
insert into hsdb.ShellBudgetSH
(ShellHeightID, QuadratID, LiveOrDead, DataStatus)
VALUES
('ABSHBG_20201114_1_0025_1_15_008', 'ABSHBG_20201114_1_0025_1_15', 'Dead', 'Proofed')

-- Fix SH 0 -> NULL error
update hsdb.ShellBudgetSH
set ShellHeight = NULL
WHERE ShellHeight < 1

-- Fix Data errors
update hsdb.ShellBudgetQuadrat
set TotalSampleVolume = 0.8, ShellHashVolume = 0.2
where QuadratID = 'ABSHBG_20221027_1_0009_1_04'

update hsdb.ShellBudgetSH
set LiveOrDead = 'Live', ShellHeight = 14
where ShellHeightID = 'ABSHBG_20191121_1_0017_1_07_001'

update hsdb.ShellBudgetSH
set LiveOrDead = 'Dead'
where ShellHeightID = 'ABSHBG_20191121_1_0017_1_07_002'

update hsdb.SampleEvent
set LatitudeDec = 29.7369
where SampleEventID = 'ABSHBG_20220803_1_0009_1'

update hsdb.ShellBudgetQuadrat
set Comments = 'OtherBiota is Mussels'
where QuadratID = 'ABSHBG_20220504_1_0009_1_01' 
OR QuadratID = 'ABSHBG_20220504_1_0009_1_02' 
OR QuadratID = 'ABSHBG_20220504_1_0009_1_03' 
OR QuadratID = 'ABSHBG_20221027_1_0009_1_10' 
OR QuadratID = 'ABSHBG_20221027_1_0009_1_12'

update hsdb.ShellBudgetQuadrat
set BlackAndOtherSubstrateVolume = 0.05
where QuadratID = 'ABSHBG_20200116_1_0104_1_15'

update hsdb.ShellBudgetQuadrat
set PlantedShellWeight = 8.54, PlantedShellVolume = 3.15, 
ShellHashWeight = 0.18, ShellHashVolume = 0.1
where QuadratID = 'ABSHBG_20220524_1_0310_1_08'

update hsdb.ShellBudgetQuadrat 
set TotalSampleVolume = 0.09
where QuadratID = 'ABSHBG_20210129_1_0025_1_04'

update hsdb.ShellBudgetQuadrat
set OysterShellVolume = 0.05
where QuadratID = 'ABSHBG_20200116_1_0022_1_12'

update hsdb.ShellBudgetQuadrat
set PlantedShellVolume = 0.01
where QuadratID = 'ABSHBG_20200727_1_0092_1_05'

update hsdb.ShellBudgetQuadrat
set PlantedShellVolume = 0.04
where QuadratID = 'ABSHBG_20201114_1_0017_1_05'

update hsdb.ShellBudgetQuadrat
set PlantedShellVolume = 0.04
where QuadratID = 'ABSHBG_20201114_1_0092_1_04'

update hsdb.ShellBudgetQuadrat
set PlantedShellVolume = 0.2
where QuadratID = 'ABSHBG_20220524_1_0104_1_06'

update hsdb.ShellBudgetQuadrat
set ShellHashVolume = 0.05
where QuadratID = 'ABSHBG_20200116_1_0104_1_09'

update hsdb.ShellBudgetQuadrat
set ShellHashVolume = 0.01
where QuadratID = 'ABSHBG_20200727_1_0025_1_01'

update hsdb.ShellBudgetQuadrat
set ShellHashVolume = 0.04
where QuadratID = 'ABSHBG_20201114_1_0025_1_14'

update hsdb.ShellBudgetQuadrat
set BlackAndOtherSubstrateVolume = 0.1
where QuadratID = 'ABSHBG_20210429_1_0017_1_15'

update hsdb.ShellBudgetQuadrat
set NumLiveOysters = 10 
where QuadratID = 'ABSHBG_20191122_1_0095_1_09'

insert into hsdb.ShellBudgetSH
(ShellHeightID, QuadratID, LiveOrDead, ShellHeight, DataStatus)
VALUES
('ABSHBG_20201114_1_0103_1_14_070', 'ABSHBG_20201114_1_0103_1_14', 'Live', 6, 'Proofed')

insert into hsdb.ShellBudgetSH
(ShellHeightID, QuadratID, LiveOrDead, ShellHeight, DataStatus)
VALUES
('ABSHBG_20210429_1_0022_1_15_016', 'ABSHBG_20210429_1_0022_1_15', 'Live', 16, 'Proofed')

update hsdb.ShellBudgetQuadrat
set NumLiveOysters = 14
where QuadratID = 'ABSHBG_20220803_1_0009_1_03'

update hsdb.ShellBudgetQuadrat
set NumLiveOysters = 20
where QuadratID = 'ABSHBG_20220822_1_0103_1_06'

update hsdb.ShellBudgetQuadrat
set NumDeadOysters = 16
where QuadratID = 'ABSHBG_20220524_1_0310_1_01'