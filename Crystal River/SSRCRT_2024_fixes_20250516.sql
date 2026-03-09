-- Code for RCRT database checks and fixes - EWilliams 2025/05/16
-- For 2024 SS Recruitment

-- connect to db
use [Oysters]
go

-- Database Errors fixes applied 2025/05/16

-- TripID SSRCRT_20240408 - should be two trips
	-- to resolve: delete SampleEvent, SampleEventWQ, and Recruitment data for trip 2 stations and re-enter and proof 2nd trip

	delete from SampleEvent
	where (TripID like 'SSRCRT_20240408%' AND FixedLocationID IN ('0329','0330','0331','0332','0333','0334'))

	delete from SampleEventWQ
	where SampleEventID IN ('SSRCRT_20240408_1_0329_1', 'SSRCRT_20240408_1_0330_1', 'SSRCRT_20240408_1_0331_1', 'SSRCRT_20240408_1_0332_1', 'SSRCRT_20240408_1_0333_1', 'SSRCRT_20240408_1_0334_1')

	delete from Recruitment
	where SampleEventID IN ('SSRCRT_20240408_1_0329_1', 'SSRCRT_20240408_1_0330_1', 'SSRCRT_20240408_1_0331_1', 'SSRCRT_20240408_1_0332_1', 'SSRCRT_20240408_1_0333_1', 'SSRCRT_20240408_1_0334_1')

	-- resolved TS 5/15/25


-- Orphan Foreign Key, and should be two trips
	-- to resolve: delete from TripInfo, SampleEvent, SampleEventWQ, and Recruitment 
	-- where TripID like 'SSRCRT_20240506%', 'SSRCRT_20240708%', and SSRCRT_20240812%'; 
	-- re-enter and re-proof trips 

-- SSRCRT_20240506%
	delete from TripInfo
	where TripID like 'SSRCRT_20240506%' 

	delete from SampleEvent
	where TripID like 'SSRCRT_20240506%' 
	
	delete from SampleEventWQ
	where SampleEventID like 'SSRCRT_20240506%' 

	delete from Recruitment
	where SampleEventID like 'SSRCRT_20240506%'

-- SSRCRT_20240708%
	delete from TripInfo
	where TripID like 'SSRCRT_20240708%' 

	delete from SampleEvent
	where TripID like 'SSRCRT_20240708%' 
	
	delete from SampleEventWQ
	where SampleEventID like 'SSRCRT_20240708%' 

	delete from Recruitment
	where SampleEventID like 'SSRCRT_20240708%'

-- SSRCRT_20240812%
	delete from TripInfo
	where TripID like 'SSRCRT_20240812%' 

	delete from SampleEvent
	where TripID like 'SSRCRT_20240812%' 
	
	delete from SampleEventWQ
	where SampleEventID like 'SSRCRT_20240812%' 

	delete from Recruitment
	where SampleEventID like 'SSRCRT_20240812%'

	-- resolved TS 5/15/25

-- Orphan Foreign Key, other -- deploy only, duplicate WQ data, incorrect deploy date
	-- to resolve: delete from TripInfo, SampleEvent, SampleEventWQ, and Recruitment 
	-- where TripID like 'SSRCRT_20241112%' and SSRCRT_20241113%'; 
	-- re-enter and re-proof trips 

-- SSRCRT_202411% 

	delete from TripInfo
	where TripID like 'SSRCRT_202411%' 

	delete from SampleEvent
	where TripID like 'SSRCRT_202411%' 
	
	delete from SampleEventWQ
	where SampleEventID like 'SSRCRT_202411%' 

	delete from Recruitment
	where SampleEventID like 'SSRCRT_202411%'

	-- resolved TS 5/15/25

-- Orphan Foreign Key, other -- incorrect deploy dates
	-- to resolve: delete and re-enter and re-proof trip where TripID SSRCRT_20241210 
	-- re-enter & re-proof trip
	
	delete from TripInfo
	where TripID like 'SSRCRT_20241210%' 

	delete from SampleEvent
	where TripID like 'SSRCRT_20241210%' 
	
	delete from SampleEventWQ
	where SampleEventID like 'SSRCRT_20241210%' 

	delete from Recruitment
	where SampleEventID like 'SSRCRT_20241210%'

	-- resolved TS 5/16/25



