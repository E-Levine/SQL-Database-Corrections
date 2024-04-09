-- Trip comments
update TripInfo
set Comments = 'Initial deployment'
where TripID = 'SASDTP_20230123_1'

-- Remove initial deploy records
delete from SedimentTrap 
where CupSampleID like 'SA%2301%'

-- Fixes
update SedimentTrap
set DeployedDate = '2023-02-13'
where CupSampleID like 'SAW2303-01%'

update SedimentTrap
set DeployedDate = '2023-08-14'
where CupSampleID like 'SAW2309-01%'

update SedimentTrap
set FilterTareWeight = 1.54
where CupSampleID = 'SAE2312-11-1'

update SedimentTrap
set FilterTareWeight = 1.53
where CupSampleID = 'SAE2312-11-3'

update SedimentTrap
set PanDryWeight = 0, PanTareWeight = 0
where CupSampleID = 'SAW2304-01-3'

-- Comments
update SedimentTrap
set Comments = '2 filters, 2 pans'
where CupSampleID = 'SAN2311-05-4'

update SedimentTrap
set Comments = 'high NumDrills'
where CupSampleID = 'SAN2307-05-4'

update SedimentTrap
set Comments = 'No pan, filter only'
where CupSampleID = 'SAW2302-01-1'
or CupSampleID = 'SAW2303-01-1'
or CupSampleID = 'SAW2303-01-4'
or CupSampleID = 'SAW2304-01-3'

update SedimentTrap
set Comments = 'FilterDryWeight outside expected range'
where CupSampleID = 'SAW2302-01-2'
or CupSampleID = 'SAW2303-01-2'

