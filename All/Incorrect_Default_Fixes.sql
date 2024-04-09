--Code to correct default ODIN values passed to database:
--Check data in local copy first
USE OysterLocalMD20231227
GO



--TripInfo
--Fix blank Comments
update TripInfo set Comments = NULL where Comments = ''



--SampleEvent
--Fix blank Comments
update SampleEvent set Comments = NULL 
where Comments = ''

--Fix blank HarvestStatus
update SampleEvent set HarvestStatus = NULL 
where Comments = ''

--Fix LatDec and LongDec equals 0
update SampleEvent set LatDec = NULL,
LongDec = NULL
Where LatDec = 0

--Fix LongitudeDec to be negative
update SampleEvent set LongitudeDec = LongitudeDec * -1 
where LongitudeDec > 0

--Fix NumDrills equals 0
update SampleEvent set NumDrills = NULL 
where SUBSTRING(TripID, 3, 4) != 'RCRT'



--SampleEventWQ
--Fix blank Comments
update SampleEventwq set Comments = NULL
where comments = ''

--Fix blank YSINotes
update SampleEventwq set YSINotes = NULL
where YSINotes = ''

--Fix CollectionTime equals 0
update SampleEventwq set CollectionTime = NULL
where CollectionTime = 0



--Recruitment
--Fix blank Comments
update Recruitment set Comments = NULL
where comments = ''



--SedimentTrap
--Fix blank Comments
update SedimentTrap set Comments = NULL
where comments = ''

--Fix Biota equals 0
update SedimentTrap 
set NumCrabs = NULL, NumDrills = NULL, NumFish = NULL, NumHermitCrabs = NULL, NumOtherBiota = NULL
where FilterTareWeight is null and SUBSTRING(CupSampleID, 1, 2) = 'AB' and NumDrills = 0

--Fix Weights and Biota equals 0
update SedimentTrap 
set FilterTareWeight = NULL, FilterDryWeight = NULL, PanTareWeight = NULL, PanDryWeight = NULL,
NumCrabs = NULL, NumDrills = NULL, NumFish = NULL, NumHermitCrabs = NULL, NumOtherBiota = NULL
where FilterTareWeight = 0 



--SurveyQuadrat
--Fix blank Comments
update SurveyQuadrat set Comments = NULL
where comments = ''



--SurveySH
--Fix blank Comments
update SurveySH set Comments = NULL
where comments = ''



--ShellBudgetQuadrat
--Fix blank Comments
update ShellBudgetQuadrat set Comments = NULL
where comments = ''



--ShellBudgetSH
--Fix blank Comments
update ShellBudgetSH set Comments = NULL
where comments = ''



--ConditionIndex
--Fix blank Comments
update ConditionIndex set Comments = NULL
where comments = ''



--Dermo
--Fix blank Comments
update Dermo set Comments = NULL
where comments = ''



--Repro
--Nothing to fix