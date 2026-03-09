-- Code for RCRT database checks and fixes
-- Database Errors fixes applied 6/7/24
-- Data Errors fixes applied


-- connect to db 
use [OystersLocal20240611_RCRTcheck2023final]
go
-- metadata
select * from DataDictionary where SchemaName like 'dbo%' and TableName like 'Recruit%'--'TripInfo' 'SampleEvent''SampleEventWQ'
--query
--select * from [TripInfo] where TripID like 'SSRCRT_2023%'
--select * from [SampleEvent] where TripID like 'SSRCRT_2023%'
--select * from [SampleEventWQ] where SampleEventID like 'SSRCRT_2023%'
--select * from [Recruitment] where SampleEventID like 'SSRCRT_2023%'

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

-- out of range spat data
	select * from Recruitment
	where NumBottom > 200 and SampleEventID like 'SSRCRT_2023%'
	order by SampleEventID
	update [dbo].[Recruitment]
	set [Comments] = 'NumBottom correct'
	where NumBottom > 200 and SampleEventID like 'SSRCRT_2023%'

-- comment fixes
	select * from SampleEventWQ
	where (SampleEventWQID like 'SSRCRT_202307%' and pH IS NULL)
	update [dbo].[SampleEventWQ]
	set [Comments] = replace([Comments],'pH failed CCV; temperature passed CCV failed CCV', 'pH failed CCV; temperature passed CCV')
	where (SampleEventWQID like 'SSRCRT_202307%' and pH IS NULL) 
	update [dbo].[SampleEventWQ]
	set [Comments] = replace([Comments],'pH failed CCV failed CCV', 'pH failed CCV')
	where (SampleEventWQID like 'SSRCRT_202307%' and pH IS NULL) 

-- final comment - pH meter potentially bad 
select * from TripInfo where TripID like 'SSRCRT_2023%'
order by TripID
update [dbo].[TripInfo]
set [Comments] = 'potential issue with pH probe'
where (TripID like 'SSRCRT_20230%' and Comments IS NULL)
update [dbo].[TripInfo]
set [Comments] = replace([Comments],'TripDate and deployed date are correct', 'TripDate and deployed date are correct; potential issue with pH probe')
where TripID like 'SSRCRT_202306%'

-- add latitute, longitude, and harvest status based on FixedLocationID
select * from SampleEvent
where TripID like 'SSRCRT_2023%'
order by FixedLocationID

update [dbo].[SampleEvent]
set [LatitudeDec] = '29.435716'
where FixedLocationID like '0323'
update [dbo].[SampleEvent]
set [LongitudeDec] = '-83.264154'
where FixedLocationID like '0323'
update [dbo].[SampleEvent]
set [HarvestStatus] = NULL
where FixedLocationID like '0323'
update [dbo].[SampleEvent]
set [HarvestStatus] = 'Prohibited'
where FixedLocationID like '0323'

update [dbo].[SampleEvent]
set [LatitudeDec] = '29.429816'
where FixedLocationID like '0324'
update [dbo].[SampleEvent]
set [LongitudeDec] = '-83.235363'
where FixedLocationID like '0324'
update [dbo].[SampleEvent]
set [HarvestStatus] = NULL
where FixedLocationID like '0324'
update [dbo].[SampleEvent]
set [HarvestStatus] = 'Conditionally Approved'
where FixedLocationID like '0324'

update [dbo].[SampleEvent]
set [LatitudeDec] = '29.416341'
where FixedLocationID like '0325'
update [dbo].[SampleEvent]
set [LongitudeDec] = '-83.240883'
where FixedLocationID like '0325'
update [dbo].[SampleEvent]
set [HarvestStatus] = NULL
where FixedLocationID like '0325'
update [dbo].[SampleEvent]
set [HarvestStatus] = 'Conditionally Approved'
where FixedLocationID like '0325'

update [dbo].[SampleEvent]
set [LatitudeDec] = '29.409869'
where FixedLocationID like '0326'
update [dbo].[SampleEvent]
set [LongitudeDec] = '-83.215147'
where FixedLocationID like '0326'
update [dbo].[SampleEvent]
set [HarvestStatus] = NULL
where FixedLocationID like '0326'
update [dbo].[SampleEvent]
set [HarvestStatus] = 'Prohibited'
where FixedLocationID like '0326'

