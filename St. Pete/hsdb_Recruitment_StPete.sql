--HSDB Checks: TB RCRT 2008-2011

--TB RCRT 2008
--Run TB_RCRT_WQ_EW SQL code First
DELETE from [hsdb].[TripInfo] where TripID like 'TBRCRT_20080828_1' or TripID like 'TBRCRT_20080829_1' or TripID like 'TBRCRT_20080903_1' or TripID like 'TBRCRT_20080915_1' or TripID like 'TBRCRT_20080916_1' or TripID like 'TBRCRT_20080917_1'
DELETE FROM [hsdb].[TripInfo] where TripID like 'TBRCRT_20081006%' or TripID like 'TBRCRT_20081007%' or TripID like 'TBRCRT_20081008%'
DELETE FROM [hsdb].[SampleEvent] where TripID like 'TBRCRT_20081006%' or TripID like 'TBRCRT_20081007%' or TripID like 'TBRCRT_20081008%'
DELETE FROM [hsdb].[SampleEventWQ] where SampleEventID like 'TBRCRT_20081006%' or SampleEventID like 'TBRCRT_20081007%' or SampleEventID like 'TBRCRT_20081008%'
DELETE FROM [hsdb].[Recruitment] where SampleEventID like 'TBRCRT_20081006%' or SampleEventID like 'TBRCRT_20081007%' or SampleEventID like 'TBRCRT_20081008%'
DELETE FROM [hsdb].[TripInfo] where TripID like 'TBRCRT_20081103%' or TripID like 'TBRCRT_20081105%' or TripID like 'TBRCRT_20081112%'
DELETE FROM [hsdb].[SampleEvent] where TripID like 'TBRCRT_20081103%' or TripID like 'TBRCRT_20081105%' or TripID like 'TBRCRT_20081112%'
DELETE FROM [hsdb].[SampleEventWQ] where SampleEventID like 'TBRCRT_20081103%' or SampleEventID like 'TBRCRT_20081105%' or SampleEventID like 'TBRCRT_20081112%'
DELETE FROM [hsdb].[Recruitment] where SampleEventID like 'TBRCRT_20081103%' or SampleEventID like 'TBRCRT_20081105%' or SampleEventID like 'TBRCRT_20081112%'
DELETE FROM [hsdb].[TripInfo] where TripID like 'TBRCRT_20081201%' or TripID like 'TBRCRT_20081203%' or TripID like 'TBRCRT_20081209%'
DELETE FROM [hsdb].[SampleEvent] where TripID like 'TBRCRT_20081201%' or TripID like 'TBRCRT_20081203%' or TripID like 'TBRCRT_20081209%'
DELETE FROM [hsdb].[SampleEventWQ] where SampleEventID like 'TBRCRT_20081201%' or SampleEventID like 'TBRCRT_20081203%' or SampleEventID like 'TBRCRT_20081209%'
DELETE FROM [hsdb].[Recruitment] where SampleEventID like 'TBRCRT_20081201%' or SampleEventID like 'TBRCRT_20081203%' or SampleEventID like 'TBRCRT_20081209%'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'T-bar missing' else ', T-bar missing' end) where SampleEventID like 'TBRCRT_20080421_1_0280%' and ShellReplicate like '1'

