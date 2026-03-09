-- Code for RCRT database checks and fixes
-- Database Errors fixes applied 6/7/24


-- connect to db 
use [OystersLocal20240610_RCRT2023check3]
go
-- metadata
select * from DataDictionary where TableName like 'Recruit%'


-- Database Errors - fixes applied 6/7/24

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
	-- resolved 6/7/24 TB GH

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
		-- resolved 6/7/24 TB, GH

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
-- Resolved 6/7/24 BH, TS, GH, TB



-- Data Errors

-- WQ - unexpected NULL values

-- pH failed CCV - comment needed
	select * from SampleEventWQ
	where (SampleEventWQID like 'SSRCRT_20230626%' AND pH IS NULL)
	order by SampleEventWQID
	update [dbo].[SampleEventWQ]
	set [Comments] = replace ([Comments], 'pH bad', 'pH failed CCV')
	where (SampleEventWQID like 'SSRCRT_20230626%' AND pH IS NULL)
	update [dbo].[SampleEventWQ]
	set [YSINotes] = 'pH failed CCV'
	where (SampleEventWQID like 'SSRCRT_20230626%' AND pH IS NULL)
	-- Comments standardized and YSINotes added TS 6/10/24
	select * from SampleEventWQ
	where (SampleEventWQID like 'SSRCRT_2023072%' AND pH IS NULL)
	order by SampleEventWQID
	update [dbo].[SampleEventWQ]
	set [Comments] = replace ([Comments], 'pH bad', 'pH failed CCV')
	where (SampleEventWQID like 'SSRCRT_2023072%' and pH IS NULL)
	update [dbo].[SampleEventWQ]
	set [Comments] = replace ([Comments], 'pH', 'pH failed CCV')
	where (SampleEventWQID like 'SSRCRT_2023072%' and pH IS NULL)
	update [dbo].[SampleEventWQ]
	set [YSINotes] = 'pH failed CCV'
	where (SampleEventWQID like 'SSRCRT_2023072%' AND pH IS NULL)
	-- Comments standardized and YSINotes added TS 6/10/24
	select * from SampleEventWQ
	where (SampleEventWQID like 'SSRCRT_2023082%' AND pH IS NULL)
	order by SampleEventWQID
	update [dbo].[SampleEventWQ]
	set [Comments] = replace ([Comments], 'pH probe bad', 'pH failed CCV')
	where (SampleEventWQID like 'SSRCRT_2023082%' and pH IS NULL)
	update [dbo].[SampleEventWQ]
	set [YSINotes] = 'pH failed CCV'
	where (SampleEventWQID like 'SSRCRT_2023082%' and pH IS NULL)
	-- Comments standardized and YSINotes added TS 6/10/24
	select * from SampleEventWQ
	where (SampleEventWQID like 'SSRCRT_20230914%' and Depth IS NULL)
	update [dbo].[SampleEventWQ]
	set [Comments] = replace ([Comments], 'No WQ Data', 'WQ not recorded')
	where (SampleEventWQID like 'SSRCRT_20230914%' and Depth IS NULL)
	-- Comments standardized TS 6/10/24
	select * from SampleEventWQ
	where (SampleEventWQID like 'SSRCRT_20231108%' and Depth IS NULL)
	update[dbo].[SampleEventWQ]
	set [Comments] = replace ([Comments], 'No Depth', 'Depth not recorded')
	where (SampleEventWQID like 'SSRCRT_20231108%' and Depth IS NULL)
	-- Comments standardized TS 6/10/24
	select * from SampleEventWQ
	where (SampleEventWQID like 'SSRCRT_20231207%' and Salinity IS NULL)
	update [dbo].[SampleEventWQ]
	set [Comments] = replace ([Comments], 'No Salinity Taken', 'Salinity not recorded')
	where (SampleEventWQID like 'SSRCRT_20231207%' and Salinity IS NULL)
	-- Comments standardized TS 6/10/24