-- Orphan Foreign Keys, other -- attempt to solve Orphan Foreign Keys without deleting, re-entering, and re-proofing
	-- SSRCRT_202406%, SSRCRT_202409%

-- SSRCRT_202406% Trip Info
	select * from TripInfo
	where TripID like 'SSRCRT_202406%'
	update [dbo].[TripInfo]
	set [DataStatus] = replace ([DataStatus],'Not Entered','Proofed')
	where TripID like 'SSRCRT_202406%'
	update [dbo].[TripInfo]
	set [DateProofed] = '2025-04-28 00:00:00'
	where TripID like 'SSRCRT_202406%'
	update [dbo].[TripInfo]
	set [ProofedBy] = 'Michelle Batliner'
	where TripID like 'SSRCRT_202406%'
-- SSRCRT_202406% Sample Event WQ
	select * from SampleEventWQ
	where SampleEventID like 'SSRCRT_202406%'
	order by SampleEventID --WQ data table looks OK 
-- SSRCRT_202406% Recruit
	select * from Recruitment
	where SampleEventID like 'SSRCRT_202406%'
	order by SampleEventID --recruit data looks OK

-- SSRCRT_202409% Trip Info
	select * from TripInfo
	where TripID like 'SSRCRT_202409%'
	update[dbo].TripInfo
	set[DataStatus] = replace ([DataStatus],'Not Entered','Proofed')
	where TripID like 'SSRCRT_202409%'
	update [dbo].[TripInfo]
	set [DateProofed] = '2025-04-28 00:00:00'
	where TripID like 'SSRCRT_202409%'
	update [dbo].[TripInfo]
	set [ProofedBy] = 'Michelle Batliner'
	where TripID like 'SSRCRT_202409%'
--SSRCRT_202409% Sample Event WQ
	select * from SampleEventWQ
	where SampleEventID like 'SSRCRT_202409%'
	order by SampleEventID -- WQ data looks OK
--SSRCRT_202409% Recruit
	select * from Recruitment
	where SampleEventID like 'SSRCRT_202409%'
	order by SampleEventID -- recruit data looks OK


-- SSRCRT_202406% and SSRCRT_202409% Sample Event 
	select * from SampleEvent
	where TripID like 'SSRCRT_2024%'
	order by TripID --missing LatitudeDec, LongitudeDec, and HarvestStatus 
