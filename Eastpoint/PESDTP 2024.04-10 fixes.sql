-- SA Sediment 04/24 - 10/24

-- Database Errors
-- None

--WQ errors
-- None

-- Sediment Traps

-- TripInfo
-- SampleEvent
-- None

-- Fixes and Comments
update SedimentTrap
set FilterDryWeight = 1.65
where CupSampleID = 'PEN2409-02-3'

update SedimentTrap
set FilterDryWeight = 3.23
where CupSampleID = 'PEE2407-09-3'

update SedimentTrap
set Comments = 'HermitCrabs outside expected range'
where CupSampleID = 'PEE2407-08-2'
or CupSampleID = 'PEE2407-08-4'
or CupSampleID = 'PEE2407-09-1'
or CupSampleID = 'PEN2408-05-3'
or CupSampleID = 'PEE2409-07-1'
or CupSampleID = 'PEE2409-07-2'
or CupSampleID = 'PEE2409-08-4'
or CupSampleID = 'PEN2410-01-4'
or CupSampleID = 'PEE2410-07-4'
or CupSampleID = 'PEE2410-08-2'
or CupSampleID = 'PEE2410-08-3'

update SedimentTrap
set Comments = '2 filters; HermitCrabs outside expected range'
where CupSampleID = 'PEE2407-09-3'



