-- connect to db
use [Oysters] --COMPLETED IN DB 02/05/2026
go

-- TripID SSRCRT20241217 - created in error, no trip on that date

-- to resolve, delete trip -- TS 2/4/26
-- no data in SampleEvent, SampleEventWQ, Recruitment 
delete from TripInfo
where TripID like 'SSRCRT_20241217%'


-- Childless PKs -- SSRCRT_20240708_2 and SSRCRT_20240812_1

-- SSRCRT_20240708_2 -- all stations entered under trip 1
-- to resolve: delete data for stations 7-12, re-enter & re-proof. Also delete empty trip 2. -- TS 2/4/26
-- delete empty trip 2
delete from TripInfo
where TripID like 'SSRCRT_20240708_2%' 

-- delete stations 7-12 from trip 1
delete from SampleEvent
where (TripID like 'SSRCRT_20240708_1%' AND FixedLocationID in ('0329', '0330', '0331', '0332', '0333', '0334'))

delete from SampleEventWQ
where SampleEventID like 'SSRCRT_20240708_1_0329%' -- station 7
delete from SampleEventWQ
where SampleEventID like 'SSRCRT_20240708_1_033%' -- station 8-12

delete from Recruitment
where SampleEventID like 'SSRCRT_20240708_1_0329%' -- station 7
delete from Recruitment
where SampleEventID like 'SSRCRT_20240708_1_033%' -- station 8-12

-- SSRCRT_20240812_1 -- all stations entered under trip 2
-- to resolve: delete data for stations 1-6, re-enter and re-proof. And delete empty trip 1. --TS 2/4/26
-- delete empty trip 1
delete from TripInfo
where TripID like 'SSRCRT_20240812_1%'

-- delete stations 1-6 from trip 2
delete from SampleEvent
where (TripID like 'SSRCRT_20240812_2%' AND FixedLocationID in ('0323', '0324', '0325', '0326', '0327', '0328'))

delete from SampleEventWQ
where (SampleEventID like 'SSRCRT_20240812_2%' AND pH is NULL) -- stations 1-6 stone crab YSI was used so no pH

delete from Recruitment
where SampleEventID in ('SSRCRT_20240812_2_0323_1', 'SSRCRT_20240812_2_0324_1', 'SSRCRT_20240812_2_0325_1', 'SSRCRT_20240812_2_0326_1', 'SSRCRT_20240812_2_0327_1', 'SSRCRT_20240812_2_0328_1')

--SampleEventWQ NA's
update SampleEventWQ 
set Comments = 'DO % not recorded'
where SampleEventID like 'SSRCRT_2024%'

update SampleEventWQ 
set Comments = 'Z for all WQ'
where SampleEventID in ('SSRCRT_20240111_1_0333_1', 'SSRCRT_20240111_1_0334_1')

update SampleEventWQ 
set Comments = 'YSI Pro2030 Z for pH and turbidity, DO % not recorded'
where SampleEventID like 'SSRCRT_20240408_1%'

update SampleEventWQ 
set Comments = 'YSI Pro2030 Z for pH and turbidity, DO % not recorded'
where SampleEventID like 'SSRCRT_20240506_2%'

update SampleEventWQ 
set Comments = 'YSI Pro2030 Z for pH and turbidity, DO % not recorded'
where SampleEventID like 'SSRCRT_20240708_1%'

update SampleEventWQ 
set Comments = 'depth not recorded, DO % not recorded'
where SampleEventID like 'SSRCRT_20241112_1_0329%'

update SampleEventWQ 
set Comments = 'YSI not recorded, DO % not recorded'
where SampleEventID like 'SSRCRT_20241112_1_0328%'

update SampleEventWQ 
set Comments = 'depth and YSI not recorded, DO % not recorded'
where SampleEventID like 'SSRCRT_20241210_1_0330%'

-- out of range WQ
update SampleEventWQ
set Comments = 'salinity confirmed by Star Oddi, YSI passed calibration, DO % not recorded'
where SampleEventID like 'SSRCRT_20240812_2_0329%'

--to do after re-entering and proofing
--update SampleEventWQ
--set Comments = 'YSI passed calibration, DO % not recorded'
--where SampleEventID in ('SSRCRT_20240708_1_0329_1', 'SSRCRT_20240812_2_0324_1','SSRCRT_20240812_2_0327_1')

-- out of range deploy days
update TripInfo
set Comments = 'No October spat run due to Helene, November redeploy only.'
where TripID like 'SSRCRT_202411%'

update TripInfo
set Comments = 'Deployed traps not retrieved in October due to Helene, November redeploy only.'
where TripID like 'SSRCRT_202409%'

