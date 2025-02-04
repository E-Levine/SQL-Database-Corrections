-- AB Sediment 03/24 - 09/24

-- Database Errors
-- Fixes
update TripInfo
set EnteredBy = 'Abigail Ladner'
where TripID like 'ABSDTP_202408%'

update SampleEvent 
set EnteredBy = 'Abigail Ladner'
where SampleEventID like 'ABSDTP_202408%'

update SampleEventWQ 
set EnteredBy = 'Abigail Ladner'
where SampleEventID like 'ABSDTP_202408%'

update SedimentTrap 
set EnteredBy = 'Abigail Ladner'
where SampleEventID like 'ABSDTP_202408%'


-- TripInfo
-- SampleEvent
-- WQ 
	-- None

-- Sediment Traps
	-- Fixes and Comments
Update SedimentTrap SET FilterTareWeight = 1.44, FilterDryWeight = 1.48 WHERE CupSampleID = 'ABC2403-06-1';
Update SedimentTrap SET FilterTareWeight = 1.46, FilterDryWeight = 1.48 WHERE CupSampleID = 'ABC2403-06-2';
Update SedimentTrap SET FilterTareWeight = 1.57, FilterDryWeight = 1.58 WHERE CupSampleID = 'ABC2403-06-3';
Update SedimentTrap SET FilterTareWeight = 1.49, FilterDryWeight = 1.5 WHERE CupSampleID = 'ABC2403-06-4';
Update SedimentTrap SET FilterTareWeight = 1.56, FilterDryWeight = 1.58 WHERE CupSampleID = 'ABC2403-09-1';
Update SedimentTrap SET FilterTareWeight = 1.58, FilterDryWeight = 1.59 WHERE CupSampleID = 'ABC2403-09-2';
Update SedimentTrap SET FilterTareWeight = 1.45, FilterDryWeight = 1.48 WHERE CupSampleID = 'ABC2403-09-3';
Update SedimentTrap SET FilterTareWeight = 1.53, FilterDryWeight = 1.53 WHERE CupSampleID = 'ABC2403-09-4';
Update SedimentTrap SET FilterTareWeight = 1.57, FilterDryWeight = 1.61 WHERE CupSampleID = 'ABE2403-12-1';
Update SedimentTrap SET FilterTareWeight = 1.57, FilterDryWeight = 1.6 WHERE CupSampleID = 'ABE2403-12-2';
Update SedimentTrap SET FilterTareWeight = 1.45, FilterDryWeight = 1.51 WHERE CupSampleID = 'ABE2403-12-3';
Update SedimentTrap SET FilterTareWeight = 1.53, FilterDryWeight = 1.58 WHERE CupSampleID = 'ABE2403-12-4';
Update SedimentTrap SET FilterTareWeight = 1.54, FilterDryWeight = 1.57 WHERE CupSampleID = 'ABE2403-13-1';
Update SedimentTrap SET FilterTareWeight = 1.56, FilterDryWeight = 1.59 WHERE CupSampleID = 'ABE2403-13-2';
Update SedimentTrap SET FilterTareWeight = 1.48, FilterDryWeight = 1.5 WHERE CupSampleID = 'ABE2403-13-3';
Update SedimentTrap SET FilterTareWeight = 1.49, FilterDryWeight = 1.5 WHERE CupSampleID = 'ABE2403-13-4';
Update SedimentTrap SET FilterTareWeight = 1.48, FilterDryWeight = 1.5 WHERE CupSampleID = 'ABW2403-01-1';
Update SedimentTrap SET FilterTareWeight = 1.44, FilterDryWeight = 1.47 WHERE CupSampleID = 'ABW2403-01-2';
Update SedimentTrap SET FilterTareWeight = 1.58, FilterDryWeight = 1.59 WHERE CupSampleID = 'ABW2403-01-3';
Update SedimentTrap SET FilterTareWeight = 1.44, FilterDryWeight = 1.47 WHERE CupSampleID = 'ABW2403-01-4';
Update SedimentTrap SET FilterTareWeight = 1.08, FilterDryWeight = 1.6 WHERE CupSampleID = 'ABW2403-04-1';
Update SedimentTrap SET FilterTareWeight = 1.47, FilterDryWeight = 1.49 WHERE CupSampleID = 'ABW2403-04-2';
Update SedimentTrap SET FilterTareWeight = 1.58, FilterDryWeight = 1.59 WHERE CupSampleID = 'ABW2403-04-3';
Update SedimentTrap SET FilterTareWeight = 1.57, FilterDryWeight = 1.58 WHERE CupSampleID = 'ABW2403-04-4';

Update SedimentTrap SET FilterDryWeight = 1.56 WHERE CupSampleID = 'ABW2405-01-3';
Update SedimentTrap SET FilterDryWeight = 1.49 WHERE CupSampleID = 'ABC2405-06-2';
Update SedimentTrap SET FilterDryWeight = 1.50 WHERE CupSampleID = 'ABC2405-06-4';
Update SedimentTrap SET FilterDryWeight = 1.56 WHERE CupSampleID = 'ABE2405-12-1';

Update SedimentTrap SET PanDryWeight = 452.6 WHERE CupSampleID = 'ABW2406-01-3';

Update SedimentTrap SET 
Comments = 'PanDryWeight outside expected range' 
WHERE CupSampleID = 'ABW2408-04-4';

Update SedimentTrap SET 
Comments = 'HermitCrabs outside expected range' 
WHERE CupSampleID = 'ABW2408-01-3';