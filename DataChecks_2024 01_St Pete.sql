---Database corrections St Pete 2024/01/04 - E Levine
Use OystersEL_240122
go

---TB SDTP Updates
--Correct PK and add data as needed for 11/2023 and 01/2024
select * into [temp_table]
from [SampleEvent]
where [SampleEventID] like 'TBSDTP_202301%' 
update [temp_table]
set [TripID] = 'TBSDTP_20230118_1'
insert into [SampleEvent]
select *
from [temp_table]

update [dbo].[SampleEvent]
set [SampleEventID] = REPLACE(SampleEventID, '0118', '1117')
where [TripID] like 'TBSDTP_20231117%'

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
set [SampleEventID] = REPLACE(SampleEventID, '0118','1117'),
	[DeployedDate] = '2023-10-17'
where [CupSampleID] like 'TB%2311%' 

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
where [CupSampleID] like 'TB%2302-07-3%' or CupSampleID like 'TB%2303-01-1%' or CupSampleID like 'TB%2303-01-2%' or CupSampleID like 'TB%2305-01-1%' or CupSampleID like 'TB%2305-01-2%' or CupSampleID like 'TB%2309-01-1%' or CupSampleID like 'TB%2309-04-2%' or CupSampleID like 'TB%2309-05-1%' or CupSampleID like 'TB%2312-01-2%'
--End of TBSDTP corrections for 01/2023 - 12/2023.

	
---LW SDTP Updates
update [dbo].[SedimentTrap]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data is correct' else ', Data is correct' end)
where [CupSampleID] like 'LW%2311-02-1%' or CupSampleID like 'LW%2311-02-3%' or CupSampleID like 'LW%2311-03-1%' or CupSampleID like 'LW%2311-03-1%' or CupSampleID like 'LW%2311-03-4%'
--End of LWSDTP corrections for 1/2024.

	
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
update [dbo].[SedimentTrap]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data as recorded on datasheet' else ', Data as recorded on datasheet' end)
where [CupSampleID] like 'CRE2312-01-2%' or CupSampleID like 'CRE2312-02-2%' or CupSampleID like 'CRE2401-02-1%' or CupSampleID like 'CRE2401-02-2%' or CupSampleID like 'CRW2401-03-1%'
--End of CRSDTP corrections 01/2023 - 1/2024.

--TB WAVE Updates
--Correct/comment DWs
update [dbo].[Wave]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data as recorded on datasheet' else ', Data as recorded on datasheet' end)
where [WaveID] like 'TBWAVE_20230321_1_0528_1_3' or WaveID like 'TBWAVE_20230418_1_0528_1_3' or WaveID like 'TBWAVE_20230626_1_0528_1_2'
update [dbo].[SampleEventWQ]
set [DataStatus] = 'Proofed'
where SampleEventID like 'TBWAVE_20231221_1_0278_1' 
update [dbo].[SampleEventWQ]
set [DateProofed] = '2024-01-18 00:00:00'
where SampleEventID like 'TBWAVE_20231221_1_0278_1' 
update [dbo].[SampleEventWQ]
set [ProofedBy] = 'Erica Levine'
where SampleEventID like 'TBWAVE_20231221_1_0278_1' 
--End of TBWAVE corrections 01/2023-12/2023

--CR WAVE Updates
--Correct/comment DWs
update [dbo].[Wave]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data as recorded on datasheet' else ', Data as recorded on datasheet' end)
where [WaveID] like 'CRWAVE_20231010_1_0232_1_2'
update [dbo].[Wave]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data as recorded on datasheet' else ', Data as recorded on datasheet' end)
where [WaveID] like 'CRWAVE_20231219_1_0230_1_2'
update [dbo].[Wave]
set [DryWeight] = 23.52
where [WaveID] like 'CRWAVE_20231219_1_0230_1_2'
update [dbo].[Wave]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data as recorded on datasheet' else ', Data as recorded on datasheet' end)
where [WaveID] like 'CRWAVE_20240110_1_0231_1_1'
--End of CRWAVE corrections 03/2023-12/2023

