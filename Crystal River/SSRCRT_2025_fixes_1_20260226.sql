--SS 2025 RCRT data checks and fixes -- TS 2.25.26 --COMPLETED IN OYSTERS 20260226 ELW
-- connect to db
use [Oysters]
go

-- side quest -- delete SSRCRT20261013% trips entered in error
delete from TripInfo
where TripID like 'SSRCRT_20261013%'

delete from SampleEvent
where TripID like 'SSRCRT_20261013%'

delete from SampleEventWQ
where SampleEventID like 'SSRCRT_20261013%'

delete from Recruitment
where SampleEventID like 'SSRCRT_20261013%'

--childless PKs
--SSRCRT20250519% --in TripInfo table only, WC trip created in error --delete trip
delete from TripInfo
where TripID like 'SSRCRT_20250519%'

--SSRCRT20251013_1 --all entered under trip 2, delete both trips, re-enter proof and complete in ODIN
delete from TripInfo
where TripID like 'SSRCRT_20251013%'

delete from SampleEvent
where TripID like 'SSRCRT_20251013%'

delete from SampleEventWQ
where SampleEventID like 'SSRCRT_20251013%'

delete from Recruitment
where SampleEventID like 'SSRCRT_20251013%'

--SSRCRT20250217_1_0327 SS5 - all data there, just not showing Recruitment proofed
-- also correct deploy date for SS12 - not serviced in January
update Recruitment
set DataStatus ='Proofed'
where SampleEventID like 'SSRCRT_20250217_1_0327%' 

update Recruitment
set DateProofed = '2025-04-28 00:00:00'
where SampleEventID like 'SSRCRT_20250217_1_0327%' 

update Recruitment
set ProofedBy = 'Maya Konieczynski'
where SampleEventID like 'SSRCRT_20250217_1_0327%' 

update Recruitment
set Comments = 'Z SS12 not serviced in January, redeploy only'
where SampleEventID like 'SSRCRT_20250218_1_0334%'

--SSRCRT20250910_1_0334 SS12 - bad gateway error in ODIN, recruit data didn't save or show up in proofing 
-- SS12 recruit data didn't save 
-- "easy" solution - delete SS12 from SampleEvent and WQ, re-enter and proof as 2nd trip
delete from SampleEvent
where SampleEventID like 'SSRCRT_20250910_1_0334%'

delete from SampleEventWQ
where SampleEventID like 'SSRCRT_20250910_1_0334%'

