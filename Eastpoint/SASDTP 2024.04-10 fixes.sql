-- SA Sediment 04/24 - 10/24

-- Database Errors
-- None

--WQ errors
-- None

-- Sediment Traps

-- Trip comments
-- None

-- Fixes
update SedimentTrap
set DeployedDate = '2024-04-15'
where CupSampleID like 'SAW2405-01%'

update SedimentTrap
set FilterTareWeight = null,
FilterDryWeight = null,
Comments = 'FilterTareWeight and FilterDryWeight not recorded'
where CupSampleID = 'SAN2404-07-2'

update SedimentTrap
set FilterTareWeight = 1.52
where CupSampleID = 'SAW2408-01-2'

update SedimentTrap
set Comments = '2 filters'
where CupSampleID = 'SAW2408-01-1'

update SedimentTrap
set Comments = 'Unexpected high FilterTareWeight'
where CupSampleID = 'SAE2409-08-4'

update SedimentTrap
set PanDryWeight = 411.08
where CupSampleID = 'SAN2408-07-1'



-- Comments

update SedimentTrap
set Comments = 'PanDryWeight outside expected range'
where CupSampleID = 'SAW2404-01-1'
or CupSampleID = 'SAW2404-01-2'
or CupSampleID = 'SAW2404-01-3'
or CupSampleID = 'SAW2404-01-4'
or CupSampleID = 'SAW2404-04-3'
or CupSampleID = 'SAW2407-01-1'