--December RCRT checks---
--SL,LX,LW,CR - none
--TB RCRT Corrections
--Remove extra lines of data
delete from [dbo].[SampleEventWQ]
where (SampleEventID like 'TBRCRT_202305%' or SampleEventID like 'TBRCRT_202306%' or SampleEventID like 'TBRCRT_202307%' or SampleEventID like 'TBRCRT_202308%') and EnteredBy like 'Mallory%'
delete from [dbo].[SampleEventWQ]
where (SampleEventID like 'TBRCRT_202305%' or SampleEventID like 'TBRCRT_202306%' or SampleEventID like 'TBRCRT_202307%' or SampleEventID like 'TBRCRT_202308%') and Comments = 'NULL'
--Correct missing sample depth data
update [dbo].[SampleEventWQ]
set [SampleDepth] = [Depth]
where (SampleEventID like 'TBRCRT_202305%' or SampleEventID like 'TBRCRT_202306%' or SampleEventID like 'TBRCRT_202307%' or SampleEventID like 'TBRCRT_202308%')
update [dbo].[SampleEventWQ]
set [SampleDepth] = 0.5
where (SampleEventWQID like 'TBRCRT_202305%0529_1_01' or SampleEventWQID like 'TBRCRT_202306%0529_1_01' or SampleEventWQID like 'TBRCRT_202307%0529_1_01' or SampleEventWQID like 'TBRCRT_202308%0529_1_01') 
--Correct mislabeled comment
update [dbo].[Recruitment]
set [Comments] = 'Shell broke off on boat, unsure of order'
where [SampleEventID] like 'TBRCRT_20230227_1_0527%' and ShellReplicate = 2 and ShellPosition < 7
--Comment for accurate data
update [dbo].[SampleEventWQ]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data as recorded on datasheet' else ', Data as recorded on datasheet' end)
where [SampleEventWQID] like 'TBRCRT_20230718_1_0291%' or SampleEventWQID like 'TBRCRT_20230815_1_0291%' or SampleEventWQID like 'TBRCRT_20231017_1_0291%' or SampleEventWQID like 'TBRCRT_20231117_1_0529%' or SampleEventWQID like 'TBRCRT_20230118_1_0278%' or SampleEventWQID like 'TBRCRT_20230118_1_0277%' or SampleEventWQID like 'TBRCRT_20230118_1_0528%'


IF OBJECT_ID('tempdb..#ValidTrips') IS NOT NULL BEGIN DROP TABLE #ValidTrips; END
CREATE TABLE #ValidTrips ( TripID VARCHAR(50) );

INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2023-12-30' AND DataStatus = 'Proofed' AND TripID like 'TBSDTP%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2024-01-31' AND DataStatus = 'Proofed' AND TripID like 'LWSDTP%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2024-01-30' AND DataStatus = 'Proofed' AND TripID like 'CRSDTP%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2023-12-31' AND DataStatus = 'Proofed' AND TripID like 'TBWAVE%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2024-01-31' AND DataStatus = 'Proofed' AND TripID like 'CRWAVE%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-11-01' AND TripDate < '2023-12-31' AND DataStatus = 'Proofed' AND TripID like 'SLRCRT%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-11-01' AND TripDate < '2023-12-31' AND DataStatus = 'Proofed' AND TripID like 'LXRCRT%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-11-01' AND TripDate < '2023-12-31' AND DataStatus = 'Proofed' AND TripID like 'LWRCRT%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-11-01' AND TripDate < '2023-12-31' AND DataStatus = 'Proofed' AND TripID like 'CRRCRT%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2023-12-31' AND DataStatus = 'Proofed' AND TripID like 'TBRCRT%';

UPDATE TripInfo SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '2024-01-31' WHERE TripID IN (SELECT TripID FROM #ValidTrips);
UPDATE SampleEvent SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '2024-01-31' WHERE TripID IN (SELECT TripID FROM #ValidTrips);
UPDATE SampleEventWQ SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '2024-01-31' WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));
UPDATE SedimentTrap SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '2024-01-31' WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));
UPDATE Wave SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '2024-01-31' WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));
UPDATE Recruitment SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '2024-01-31' WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));

INSERT INTO hsdb.TripInfo SELECT * FROM TripInfo WHERE DataStatus = 'Completed';
DELETE FROM dbo.TripInfo WHERE DataStatus = 'Completed';
INSERT INTO hsdb.SampleEvent SELECT * FROM SampleEvent WHERE DataStatus = 'Completed';
DELETE FROM dbo.SampleEvent WHERE DataStatus = 'Completed';
INSERT INTO hsdb.SampleEventWQ SELECT * FROM SampleEventWQ WHERE DataStatus = 'Completed';
DELETE FROM dbo.SampleEventWQ WHERE DataStatus = 'Completed';
INSERT INTO hsdb.SedimentTrap SELECT * FROM SedimentTrap WHERE DataStatus = 'Completed';
DELETE FROM dbo.SedimentTrap WHERE DataStatus = 'Completed';