update [dbo].[SampleEvent]
set [LatitudeDec] = '29.363317'
where FixedLocationID like '0327'
update [dbo].[SampleEvent]
set [LongitudeDec] = '-83.182407'
where FixedLocationID like '0327'
update [dbo].[SampleEvent]
set [HarvestStatus] = NULL
where FixedLocationID like '0327'
update [dbo].[SampleEvent]
set [HarvestStatus] = 'Conditionally Restricted'
where FixedLocationID like '0327'

update [dbo].[SampleEvent]
set [LatitudeDec] = '29.296233'
where FixedLocationID like '0328'
update [dbo].[SampleEvent]
set [LongitudeDec] = '-83.184460'
where FixedLocationID like '0328'
update [dbo].[SampleEvent]
set [HarvestStatus] = NULL
where FixedLocationID like '0328'
update [dbo].[SampleEvent]
set [HarvestStatus] = 'Prohibited'
where FixedLocationID like '0328'

update [dbo].[SampleEvent]
set [LatitudeDec] = '29.260636'
where FixedLocationID like '0329'
update [dbo].[SampleEvent]
set [LongitudeDec] = '-83.109336'
where FixedLocationID like '0329'
update [dbo].[SampleEvent]
set [HarvestStatus] = NULL
where FixedLocationID like '0329'
update [dbo].[SampleEvent]
set [HarvestStatus] = 'Prohibited'
where FixedLocationID like '0329'

update [dbo].[SampleEvent]
set [LatitudeDec] = '29.236376'
where FixedLocationID like '0330'
update [dbo].[SampleEvent]
set [LongitudeDec] = '-83.075220'
where FixedLocationID like '0330'
update [dbo].[SampleEvent]
set [HarvestStatus] = NULL
where FixedLocationID like '0330'
update [dbo].[SampleEvent]
set [HarvestStatus] = 'Conditionally Restricted'
where FixedLocationID like '0330'

update [dbo].[SampleEvent]
set [LatitudeDec] = '29.194807'
where FixedLocationID like '0331'
update [dbo].[SampleEvent]
set [LongitudeDec] = '-83.083816'
where FixedLocationID like '0331'
update [dbo].[SampleEvent]
set [HarvestStatus] = NULL
where FixedLocationID like '0331'
update [dbo].[SampleEvent]
set [HarvestStatus] = 'Approved'
where FixedLocationID like '0331'

update [dbo].[SampleEvent]
set [LatitudeDec] = '29.136063'
where FixedLocationID like '0332'
update [dbo].[SampleEvent]
set [LongitudeDec] = '-83.055666'
where FixedLocationID like '0332'
update [dbo].[SampleEvent]
set [HarvestStatus] = NULL
where FixedLocationID like '0332'
update [dbo].[SampleEvent]
set [HarvestStatus] = 'Prohibited'
where FixedLocationID like '0332'

update [dbo].[SampleEvent]
set [LatitudeDec] = '29.154803'
where FixedLocationID like '0333'
update [dbo].[SampleEvent]
set [LongitudeDec] = '-82.995543'
where FixedLocationID like '0333'
update [dbo].[SampleEvent]
set [HarvestStatus] = NULL
where FixedLocationID like '0333'
update [dbo].[SampleEvent]
set [HarvestStatus] = 'Conditionally Approved'
where FixedLocationID like '0333'

update [dbo].[SampleEvent]
set [LatitudeDec] = '29.172815'
where FixedLocationID like '0334'
update [dbo].[SampleEvent]
set [LongitudeDec] = '-82.989328'
where FixedLocationID like '0334'
update [dbo].[SampleEvent]
set [HarvestStatus] = NULL
where FixedLocationID like '0334'
update [dbo].[SampleEvent]
set [HarvestStatus] = 'Prohibited'
where FixedLocationID like '0334'

-- stored procedure to Complete data and move from dbo to hsdb

--check Completed
-- select * from [dbo].[TripInfo] where TripID like 'SSRCRT_2023%'
-- select * from [hsdb].[TripInfo] where TripID like 'SSRCRT_2023%'