-- Recruitment - unexpected NULL values
	-- if shells are missing, NULL values should be ShellPosition 2-5 or 8-11; NumBottom for ShellPosition 1,6,7,12 should not be null
	-- check month by month
	select * from Recruitment
	where (ShellPosition like '1' or ShellPosition like '6' or ShellPosition like '7' or Shellposition like '12') and SampleEventID like 'SSRCRT_202312%' and NumBottom IS NULL
	order by SampleEventID, ShellReplicate, ShellPosition

	select * from Recruitment
	where (SampleEventID like 'SSRCRT_202301%' and NumBottom IS NULL)
	order by SampleEventID, ShellReplicate, ShellPosition

	-- fixes
	select * from Recruitment
	where (SampleEventID like 'SSRCRT_20230419_1_0325%' and ShellReplicate like '3')
	order by ShellReplicate, ShellPosition
	update [dbo].[Recruitment]
	set [AdminNotes] = 'missing shell out of order'
	where ShellID like 'SSRCRT_20230419_1_0325_1_35' or ShellID like 'SSRCRT_20230419_1_0325_1_36'
	update [dbo].[Recruitment]
	set [Comments] = 'Z'
	where ShellID like 'SSRCRT_20230419_1_0325_1_35'
	update [dbo].[Recruitment]
	set [NumBottom] = replace ([NumBottom], '0', NULL)
	where ShellID like 'SSRCRT_20230419_1_0325_1_35'
	update [dbo].[Recruitment]
	set [NumBottom] = '0'
	where ShellID like 'SSRCRT_20230419_1_0325_1_36'
	
	select * from Recruitment
	where (SampleEventID like 'SSRCRT_20230821_1_0325%' and ShellReplicate like '2')
	order by ShellReplicate, ShellPosition
	update [dbo].[Recruitment]
	set [AdminNotes] = 'missing shell out of order'
	where ShellID like 'SSRCRT_20230821_1_0325_1_16' or ShellID like 'SSRCRT_20230821_1_0325_1_17' or ShellID like 'SSRCRT_20230821_1_0325_1_18'
	update [dbo].[Recruitment]
	set [Comments] = 'Z'
	where ShellID like 'SSRCRT_20230821_1_0325_1_16'
	update [dbo].[Recruitment]
	set [Comments] = replace([Comments], 'Missing','Z')
	where ShellID like 'SSRCRT_20230821_1_0325_1_17' or ShellID like 'SSRCRT_20230821_1_0325_1_18'
	update [dbo].[Recruitment]
	set [NumBottom] = '5'
	where ShellID like 'SSRCRT_20230821_1_0325_1_18'
	update [dbo].[Recruitment]
	set [NumBottom] = replace ([NumBottom],'5',NULL)
	where ShellID like 'SSRCRT_20230821_1_0325_1_16'

	select * from Recruitment
	where (SampleEventID like 'SSRCRT_20230915_1_0327%' and ShellReplicate like '1')
	order by ShellReplicate, ShellPosition
	update [dbo].[Recruitment]
	set [AdminNotes] = 'missing shell out of order'
	where ShellID like 'SSRCRT_20230915_1_0327_1_11' or ShellID like 'SSRCRT_20230915_1_0327_1_12'
	update [dbo].[Recruitment]
	set [Comments] = 'Z'
	where ShellID like 'SSRCRT_20230915_1_0327_1_11'
	update [dbo].[Recruitment]
	set [NumBottom] = '55'
	where ShellID like 'SSRCRT_20230915_1_0327_1_12'
	update [dbo].[Recruitment]
	set [NumBottom] = replace ([NumBottom],'55',NULL)
	where ShellID like 'SSRCRT_20230915_1_0327_1_11'

	select * from Recruitment
	where (SampleEventID like 'SSRCRT_20231208_1_0327%' and ShellReplicate like '2')
	order by ShellReplicate, ShellPosition
	update [dbo].[Recruitment]
	set [AdminNotes] = 'missing shell out of order'
	where ShellID like 'SSRCRT_20231208_1_0327_1_17' or ShellID like 'SSRCRT_20231208_1_0327_1_18'
	update [dbo].[Recruitment]
	set [Comments] = 'Z'
	where ShellID like 'SSRCRT_20231208_1_0327_1_17'
	update [dbo].[Recruitment]
	set [NumBottom] = '0'
	where ShellID like 'SSRCRT_20231208_1_0327_1_18'
	update [dbo].[Recruitment]
	set [NumBottom] = replace ([NumBottom],'0',NULL)
	where ShellID like 'SSRCRT_20231208_1_0327_1_17'