--TB RCRT 2009
DELETE FROM [hsdb].[TripInfo] where TripID like 'TBRCRT_20090106%' or TripID like 'TBRCRT_20090108%' or TripID like 'TBRCRT_20090113%'
DELETE FROM [hsdb].[SampleEvent] where TripID like 'TBRCRT_20090106%' or TripID like 'TBRCRT_20090108%' or TripID like 'TBRCRT_20090113%'
DELETE FROM [hsdb].[SampleEventWQ] where SampleEventID like 'TBRCRT_20090106%' or SampleEventID like 'TBRCRT_20090108%' or SampleEventID like 'TBRCRT_20090113%'
DELETE FROM [hsdb].[Recruitment] where SampleEventID like 'TBRCRT_20090106%' or SampleEventID like 'TBRCRT_20090108%' or SampleEventID like 'TBRCRT_20090113%'
DELETE FROM [hsdb].[TripInfo] where TripID like 'TBRCRT_20090203%' or TripID like 'TBRCRT_20090205%' or TripID like 'TBRCRT_20090209%'
DELETE FROM [hsdb].[SampleEvent] where TripID like 'TBRCRT_20090203%' or TripID like 'TBRCRT_20090205%' or TripID like 'TBRCRT_20090209%'
DELETE FROM [hsdb].[SampleEventWQ] where SampleEventID like 'TBRCRT_20090203%' or SampleEventID like 'TBRCRT_20090205%' or SampleEventID like 'TBRCRT_20090209%'
DELETE FROM [hsdb].[Recruitment] where SampleEventID like 'TBRCRT_20090203%' or SampleEventID like 'TBRCRT_20090205%' or SampleEventID like 'TBRCRT_20090209%'
DELETE FROM [hsdb].[TripInfo] where TripID like 'TBRCRT_20090303%' or TripID like 'TBRCRT_20090305%' or TripID like 'TBRCRT_20090310%'
DELETE FROM [hsdb].[SampleEvent] where TripID like 'TBRCRT_20090303%' or TripID like 'TBRCRT_20090305%' or TripID like 'TBRCRT_20090310%'
DELETE FROM [hsdb].[SampleEventWQ] where SampleEventID like 'TBRCRT_20090303%' or SampleEventID like 'TBRCRT_20090305%' or SampleEventID like 'TBRCRT_20090310%'
DELETE FROM [hsdb].[Recruitment] where SampleEventID like 'TBRCRT_20090303%' or SampleEventID like 'TBRCRT_20090305%' or SampleEventID like 'TBRCRT_20090310%'
DELETE FROM [hsdb].[TripInfo] where TripID like 'TBRCRT_20090407%' or TripID like 'TBRCRT_20090409%' or TripID like 'TBRCRT_20090414%' or TripID like 'TBRCRT_20090415%'
DELETE FROM [hsdb].[SampleEvent] where TripID like 'TBRCRT_20090407%' or TripID like 'TBRCRT_20090409%' or TripID like 'TBRCRT_20090414%' or TripID like 'TBRCRT_20090415%'
DELETE FROM [hsdb].[SampleEventWQ] where SampleEventID like 'TBRCRT_20090407%' or SampleEventID like 'TBRCRT_20090409%' or SampleEventID like 'TBRCRT_20090414%' or SampleEventID like 'TBRCRT_20090415%'
DELETE FROM [hsdb].[Recruitment] where SampleEventID like 'TBRCRT_20090407%' or SampleEventID like 'TBRCRT_20090409%' or SampleEventID like 'TBRCRT_20090414%' or SampleEventID like 'TBRCRT_20090415%'
DELETE FROM [hsdb].[TripInfo] where TripID like 'TBRCRT_20090504%' or TripID like 'TBRCRT_20090511%' or TripID like 'TBRCRT_20090513%' 
DELETE FROM [hsdb].[SampleEvent] where TripID like 'TBRCRT_20090504%' or TripID like 'TBRCRT_20090511%' or TripID like 'TBRCRT_20090513%' 
DELETE FROM [hsdb].[SampleEventWQ] where SampleEventID like 'TBRCRT_20090504%' or SampleEventID like 'TBRCRT_20090511%' or SampleEventID like 'TBRCRT_20090513%' 
DELETE FROM [hsdb].[Recruitment] where SampleEventID like 'TBRCRT_20090504%' or SampleEventID like 'TBRCRT_20090511%' or SampleEventID like 'TBRCRT_20090513%'
DELETE FROM [hsdb].[TripInfo] where TripID like 'TBRCRT_20090605%' or TripID like 'TBRCRT_20090609%' or TripID like 'TBRCRT_20090611%' 
DELETE FROM [hsdb].[SampleEvent] where TripID like 'TBRCRT_20090605%' or TripID like 'TBRCRT_20090609%' or TripID like 'TBRCRT_20090611%' 
DELETE FROM [hsdb].[SampleEventWQ] where SampleEventID like 'TBRCRT_20090605%' or SampleEventID like 'TBRCRT_20090609%' or SampleEventID like 'TBRCRT_20090611%' 
DELETE FROM [hsdb].[Recruitment] where SampleEventID like 'TBRCRT_20090605%' or SampleEventID like 'TBRCRT_20090609%' or SampleEventID like 'TBRCRT_20090611%'
DELETE FROM [hsdb].[TripInfo] where TripID like 'TBRCRT_20090706%' or TripID like 'TBRCRT_20090708%' or TripID like 'TBRCRT_20090713%' 
DELETE FROM [hsdb].[SampleEvent] where TripID like 'TBRCRT_20090706%' or TripID like 'TBRCRT_20090708%' or TripID like 'TBRCRT_20090713%' 
DELETE FROM [hsdb].[SampleEventWQ] where SampleEventID like 'TBRCRT_20090706%' or SampleEventID like 'TBRCRT_20090708%' or SampleEventID like 'TBRCRT_20090713%' 
DELETE FROM [hsdb].[Recruitment] where SampleEventID like 'TBRCRT_20090706%' or SampleEventID like 'TBRCRT_20090708%' or SampleEventID like 'TBRCRT_20090713%'
DELETE FROM [hsdb].[TripInfo] where TripID like 'TBRCRT_20090803%' or TripID like 'TBRCRT_20090810%' or TripID like 'TBRCRT_20090812%' 
DELETE FROM [hsdb].[SampleEvent] where TripID like 'TBRCRT_20090803%' or TripID like 'TBRCRT_20090810%' or TripID like 'TBRCRT_20090812%' 
DELETE FROM [hsdb].[SampleEventWQ] where SampleEventID like 'TBRCRT_20090803%' or SampleEventID like 'TBRCRT_20090810%' or SampleEventID like 'TBRCRT_20090812%' 
DELETE FROM [hsdb].[Recruitment] where SampleEventID like 'TBRCRT_20090803%' or SampleEventID like 'TBRCRT_20090810%' or SampleEventID like 'TBRCRT_20090812%'
DELETE FROM [hsdb].[SampleEvent] where TripID like 'TBRCRT_20090901%' or TripID like 'TBRCRT_20090908%' or TripID like 'TBRCRT_20090910%' 
DELETE FROM [hsdb].[SampleEventWQ] where SampleEventID like 'TBRCRT_20090901%' or SampleEventID like 'TBRCRT_20090908%' or SampleEventID like 'TBRCRT_20090910%' 
DELETE FROM [hsdb].[Recruitment] where SampleEventID like 'TBRCRT_20090901%' or SampleEventID like 'TBRCRT_20090908%' or SampleEventID like 'TBRCRT_20090910%'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'Stringer missing' else ', Stringer missing' end) where SampleEventID like 'TBRCRT_20091020_1_0280%' and ShellReplicate like '3' and NumBottom is NULL
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'T-bar missing' else ', T-bar missing' end) where SampleEventID like 'TBRCRT_20090724_1_0280%'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'T-bar missing' else ', T-bar missing' end) where SampleEventID like 'TBRCRT_20090317_1_0278%' and (ShellReplicate like '2' or ShellReplicate like '1')

