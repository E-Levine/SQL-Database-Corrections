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
set [Comments] = CONCAT(Comments, ' 2 filters used')
where [CupSampleID] like 'TBR2305-07-1%'

update [dbo].[SedimentTrap]
set [Comments] = CONCAT(Comments, ' Data is correct')
where [CupSampleID] like 'TB%2302-07-3%' or CupSampleID like 'TB%2303-01-1%' or CupSampleID like 'TB%2303-01-2%' or CupSampleID like 'TB%2305-01-1%' or CupSampleID like 'TB%2305-01-2%' or CupSampleID like 'TB%2309-01-1%' or CupSampleID like 'TB%2309-04-2%' or CupSampleID like 'TB%2309-05-1%'
--End of TBSDTP corrections for 01/2023 - 11/2023.

	
---LW SDTP Updates
update [dbo].[SedimentTrap]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data is correct' else ', Data is correct' end)
where [CupSampleID] like 'LW%2311-02-1%' or CupSampleID like 'LW%2311-02-3%' or CupSampleID like 'LW%2311-03-1%' or CupSampleID like 'LW%2311-03-1%' or CupSampleID like 'LW%2311-03-4%'
--End of LWSDTP corrections for 11/2023.

	
---CR SDTP Updates
--Delete incorrect trip date
DELETE FROM [dbo].[TripInfo]
WHERE [TripID] like 'CRSDTP_20230712%' 
--Add required comments for data
update [dbo].[SedimentTrap]
set [Comments] = CONCAT(Comments, case when Comments is null then '2 filters used' else ', 2 filters used' end)
where [CupSampleID] like 'CRE2303-01-1%' or CupSampleID like 'CRE2306-01-2%' or CupSampleID like 'CRW2308-03-2%' or CupSampleID like 'CRW2308-04-1%' 
update [dbo].[SedimentTrap]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data is correct' else ', Data is correct' end)
where [CupSampleID] like 'CRE2303-01-1%' or CupSampleID like 'CRW2309-03-2%' or CupSampleID like 'CRW2303-04-1%' or CupSampleID like 'CRW2303-04-2%' or CupSampleID like 'CRW2304-04-1%' or CupSampleID like 'CRW2305-04-1%' or CupSampleID like 'CRW2306-04-3%' 
--End of CRSDTP corrections 01/2023 - 11/2023.


IF OBJECT_ID('tempdb..#ValidTrips') IS NOT NULL BEGIN DROP TABLE #ValidTrips; END
CREATE TABLE #ValidTrips ( TripID VARCHAR(50) );

INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2023-11-30' AND DataStatus = 'Proofed' AND TripID like 'TBSDTP%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2023-11-30' AND DataStatus = 'Proofed' AND TripID like 'LWSDTP%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2023-11-30' AND DataStatus = 'Proofed' AND TripID like 'CRSDTP%';

UPDATE TripInfo SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '2024-01-05' WHERE TripID IN (SELECT TripID FROM #ValidTrips);
UPDATE SampleEvent SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '2024-01-05' WHERE TripID IN (SELECT TripID FROM #ValidTrips);
UPDATE SampleEventWQ SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '2024-01-05' WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));
UPDATE SedimentTrap SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '2024-01-05' WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));
INSERT INTO hsdb.TripInfo SELECT * FROM TripInfo WHERE DataStatus = 'Completed';
DELETE FROM dbo.TripInfo WHERE DataStatus = 'Completed';
INSERT INTO hsdb.SampleEvent SELECT * FROM SampleEvent WHERE DataStatus = 'Completed';
DELETE FROM dbo.SampleEvent WHERE DataStatus = 'Completed';
INSERT INTO hsdb.SampleEventWQ SELECT * FROM SampleEventWQ WHERE DataStatus = 'Completed';
DELETE FROM dbo.SampleEventWQ WHERE DataStatus = 'Completed';
INSERT INTO hsdb.SedimentTrap SELECT * FROM SedimentTrap WHERE DataStatus = 'Completed';
DELETE FROM dbo.SedimentTrap WHERE DataStatus = 'Completed';
