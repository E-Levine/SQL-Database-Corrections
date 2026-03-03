--SS 2025 RCRT data checks and fixes -- TS 2.27.26 --Checked and COMPLETED in Oysters 20260303
use [Oysters]
go

--comment for trip 2 but no trip 1
update TripInfo
set Comments = 'There was only one trip on this date despite trip number being 2'
where TripID like 'SSRCRT_2025111%'

--add comment for 0125 SS12
update Recruitment
set Comments = 'Z SS12 not serviced in January'
where SampleEventID like 'SSRCRT_20250107_2%'

--correct deploy date for 0225 SS12 re above
update Recruitment
set DeployedDate = '2024-12-10'
where SampleEventID like 'SSRCRT_20250218_1_0334%'

-- null WQ comments
update SampleEventWQ
set Comments = 'DO % not recorded' 
where SampleEventID like 'SSRCRT_2025%'

update SampleEventWQ
set Comments = 'pH turbidity and % DO not recorded'
where SampleEventID like 'SSRCRT_2025%' AND TurbidityYSI IS NULL

update SampleEventWQ
set Comments = 'YSI Pro 2030 pH turbidity and % DO not recorded'
where SampleEventID like 'SSRCRT_20251013_2%'

update SampleEventWQ
set Comments = 'Z no WQ recorded' 
where SampleEventID like 'SSRCRT_20250107_2_0334%'

-- out of range WQ comments
update SampleEventWQ
set Comments = 'YSI passed calibration salinity confirmed by Star Oddi DO % not recorded'
where SampleEventWQID like 'SSRCRT_20250115_1_0329%'

update SampleEventWQ
set Comments = 'YSI passed calibration salinity confirmed by Star Oddi pH turbidity and DO % not recorded'
where SampleEventWQID like 'SSRCRT_20250318_1_0329%'

update SampleEventWQ
set Comments = 'YSI passed calibration DO % not recorded'
where SampleEventWQID like 'SSRCRT_20250616_1_0329%'

-- Erica, please double-check the line below (from the R data check report) I can't test it on my local db 
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-01-01', @CheckEnd = '2025-12-31', @EstuaryCode = 'SS', @DataManager = 'Tomena Scholze';
