use [Oysters]
go

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

--TB RCRT 2012-2015
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'Stringers missing' else ', Stringers missing' end) where SampleEventID like 'TBRCRT_20121018_1_0280%' and ShellReplicate not like '1'
UPDATE [hsdb].[Recruitment] set NumTop = NULL, NumBottom = NULL, Comments = 'Shells found on ground off wire' where ShellID like 'TBRCRT_20130408_1_0280_1_31' or ShellID like 'TBRCRT_20130408_1_0280_1_32' or ShellID like 'TBRCRT_20130408_1_0280_1_33' or ShellID like 'TBRCRT_20130408_1_0280_1_34' or ShellID like 'TBRCRT_20130408_1_0280_1_35' or ShellID like 'TBRCRT_20130408_1_0280_1_36'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'T-bar missing' else ', T-bar missing' end) where SampleEventID like 'TBRCRT_20141015_1_0280_1' and ShellReplicate not like '1'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'T-bar missing' else ', T-bar missing' end) where SampleEventID like 'TBRCRT_20150519_1_0280_1' and ShellReplicate like '3'

--TB RCRT 2016 - incorrectly numbers shells (bottom shell is always last number/bottom), Comments for missing stringers.
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'Shells missing' else ', Shells missing' end) where SampleEventID like 'TBRCRT_20160223_1_0277%' and ShellReplicate like '3'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'Shells missing' else ', Shells missing' end) where SampleEventID like 'TBRCRT_20160223_1_0277%' and ShellReplicate like '2' and ShellPosition > 6
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'Shells missing' else ', Shells missing' end) where SampleEventID like 'TBRCRT_20160624_1_0277_1' and ShellReplicate like '3' and ShellPosition > 6
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'Shells missing' else ', Shells missing' end) where SampleEventID like 'TBRCRT_20160914_1_0280_1' and ShellReplicate like '3'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'Shells missing' else ', Shells missing' end) where SampleEventID like 'TBRCRT_20160914_1_0280_1' and ShellReplicate like '2' and ShellPosition like '11'
UPDATE [hsdb].[Recruitment] set NumTop = NULL, NumBottom = NULL where ShellID like 'TBRCRT_20160914_1_0280_1_23' --Shell missing from stringer. Bottom shell still is bottom shell.
UPDATE [hsdb].[Recruitment] set NumTop = 4, NumBottom = 6 where ShellID like 'TBRCRT_20160914_1_0280_1_24'
UPDATE [hsdb].[Recruitment] set NumTop = NULL, NumBottom = NULL where ShellID like 'TBRCRT_20160914_1_0280_1_10' --Shell missing from stringer. Bottom shell still is bottom shell.
UPDATE [hsdb].[Recruitment] set NumTop = 3, NumBottom = 1 where ShellID like 'TBRCRT_20160914_1_0280_1_12'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'Shells missing' else ', Shells missing' end) where ShellID like 'TBRCRT_20160914_1_0280_1_11' or ShellID like 'TBRCRT_20160914_1_0280_1_10'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'Stringer missing' else ', Stringer missing' end) where SampleEventID like 'TBRCRT_20161013_1_0277_1%' and ShellReplicate like '1' and ShellPosition > 6
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'Stringer missing' else ', Stringer missing' end) where SampleEventID like 'TBRCRT_20161013_1_0277_1%' and ShellReplicate like '2' and ShellPosition > 6
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'Stringer missing' else ', Stringer missing' end) where SampleEventID like 'TBRCRT_20161013_1_0277_1%' and ShellReplicate like '3' and ShellPosition > 6
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'Stringer missing' else ', Stringer missing' end) where SampleEventID like 'TBRCRT_20161114_1_0280_1%' and ShellReplicate like '2' and ShellPosition > 6
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'T-bar missing' else ', T-bar missing' end) where SampleEventID like 'TBRCRT_20161114_1_0280_1' and ShellReplicate like '3'

--TB RCRT 2017
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'Stringer missing' else ', Stringer missing' end) where SampleEventID like 'TBRCRT_20170117_1_0280_1' and ShellReplicate like '3' and ShellPosition > 6
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'Stringer missing' else ', Stringer missing' end) where SampleEventID like 'TBRCRT_20171219_1_0280_1' and ShellReplicate like '3'
UPDATE [hsdb].[SampleEventWQ] set [Comments] = CONCAT(Comments, case when Comments is null then 'PctDO not recorded' else ', PctDO not recorded' end) where SampleEventID like 'TBRCRT_2017%'

--TB RCRT 2018
UPDATE [hsdb].[SampleEventWQ] set [Comments] = CONCAT(Comments, case when Comments is null then 'PctDO not recorded' else ', PctDO not recorded' end) where SampleEventID like 'TBRCRT_2018%'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'Stringer missing' else ', Stringer missing' end) where SampleEventID like 'TBRCRT_20180418_1_0277_1' and ShellReplicate like '3'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'Stringer missing' else ', Stringer missing' end) where SampleEventID like 'TBRCRT_20180724_1_0280_1'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'T-bar missing' else ', T-bar missing' end) where SampleEventID like 'TBRCRT_20180920_1_0280_1' and ShellReplicate like '3'

--TB RCRT 2019
UPDATE [hsdb].[SampleEventWQ] set [Comments] = CONCAT(Comments, case when Comments is null then 'PctDO not recorded' else ', PctDO not recorded' end) where SampleEventID like 'TBRCRT_2019%'
UPDATE [hsdb].[Recruitment] set [Comments] = CONCAT(Comments, case when Comments is null then 'Stringer missing' else ', Stringer missing' end) where SampleEventID like 'TBRCRT_20190422_1_0280_1' and ShellReplicate like '2' and ShellPosition > 6

EXECUTE [hsdb].[spChecksRecruitment] @CheckStart = '2008-01-01', @CheckEnd = '2019-12-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';