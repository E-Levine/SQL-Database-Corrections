-- Code for RCRT database checks and fixes


-- connect to db 
use [OystersTSLocal20240605_RCRT2023check]
go
-- metadata
select * from DataDictionary --where TableName like 'Recruit%'


-- Database Errors

-- Orphan Foreign Keys

-- SampleEvent SSRCRT_20230915 -- TripID not included in data check
		select * from TripInfo
		where TripID like 'SSRCRT_20230915%'-- entered TB, not proofed

		select * from SampleEvent
		where TripID like 'SSRCRT_20230915%' -- SS1 through SS6; shows entered TB proofed GH; lat/long and harvest status NULL

		select * from SampleEventWQ
		where SampleEventID like 'SSRCRT_202309%' -- no WQ data for SS1 through SS6

		select * from Recruitment
		where SampleEventID like 'SSRCRT_202309%'
		order by SampleEventID -- no recruit data for SS1 through SS6
	-- to resolve: delete from TripInfo where TripID like 'SSRCRT_20230915%'; delete from SampleEvent where Trip ID like 'SSRCRT_20230915%'; re-enter, proof, and finish trip 
		delete from TripInfo 
		where TripID like 'SSRCRT_20230915%'

		select * from TripInfo
		where TripID like 'SSRCRT_202309%' -- deleted

		delete from SampleEvent
		where TripID like 'SSRCRT_20230915%'

		select * from SampleEvent
		where TripID like 'SSRCRT_202309%' -- deleted
	-- to resolve: re-enter, proof, and finish 9/15/23 trip 

-- Childless PKs (checking for childless PKs in TripInfo then successive tables)
	
-- SSRCRT_20230417_1 Trip Info
	select * from TripInfo
	where TripID like 'SSRCRT_20230417%' -- entered TV proofed TV

	select * from SampleEvent
	where SampleEventID like 'SSRCRT_202304%'
	order by SampleEventID -- no data 4/17/23

	select * from SampleEventWQ
	where SampleEventWQID like 'SSRCRT_202304%'
	order by SampleEventID -- no data 4/17/23

	select * from Recruitment
	where SampleEventID like 'SSRCRT_202304%'
	order by SampleEventID -- no data 4/17/23
	-- no trip on 4/17/23
	-- to resolve: delete from TripInfo where Trip ID like 'SSRCRT_20230417%' 
	delete from TripInfo
	where TripID like 'SSRCRT_20230417%' 

	select * from TripInfo
	where TripID like 'SSRCRT_202304%' -- deleted
	-- resolved TS 6/5/23
	
-- SSRCRT_20230516_1 Trip Info
	select * from TripInfo
	where TripID like 'SSRCRT_202305%' 
	order by TripID -- entered TV proofed TV 

	select * from SampleEvent
	where SampleEventID like 'SSRCRT_202305%'
	order by SampleEventID -- SS1 through SS6; shows entered TB proofed GH; lat/long and harvest status NULL
	-- SS1 thru SS6 deleted with 9/15/23 trip, SS7 thru 12 good

	select * from SampleEventWQ
	where SampleEventWQID like 'SSRCRT_202305%'
	order by SampleEventID -- SS1 through SS6; shows entered TB proofed GH; Post-Idalia in Comments? 
	-- SS1 thru SS6 remain, SS7 thru SS12 good

	select * from Recruitment
	where SampleEventID like 'SSRCRT_20230516%' 
	order by SampleEventID -- SS1 through SS6; shows entered TB proofed GH; some lost stringers with comment 

	select * from Recruitment
	where SampleEventID like 'SSRCRT_202305%'
	order by SampleEventID, ShellReplicate, ShellPosition
		-- not childless, malformed 
		-- to resolve: see above Orphan FK. May need to delete and re-enter, proof, and finish both 9/15/23 and 5/16/23 trips.
		-- now Trip Info childless, SampleEventWQ and Recruitment Orphan FK for Stations 1-6. No more malformed keys.
		-- to resolve: delete 5/16/23 trip in TripInfo, SampleEventWQ, Recruitment and re-enter, proof, and finish trip
		delete from TripInfo
		where TripID like 'SSRCRT_20230516%' -- deleted

		delete from SampleEventWQ
		where SampleEventID like 'SSRCRT_20230516%' -- deleted

		delete from Recruitment
		where SampleEventID like 'SSRCRT_20230516%' -- deleted
		-- to resolve: re-enter, proof, and finish 5/16/23 trip

-- SSRCRT_20231228_1 Trip Info
	select * from TripInfo
	where TripID like 'SSRCRT_202312%'  
	order by TripID -- entered TV proofed TV

	select * from SampleEvent
	where SampleEventID like 'SSRCRT_202312%' 
	order by SampleEventID -- no data 12/28/23

	select * from SampleEventWQ
	where SampleEventWQID like 'SSRCRT_202312%' 
	order by SampleEventID -- no data 12/28/23

	select * from Recruitment
	where SampleEventID like 'SSRCRT_202312%'  
	order by SampleEventID -- no data 12/28/23
	-- no trip on 12/28/23
	-- to resolve: delete from TripInfo where Trip ID like 'SSRCRT_20231228%' 
	delete from TripInfo
	where TripID like 'SSRCRT_20231228%'

	select * from TripInfo
	where TripID like 'SSRCRT_202312%' -- deleted
	-- resolved TS 6/5/23

-- SSRCRT_20231011_1_0333_1 Sample Event (Station 11)
	select * from TripInfo
	where TripID like 'SSRCRT_20231011%' 
	order by TripID -- entered TB proofed TV

	select * from SampleEvent
	where SampleEventID like 'SSRCRT_20231011%' 
	order by SampleEventID -- entered TB proofed GH; lat/long/harvest status NULL

	select * from SampleEventWQ
	where SampleEventWQID like 'SSRCRT_20231011%' 
	order by SampleEventID -- entered TB proofed GH

	select * from Recruitment
	where SampleEventID like 'SSRCRT_20231011%' 
	order by SampleEventID -- Station 11 not marked proofed

	select * from Recruitment
	where SampleEventID like 'SSRCRT_20231011_1_0333%'
	order by ShellReplicate, ShellPosition -- proofed checked TS 
	-- Station 11 recruitment data not proofed
	-- to resolve: Matt's fix:
		--Staff didn't save proof
		update Recruitment
		set DataStatus = 'Proofed', ProofedBy = 'Tomena Scholze', DateProofed = '2024-06-05'
		where ShellID like 'SSRCRT_20231011_1_0333_1%'
	-- resolved TS 6/5/23

-- Database errors resolved 6/5/24 TS
-- Need to re-enter, proof, and finish 9/15/23 and 5/16/23 trips