-- Fixes
update SedimentTrap
set FilterTareWeight = 1.54
where CupSampleID = 'ABW2301-01-1'

-- comments
update SedimentTrap
set Comments = '2 filters'
where CupSampleID = 'ABC2304-06-4'

update SedimentTrap
set Comments = 'No pan'
where CupSampleID = 'ABE2303-13-3'

update SedimentTrap
set Comments = 'a lot of sediment'
where CupSampleID = 'ABC2303-09-2' 
or CupSampleID = 'ABC2303-09-3'	
or CupSampleID = 'ABW2305-04-4'	
or CupSampleID = 'ABC2306-09-1'	
or CupSampleID = 'ABC2306-09-2'	
or CupSampleID = 'ABC2306-09-4'	
or CupSampleID = 'ABE2306-13-3'


update SedimentTrap
set Comments = 'a lot of HermitCrabs'
where
CupSampleID = 'ABW2304-01-4'
or CupSampleID = 'ABW2306-01-1'

update SedimentTrap
set Comments = 'a lot of HermitCrabs; spilled some, 2 pans'
where
CupSampleID = 'ABW2309-01-3'