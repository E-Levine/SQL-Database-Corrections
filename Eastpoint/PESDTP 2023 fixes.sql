-- Trip comments
update TripInfo
set Comments = 'Initial deployment'
where TripID = 'PESDTP_20230120_1'

-- Remove initial deploy records
delete from SedimentTrap 
where CupSampleID like 'PE%2301%'

-- Fixes
update SedimentTrap
set DeployedDate = '2023-01-20'
where CupSampleID like 'PEN2302-01%'

update SedimentTrap
set FilterDryWeight = 1.62
where CupSampleID = 'PEN2306-02-2'

update SedimentTrap
set PanTareWeight = 0
where CupSampleID = 'PEE2306-08-4'

-- Comments
UPDATE SedimentTrap
set Comments = 'no pan used, all on filter'
where CupSampleID = 'PEN2302-05-1'
or CupSampleID = 'PEN2302-05-3'
or CupSampleID = 'PEE2302-09-3'
or CupSampleID = 'PEE2302-09-4'
or CupSampleID = 'PEN2303-05-1'
or CupSampleID = 'PEN2303-05-2'
or CupSampleID = 'PEE2303-08-4'

UPDATE SedimentTrap
set Comments = 'High number of biota found' 
where CupSampleID = 'PEE2304-07-4'
or CupSampleID = 'PEE2305-08-2'
or CupSampleID = 'PEE2305-08-3'
or CupSampleID = 'PEE2308-08-4'
or CupSampleID = 'PEN2310-01-3'
or CupSampleID = 'PEN2310-01-4'
or CupSampleID = 'PEE2310-07-3'