--TB RCRT 2010
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'T-bars missing' else ', T-bars missing' end) where SampleEventID like 'TBRCRT_20100315_1_0282%'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'T-bar missing' else ', T-bar missing' end) where SampleEventID like 'TBRCRT_20100512_1_0280%' and ShellReplicate like '3'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'T-bars moved' else ', T-bars moved' end) where SampleEventID like 'TBRCRT_20100609_1_0280%'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'T-bar missing' else ', T-bar missing' end) where SampleEventID like 'TBRCRT_20100713_1_0280%' and ShellReplicate like '3'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'T-bar on ground' else ', T-bar on ground' end) where SampleEventID like 'TBRCRT_20101012_0282%' and ShellReplicate like '3'

--TB RCRT 2011
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'Stringers missing' else ', Stringers missing' end) where SampleEventID like 'TBRCRT_20110118_1_0282%'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'T-bar on ground' else ', T-bar on ground' end) where SampleEventID like 'TBRCRT_20110815_1_0282%' and ShellReplicate like '1'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'T-bar on ground' else ', T-bar on ground' end) where SampleEventID like 'TBRCRT_20111215_1_0282%' and ShellReplicate like '3'

EXECUTE [hsdb].[spChecksRecruitment] @CheckStart = '2008-01-01', @CheckEnd = '2011-12-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';