select * from SedimentTrap where CupSampleID like 'AB%2306%' or CupSampleID like 'AB%2309%' order by DeployedDate
select * from SampleEventWQ where SampleEventWQID like 'ABSDTP_202306%' or SampleEventWQID like 'ABSDTP_202309%'
select * from SampleEvent where SampleEventID like 'ABSDTP_202306%' or SampleEventID like 'ABSDTP_202309%'
select * from TripInfo where TripID like 'ABSDTP_202306%' or TripID like 'ABSDTP_202309%'

--Correct the Sediment Trap IDs
--Fix FK errors in Sediment Trap
UPDATE [dbo].[SedimentTrap] 
SET [SampleEventID] = REPLACE ([SampleEventID], 'ABSDTP_20230626_1_','ABSDTP_20230915_1_') 
WHERE CupSampleID like 'AB%' and [DeployedDate] = '2023-08-15'

--Correct SampleEventWQ
update SampleEventWQ
set DateEntered = '2023-07-13', EnteredBy = 'Abigail Ladner'
Where SampleEventID like 'ABSDTP_20230626_1%'

--Add missing SampleEventWQ
insert into SampleEventWQ (
	SampleEventWQID, SampleEventID,
	DataStatus, DateEntered, EnteredBy, Comments)
Values (
	'ABSDTP_20230915_1_0007_1_01', 'ABSDTP_20230915_1_0007_1',
	'Entered', '2023-10-02', 'Sarah Paulsen', 'WQ same as recruitment'
	),
	(
	'ABSDTP_20230915_1_0019_1_01', 'ABSDTP_20230915_1_0019_1',
	'Entered', '2023-10-02', 'Sarah Paulsen', 'WQ same as recruitment'
	),
	(
	'ABSDTP_20230915_1_0096_1_01', 'ABSDTP_20230915_1_0096_1',
	'Entered', '2023-10-02', 'Sarah Paulsen', 'WQ same as recruitment'
	),
	(
	'ABSDTP_20230915_1_0098_1_01', 'ABSDTP_20230915_1_0098_1',
	'Entered', '2023-10-02', 'Sarah Paulsen', 'WQ same as recruitment'
	),
	(
	'ABSDTP_20230915_1_0156_1_01', 'ABSDTP_20230915_1_0156_1',
	'Entered', '2023-10-02', 'Sarah Paulsen', 'WQ same as recruitment'
	),
	(
	'ABSDTP_20230915_1_0162_1_01', 'ABSDTP_20230915_1_0162_1',
	'Entered', '2023-10-02', 'Sarah Paulsen', 'WQ same as recruitment'
	)

--Correct SampleEvent
--Fix FK
UPDATE [dbo].[SampleEvent] 
SET [TripID] = REPLACE ([TripID], 'ABSDTP_20230915_1','ABSDTP_20230626_1') 
WHERE [SampleEventID] like 'ABSDTP_20230626_1%'

update SampleEvent
set DateEntered = '2023-07-13', EnteredBy = 'Abigail Ladner'
Where SampleEventID like 'ABSDTP_20230626_1%'

--Add missing SampleEvent
insert into SampleEvent (
	SampleEventID, TripID, FixedLocationID,
	DataStatus, DateEntered, EnteredBy)
Values (
	'ABSDTP_20230915_1_0007_1', 'ABSDTP_20230915_1', '0007',
	'Entered', '2023-10-02', 'Sarah Paulsen'
	),
	(
	'ABSDTP_20230915_1_0019_1', 'ABSDTP_20230915_1', '0019',
	'Entered', '2023-10-02', 'Sarah Paulsen'
	),
	(
	'ABSDTP_20230915_1_0096_1', 'ABSDTP_20230915_1', '0096',
	'Entered', '2023-10-02', 'Sarah Paulsen'
	),
	(
	'ABSDTP_20230915_1_0098_1', 'ABSDTP_20230915_1', '0098',
	'Entered', '2023-10-02', 'Sarah Paulsen'
	),
	(
	'ABSDTP_20230915_1_0156_1', 'ABSDTP_20230915_1', '0156',
	'Entered', '2023-10-02', 'Sarah Paulsen'
	),
	(
	'ABSDTP_20230915_1_0162_1', 'ABSDTP_20230915_1', '0162',
	'Entered', '2023-10-02', 'Sarah Paulsen'
	)