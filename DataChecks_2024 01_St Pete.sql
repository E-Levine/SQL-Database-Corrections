---Database corrections St Pete 2024/01/04 - E Levine
Use OystersEL_240104
go

---TB SDTP Updates
--Correct PK and add data as needed for 11/2023 and 01/2023
update [dbo].[SampleEvent] 
set [SampleEventID] = CONCAT(TripID,'_',(right(replicate('0',4) + cast(FixedLocationID as varchar(4)),4)),'_1')
where [TripID] like 'TBSDTP_20231117%'

select * into [temp_table]
from [SampleEvent]
where [SampleEventID] like 'TBSDTP_202311%' 
update [temp_table]
set [TripID] = 'TBSDTP_20230118_1',
    [SampleEventID] = CONCAT(TripID,'_',(right(replicate('0',4) + cast(FixedLocationID as varchar(4)),4)),'_1')
insert into [SampleEvent]
select *
from [temp_table]

select * into [temp_tableb]
from [SampleEventWQ]
where [SampleEventID] like 'TBSDTP_202301%'
update [temp_tableb]
set [SampleEventWQID] = REPLACE(SampleEventWQID, '0118','1117'),
	[SampleEventID] = REPLACE(SampleEventID, '0118', '1117')
insert into [SampleEventWQ]
select *
from [temp_tableb]

--Update incorrect dates and SampleEventIDs for mixed 01/2023 and 11/2023 samples
update [dbo].[SedimentTrap]
set [DeployedDate] = '2022-12-19' 
where [CupSampleID] like 'TB%2301-01%' or CupSampleID like 'TB%2301-07%'
update [dbo].[SedimentTrap]
set [SampleEventID] = REPLACE(SampleEventID, '0118','1117') 
where CupSampleID like 'TB%2311-01%' or CupSampleID like 'TB%2311-07%'
update [dbo].[SedimentTrap]
set [SampleEventID] = REPLACE(SampleEventID, '0118','1117'),
	[DeployedDate] = '2023-10-17'
where CupSampleID like 'TB%2311-04%' or CupSampleID like 'TB%2311-05%' or CupSampleID like 'TB%2311-06%' or CupSampleID like 'TB%2311-08%'

--Update incorrect deployed dates
update [dbo].[SedimentTrap]
set [DeployedDate] = '2023-06-26'
where [SampleEventID] like 'TBSDTP_202307%' and DeployedDate like '2023-05%'

--Update comments to indicate correct data. 
update [dbo].[SedimentTrap]
set [Comments] = CONCAT(Comments, '2 filters used')
where CupSampleID like 'TBR2305-07-1%'
