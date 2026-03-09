-- connect to db --COMPLETED 02/09/2026
use [Oysters]
go

-- entered in error, no trip on that date SSRCRT_20240515%
-- to resolve delete from Trip Info, SampleEvent, SampleEventWQ, Recruitment
delete from TripInfo
where TripID like 'SSRCRT_20240515%'

delete from SampleEvent
where TripID like 'SSRCRT_20240515%'

delete from SampleEventWQ
where SampleEventID like 'SSRCRT_20240515%'

delete from Recruitment
where SampleEventID like 'SSRCRT_20240515%'

-- SampleEventWQ NA's
update SampleEventWQ
set Comments = 'DO % not recorded'
where SampleEventID like 'SSRCRT_20240708_2%'

-- out of range WQ
update SampleEventWQ
set Comments = 'YSI passed calibration, DO % not recorded'
where SampleEventID like 'SSRCRT_20240708_2_0329%'

update SampleEventWQ
set Comments = 'YSI pro2030 Z for ph and turbidity, YSI passed calibration, DO % not recorded'
where SampleEventID in ('SSRCRT_20240812_1_0324_1','SSRCRT_20240812_1_0327_1')


EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-01-01', @CheckEnd = '2024-12-31', @EstuaryCode = 'SS', @DataManager = 'Tomena Scholze'


--Anna Laws data request
--select * from SampleEventWQ
--where SampleEventID like 'SSRCRT_2024%'
--order by SampleEventID

--select * from Recruitment
--where SampleEventID like 'SSRCRT_2024%'
--order by SampleEventID

