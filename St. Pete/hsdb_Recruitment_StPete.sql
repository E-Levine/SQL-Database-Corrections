--HSDB Checks:

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

EXECUTE [hsdb].[spChecksRecruitment] @CheckStart = '2008-01-01', @CheckEnd = '2008-12-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';