-- 0323
	select * from SampleEvent
	where (FixedLocationID = '0323' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	order by TripID	
	update [dbo].[SampleEvent]
	set [LatitudeDec] ='29.435716'
	where (FixedLocationID = '0323' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [LongitudeDec] ='-83.264154'
	where (FixedLocationID = '0323' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [HarvestStatus] ='Prohibited'
	where (FixedLocationID = '0323' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	
-- 0324
	select * from SampleEvent
	where (FixedLocationID = '0324' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	order by TripID	
	update [dbo].[SampleEvent]
	set [LatitudeDec] ='29.429816'
	where (FixedLocationID = '0324' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [LongitudeDec] ='-83.235363'
	where (FixedLocationID = '0324' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [HarvestStatus] ='Conditionally Approved'
	where (FixedLocationID = '0324' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))

-- 0325
	select * from SampleEvent
	where (FixedLocationID = '0325' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	order by TripID	
	update [dbo].[SampleEvent]
	set [LatitudeDec] ='29.416341'
	where (FixedLocationID = '0325' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [LongitudeDec] ='-83.240883'
	where (FixedLocationID = '0325' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [HarvestStatus] ='Conditionally Approved'
	where (FixedLocationID = '0325' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))

-- 0326
	select * from SampleEvent
	where (FixedLocationID = '0326' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	order by TripID	
	update [dbo].[SampleEvent]
	set [LatitudeDec] ='29.409869'
	where (FixedLocationID = '0326' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [LongitudeDec] ='-83.215147'
	where (FixedLocationID = '0326' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [HarvestStatus] ='Prohibited'
	where (FixedLocationID = '0326' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))

-- 0327
	select * from SampleEvent
	where (FixedLocationID = '0327' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	order by TripID	
	update [dbo].[SampleEvent]
	set [LatitudeDec] ='29.363317'
	where (FixedLocationID = '0327' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [LongitudeDec] ='-83.182407'
	where (FixedLocationID = '0327' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [HarvestStatus] ='Conditionally Restricted'
	where (FixedLocationID = '0327' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	
-- 0328
	select * from SampleEvent
	where (FixedLocationID = '0328' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	order by TripID	
	update [dbo].[SampleEvent]
	set [LatitudeDec] ='29.296233'
	where (FixedLocationID = '0328' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [LongitudeDec] ='-83.18446'
	where (FixedLocationID = '0328' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [HarvestStatus] ='Prohibited'
	where (FixedLocationID = '0328' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	
-- 0329
	select * from SampleEvent
	where (FixedLocationID = '0329' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	order by TripID	
	update [dbo].[SampleEvent]
	set [LatitudeDec] ='29.260636'
	where (FixedLocationID = '0329' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [LongitudeDec] ='-83.109336'
	where (FixedLocationID = '0329' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [HarvestStatus] ='Prohibited'
	where (FixedLocationID = '0329' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	
-- 0330
	select * from SampleEvent
	where (FixedLocationID = '0330' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	order by TripID	
	update [dbo].[SampleEvent]
	set [LatitudeDec] ='29.236376'
	where (FixedLocationID = '0330' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [LongitudeDec] ='-83.07522'
	where (FixedLocationID = '0330' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [HarvestStatus] ='Conditionally Restricted'
	where (FixedLocationID = '0330' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	
-- 0331
	select * from SampleEvent
	where (FixedLocationID = '0331' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	order by TripID	
	update [dbo].[SampleEvent]
	set [LatitudeDec] ='29.194807'
	where (FixedLocationID = '0331' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [LongitudeDec] ='-83.083816'
	where (FixedLocationID = '0331' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [HarvestStatus] ='Approved'
	where (FixedLocationID = '0331' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	
-- 0332
	select * from SampleEvent
	where (FixedLocationID = '0332' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	order by TripID	
	update [dbo].[SampleEvent]
	set [LatitudeDec] ='29.136063'
	where (FixedLocationID = '0332' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [LongitudeDec] ='-83.055666'
	where (FixedLocationID = '0332' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [HarvestStatus] ='Prohibited'
	where (FixedLocationID = '0332' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	
-- 0333
	select * from SampleEvent
	where (FixedLocationID = '0333' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	order by TripID	
	update [dbo].[SampleEvent]
	set [LatitudeDec] ='29.154803'
	where (FixedLocationID = '0333' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [LongitudeDec] ='-82.995543'
	where (FixedLocationID = '0333' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [HarvestStatus] ='Conditionally Approved'
	where (FixedLocationID = '0333' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	
-- 0334
	select * from SampleEvent
	where (FixedLocationID = '0334' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	order by TripID	
	update [dbo].[SampleEvent]
	set [LatitudeDec] ='29.172815'
	where (FixedLocationID = '0334' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [LongitudeDec] ='-82.989328'
	where (FixedLocationID = '0334' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))
	update [dbo].[SampleEvent]
	set [HarvestStatus] ='Prohibited'
	where (FixedLocationID = '0334' and TripID in ('SSRCRT_20240604_1', 'SSRCRT_20240605_1', 'SSRCRT_20240910_1'))

	-- resolved TS 5/15/25

	
--SSRCRT_20241210% Station 9 (0331) proofed as another station
	select * from SampleEventWQ
	where SampleEventID like 'SSRCRT_20241210%'
	order by SampleEventID -- WQ data good

	select * from Recruitment
	where SampleEventID like 'SSRCRT_20241210_1_0331%'
	order by ShellReplicate, ShellPosition -- should be all zeros, incorrect NULL on last shell
	
	update [dbo].[Recruitment]
	set [NumBottom] = '0'
	where ShellID = 'SSRCRT_20241210_1_0331_1_36'
	
	update [dbo].[Recruitment]
	set [Comments] = NULL
	where ShellID = 'SSRCRT_20241210_1_0331_1_36'

	-- resolved TS 5/15/25