-- Recruitment - unexpected NULL values
	select * from Recruitment
	where (SampleEventID like 'SSRCRT_20230821_1_0325%' and NumBottom IS NULL and Comments IS NULL)
	order by ShellReplicate, ShellPosition
	update [dbo].[Recruitment]
	set [Comments] = 'Z'
	where (SampleEventID like 'SSRCRT_20230821_1_0325%' and NumBottom IS NULL and Comments IS NULL)

-- Out of range values -- WQ
	select * from SampleEventWQ
	where (SampleEventWQID like 'SSRCRT_2023072%' AND Temperature > 33)
	order by SampleEventWQID
	update [dbo].[SampleEventWQ]
	set [Comments] = REPLACE([Comments],'pH failed CCV','pH failed CCV; temperature passed CCV')
	where (SampleEventWQID like 'SSRCRT_2023072%' AND Temperature > 33)

	select * from SampleEventWQ
	where (SampleEventWQID like 'SSRCRT_2023082%' AND Temperature > 33)
	order by SampleEventWQID
	update [dbo].[SampleEventWQ]
	set [Comments] = REPLACE([Comments],'pH failed CCV','pH failed CCV; temperature passed CCV; DO passed CCV')
	where (SampleEventWQID like 'SSRCRT_2023082%' AND Temperature > 33)

	select * from SampleEventWQ
	where (SampleEventWQID like 'SSRCRT_2023062%' and DissolvedOxygen > 10)
	update [dbo].[SampleEventWQ]
	set [Comments] = REPLACE([Comments],'pH failed CCV', 'pH failed CCV; DO passed CCV')
	where (SampleEventWQID like 'SSRCRT_2023062%' and DissolvedOxygen > 10)

	-- out of range pH
	select * from SampleEventWQ
	where (SampleEventWQID like 'SSRCRT_202303%' and pH < 7)
	update [dbo].[SampleEventWQ]
	set [Comments] = 'pH failed CCV; pH mV failed ICV'
	where (SampleEventWQID like 'SSRCRT_202303%' and pH < 7)
	update [dbo].[SampleEventWQ]
	set [YSINotes] = 'pH failed CCV; pH mV failed ICV'
	where (SampleEventWQID like 'SSRCRT_202303%' and pH < 7)
	update [dbo].[SampleEventWQ]
	set [AdminNotes] = 'removed out of range pH values'
	where (SampleEventWQID like 'SSRCRT_202303%' and pH < 7)
	update [dbo].[SampleEventWQ]
	set [pH] = REPLACE([pH],'6.__',NULL)
	where (SampleEventWQID like 'SSRCRT_202303%' and pH < 7)

	select * from SampleEventWQ
	where (SampleEventWQID like 'SSRCRT_202304%' and pH IS NULL)
	update [dbo].[SampleEventWQ]
	set [Comments] = 'pH mV failed ICV' 
	where (SampleEventWQID like 'SSRCRT_202304%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [YSINotes] = 'pH mV failed ICV'
	where (SampleEventWQID like 'SSRCRT_202304%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [AdminNotes] = 'removed out of range pH values'
	where (SampleEventWQID like 'SSRCRT_202304%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [pH] = REPLACE([pH],'_.__',NULL)
	where (SampleEventWQID like 'SSRCRT_202304%' and pH > 8.5)

	select * from SampleEventWQ
	where (SampleEventWQID like 'SSRCRT_202305%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [Comments] = REPLACE([Comments],'2%', NULL)
	where SampleEventWQID like 'SSRCRT_20230516_1_0328_1_01%'
	update [dbo].[SampleEventWQ]
	set [Comments] = 'pH mV failed ICV'
	where (SampleEventWQID like 'SSRCRT_202305%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [YSINotes] = 'pH mV failed ICV'
	where (SampleEventWQID like 'SSRCRT_202305%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [AdminNotes] = 'removed out of range pH values'
	where (SampleEventWQID like 'SSRCRT_202305%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [pH] = REPLACE([pH], '_.__', NULL)	
	where (SampleEventWQID like 'SSRCRT_202305%' and pH > 8.5)

	select * from SampleEventWQ
	where (SampleEventWQID like 'SSRCRT_202306%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [Comments] = REPLACE([Comments],'p%', NULL)
	where (pH > 8.5 and SampleEventWQID like 'SSRCRT_2023062__1_033%')
	update [dbo].[SampleEventWQ]
	set [Comments] = 'pH failed CCV; pH mV failed ICV'
	where (SampleEventWQID like 'SSRCRT_202306%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [YSINotes] = 'pH failed CCV; pH mV failed ICV'
	where (SampleEventWQID like 'SSRCRT_202306%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [AdminNotes] = 'removed out of range pH values'
	where (SampleEventWQID like 'SSRCRT_202306%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [pH] = REPLACE([pH], '_.__', NULL)	
	where (SampleEventWQID like 'SSRCRT_202306%' and pH > 8.5)

	select * from SampleEventWQ
	where (SampleEventWQID like 'SSRCRT_202307%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [Comments] = REPLACE([Comments],'p%', NULL)
	where (pH > 8.5 and SampleEventWQID like 'SSRCRT_202307%')
	update [dbo].[SampleEventWQ]
	set [Comments] = 'pH failed CCV; pH mV failed ICV'
	where (SampleEventWQID like 'SSRCRT_202307%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [YSINotes] = 'pH failed CCV; pH mV failed ICV'
	where (SampleEventWQID like 'SSRCRT_202307%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [AdminNotes] = 'removed out of range pH values'
	where (SampleEventWQID like 'SSRCRT_202307%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [pH] = REPLACE([pH], '_.__', NULL)	
	where (SampleEventWQID like 'SSRCRT_202307%' and pH > 8.5)

	select * from SampleEventWQ
	where (SampleEventWQID like 'SSRCRT_202308%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [Comments] = REPLACE([Comments],'p%', NULL)
	where (pH > 8.5 and SampleEventWQID like 'SSRCRT_202308%')
	update [dbo].[SampleEventWQ]
	set [Comments] = 'pH failed CCV; pH mV failed ICV'
	where (SampleEventWQID like 'SSRCRT_202308%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [YSINotes] = 'pH failed CCV; pH mV failed ICV'
	where (SampleEventWQID like 'SSRCRT_202308%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [AdminNotes] = 'removed out of range pH values'
	where (SampleEventWQID like 'SSRCRT_202308%' and pH > 8.5)
	update [dbo].[SampleEventWQ]
	set [pH] = REPLACE([pH], '_.__', NULL)	
	where (SampleEventWQID like 'SSRCRT_202308%' and pH > 8.5)

	-- out of range turbidity
	select * from SampleEventWQ
	where (SampleEventWQID like 'SSRCRT_20230%' and TurbidityYSI > 30)
	order by SampleEventWQID
	update [dbo].[SampleEventWQ]
	set [Comments] = REPLACE([Comments],'pH failed CCV; pH mV failed ICV','pH failed CCV; pH mV failed ICV; turbidity passed ICV, CCV')
	where (SampleEventWQID like 'SSRCRT_20230315%' and TurbidityYSI > 30)
	update [dbo].[SampleEventWQ]
	set [YSINotes] = REPLACE([YSINotes],'pH failed CCV; pH mV failed ICV','pH failed CCV; pH mV failed ICV; turbidity passed ICV, CCV')
	where (SampleEventWQID like 'SSRCRT_20230315%' and TurbidityYSI > 30)
	update [dbo].[SampleEventWQ]
	set [Comments] = 'turbidity passed ICV, CCV'
	where (SampleEventWQID like 'SSRCRT_20230316%' and TurbidityYSI > 30)
	update [dbo].[SampleEventWQ]
	set [YSINotes] = 'turbidity passed ICV, CCV'
	where (SampleEventWQID like 'SSRCRT_20230316%' and TurbidityYSI > 30)
	update [dbo].[SampleEventWQ]
	set [Comments] = REPLACE([Comments],'pH failed CCV; pH mV failed ICV','pH failed CCV; pH mV failed ICV; turbidity passed ICV, CCV')
	where (SampleEventWQID like 'SSRCRT_202307%' and TurbidityYSI > 30)
	update [dbo].[SampleEventWQ]
	set [YSINotes] = REPLACE([YSINotes],'pH failed CCV; pH mV failed ICV','pH failed CCV; pH mV failed ICV; turbidity passed ICV, CCV')
	where (SampleEventWQID like 'SSRCRT_202307%' and TurbidityYSI > 30)
	update [dbo].[SampleEventWQ]
	set [Comments] = REPLACE([Comments],'pH failed CCV; pH mV failed ICV','pH failed CCV; pH mV failed ICV; turbidity passed ICV, CCV')
	where (SampleEventWQID like 'SSRCRT_20230821_1_0323%' and TurbidityYSI > 30)
	update [dbo].[SampleEventWQ]
	set [YSINotes] = REPLACE([YSINotes],'pH failed CCV; pH mV failed ICV','pH failed CCV; pH mV failed ICV; turbidity passed ICV, CCV')
	where (SampleEventWQID like 'SSRCRT_20230821_1_0323%' and TurbidityYSI > 30)
	update [dbo].[SampleEventWQ]
	set [Comments] = REPLACE([Comments],'pH failed CCV','pH failed CCV; turbidity passed ICV, CCV')
	where (SampleEventWQID like 'SSRCRT_20230821_1_0324%' and TurbidityYSI > 30)
	update [dbo].[SampleEventWQ]
	set [YSINotes] = REPLACE([YSINotes],'pH failed CCV','pH failed CCV; turbidity passed ICV, CCV')
	where (SampleEventWQID like 'SSRCRT_20230821_1_0324%' and TurbidityYSI > 30)
	update [dbo].[SampleEventWQ]
	set [Comments] = REPLACE([Comments],'pH failed CCV; temperature passed CCV; DO passed CCV','pH failed CCV; temperature passed CCV; DO passed CCV; turbidity passed ICV, CCV')
	where (SampleEventWQID like 'SSRCRT_20230822%' and TurbidityYSI > 30)
	update [dbo].[SampleEventWQ]
	set [YSINotes] = REPLACE([YSINotes],'pH failed CCV','pH failed CCV; temperature passed CCV; DO passed CCV; turbidity passed ICV, CCV')
	where (SampleEventWQID like 'SSRCRT_20230822%' and TurbidityYSI > 30)
	update [dbo].[SampleEventWQ]
	set [Comments] = 'turbidity passed ICV, CCV'
	where (SampleEventWQID like 'SSRCRT_20230914%' and TurbidityYSI > 30)
	update [dbo].[SampleEventWQ]
	set [YSINotes] = 'turbidity passed ICV, CCV'
	where (SampleEventWQID like 'SSRCRT_20230914%' and TurbidityYSI > 30)

	select * from SampleEventWQ
	where (SampleEventWQID like 'SSRCRT_202312%' and TurbidityYSI < -2)
	order by SampleEventWQID
	update [dbo].[SampleEventWQ]
	set [Comments] = 'turbidity failed CCV'
	where (SampleEventWQID like 'SSRCRT_202312%' and TurbidityYSI < -2)
	update [dbo].[SampleEventWQ]
	set [YSINotes] = 'turbidity failed CCV'
	where (SampleEventWQID like 'SSRCRT_202312%' and TurbidityYSI < -2)
	update [dbo].[SampleEventWQ]
	set [AdminNotes] = 'removed out of range turbidity values'
	where (SampleEventWQID like 'SSRCRT_202312%' and TurbidityYSI < -2)
	update [dbo].[SampleEventWQ]
	set [TurbidityYSI] = REPLACE([TurbidityYSI],'-2.__',NULL)
	where (SampleEventWQID like 'SSRCRT_202312%' and TurbidityYSI < -2)

	select * from TripInfo
	where TripID like 'SSRCRT_202306%'
	update[dbo].[TripInfo]
	set [Comments] = 'TripDate and deployed date are correct'
	where TripID like 'SSRCRT_202306%'