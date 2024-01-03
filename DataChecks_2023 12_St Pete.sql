---Database corrections St Pete 2023/12/27 - E Levine
Use OystersEL_231227
go

---CR RCRT updates
  --Remove incorrect TripIDs
DELETE FROM [dbo].[TripInfo]
WHERE [TripID] like 'CRRCRT_20230913%' or [TripID] like 'CRRCRT_20230621%'

--Update 2023/02/14 Trip IDs in SampleEvent
UPDATE [dbo].[SampleEvent] 
SET [TripID] = REPLACE ([TripID], 'CRRCRT_20230413_1','CRRCRT_20230214_1') 
WHERE [SampleEventID] like 'CRRCRT_20230214_1_%'

--Update 2023/05/09 0230 SampleEventWQ to proofed
UPDATE [dbo].[SampleEventWQ] 
SET [DataStatus] = 'Proofed', [DateProofed] = '2023-12-01 00:00:00', [ProofedBy] = 'Erica Levine'
WHERE [SampleEventID] like 'CRRCRT_20230509_1_0230%'

  --Update 20230613 WQ comment
UPDATE [dbo].[SampleEventWQ] 
SET [Comments] = 'Same as dermo WQ'
WHERE [SampleEventWQID] like 'CRRCRT_20230613_1_0232_1_01%'

--Update 2023/01/10 Rcrt data comments to identify retrevial after hurricane Ian
UPDATE [dbo].[SampleEvent] 
SET [Comments] = 'Retrieval after hurricane Ian' 
WHERE [TripID] like 'CRRCRT_20230110%'

UPDATE [dbo].[Recruitment] 
SET [Comments] = 'Retrieval after hurricane Ian'
where [SampleEventID] like 'CRRCRT_20230110%'
---End of CR RCRT Jan 2023 - Nov 2023 data checks. With corrections above, data is complete.
  
---SL RCRT updates
--Update 2023/03/08 WQ comment
UPDATE [dbo].[SampleEventWQ] 
SET [Comments] = 'Same as dermo WQ'
WHERE [SampleEventWQID] like 'SLRCRT_20230308_1_0269%' or [SampleEventWQID] like 'SLRCRT_20230308_1_0256%' or [SampleEventWQID] like 'SLRCRT_20230308_1_0257%' or [SampleEventWQID] like 'SLRCRT_20230308_1_0271%'
---End of SL RCRT Jan 2023 - Nov 2023 data checks. With corrections above, data is complete.

--LX RCRT Updates
--Remove 02/07/2023 extra data entered under LW 
DELETE FROM [dbo].[SampleEvent]
WHERE ([TripID] like 'LXRCRT_202302%') and ([FixedLocationID] = '0235' or [FixedLocationID] = '0236' or [FixedLocationID] = '0237' or [FixedLocationID] = '0240' or [FixedLocationID] = '0241' or [FixedLocationID] = '0312')
DELETE FROM [dbo].[SampleEventWQ]
WHERE [SampleEventID] like 'LXRCRT_20230207_1_0235_1' or [SampleEventID] like 'LXRCRT_20230207_1_0236_1' or [SampleEventID] like 'LXRCRT_20230207_1_0237_1' or [SampleEventID] like 'LXRCRT_20230207_1_0240_1' or [SampleEventID] like 'LXRCRT_20230207_1_0241_1' or [SampleEventID] like 'LXRCRT_20230207_1_0312_1'
--Correct TripID to 02/07/2023 instead of 10/2023
UPDATE [dbo].[SampleEvent]
SET [TripID] = 'LXRCRT_20230207_1'
WHERE [SampleEventID] like 'LXRCRT_202302%' and [TripID] like 'LXRCRT_202310%'
--Correct commment 
UPDATE [dbo].[SampleEventWQ] 
SET [Comments] = 'Same as dermo WQ'
WHERE [SampleEventWQID] like 'LXRCRT_20230606_1_0249%'
---End of LX RCRT Jan 2023 - Nov 2023 data checks. With corrections above, data is complete.

--LW RCRT updates
--Remove 06/08/2023 data (incorrect date)
DELETE FROM [dbo].[TripInfo]
WHERE [TripID] like 'LWRCRT_20230608%' 
DELETE FROM [dbo].[SampleEvent]
WHERE [SampleEventID] like 'LWRCRT_20230608%'
DELETE FROM [dbo].[SampleEventWQ]
WHERE [SampleEventID] like 'LWRCRT_20230608%'
DELETE FROM [dbo].[Recruitment]
WHERE [SampleEventID] like 'LWRCRT_20230608%'
---End of LW RCRT Jan 2023 - Nov 2023 data checks. With corrections above, data is complete.

--TB RCRT Updates
--WQ data missing from trips. Add additional data as local database for join. Name database SPDecMissing for use in following code.
UPDATE [dbo].[SampleEventWQ]
SET [SampleEventWQ].Temperature = (SELECT[2023_12_MissingTBRCRTData].Temperature FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID
),
 [SampleEventWQ].Salinity = (SELECT[2023_12_MissingTBRCRTData].Salinity FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID
),
[SampleEventWQ].DissolvedOxygen = (SELECT [2023_12_MissingTBRCRTData].DissolvedOxygen FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID
),
[SampleEventWQ].pH = (SELECT [2023_12_MissingTBRCRTData].pH FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID
),
[SampleEventWQ].Depth = (SELECT [2023_12_MissingTBRCRTData].Depth FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID
),
[SampleEventWQ].SampleDepth = (SELECT [2023_12_MissingTBRCRTData].SampleDepth FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID
),
[SampleEventWQ].Secchi = (SELECT [2023_12_MissingTBRCRTData].Secchi FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID
),
[SampleEventWQ].TurbidityYSI = (SELECT [2023_12_MissingTBRCRTData].TurbidityYSI FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID
),
[SampleEventWQ].TurbidityHach = (SELECT [2023_12_MissingTBRCRTData].TurbidityHach FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID
),
[SampleEventWQ].CollectionTime = (SELECT [2023_12_MissingTBRCRTData].CollectionTime FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID
),
[SampleEventWQ].PercentDissolvedOxygen = (SELECT [2023_12_MissingTBRCRTData].PercentDissolvedOxygen FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID
)
WHERE [SampleEventWQ].SampleEventID like 'TBRCRT_202305%' or [SampleEventWQ].SampleEventID like 'TBRCRT_202306%' or [SampleEventWQ].SampleEventID like 'TBRCRT_202307%' or [SampleEventWQ].SampleEventID like 'TBRCRT_202308%';
--Update Comments for corrected data.
UPDATE [dbo].[SampleEventWQ]
SET Comments = NULL
WHERE SampleEventID like 'TBRCRT_202305%' or SampleEventID like 'TBRCRT_202306%' or SampleEventID like 'TBRCRT_202307%' or SampleEventID like 'TBRCRT_202308%'
--Confirm dates and days deployed
UPDATE [dbo].[Recruitment]
SET Comments = 'Dates and days deployed correct'
WHERE SampleEventID like 'TBRCRT_20230227%' or SampleEventID like 'TBRCRT_20230626%' 
--Update missing comment for shell order
UPDATE [dbo].[Recruitment]
SET Comments = 'Shell broke in field, mixed up shell order'
WHERE SampleEventID like 'TBRCRT_20230227_1_0527%' and ShellReplicate = 2 and ShellPosition < 7
--Confirm WQ data
UPDATE [dbo].[SampleEventWQ]
SET Comments = 'pH value okay'
WHERE SampleEventID like 'TBRCRT_20231017_1_0291%' or SampleEventID like 'TBRCRT_20231117_1_0529%'
UPDATE [dbo].[SampleEventWQ]
SET Comments = 'YSI turbidity okay'
WHERE SampleEventID like 'TBRCRT_20230118_1_027%' or SampleEventID like 'TBRCRT_20231118_1_0528%'
UPDATE [dbo].[SampleEventWQ]
SET Comments = 'DO value okay'
WHERE SampleEventID like 'TBRCRT_20230815_1_0291%' or SampleEventID like 'TBRCRT_20230718_1_0291%'
---End of TB RCRT Jan 2023 - Nov 2023 data checks. With corrections above, data is complete.


IF OBJECT_ID('tempdb..#ValidTrips') IS NOT NULL BEGIN DROP TABLE #ValidTrips; END
CREATE TABLE #ValidTrips ( TripID VARCHAR(50) );
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2023-11-30' AND DataStatus = 'Proofed' AND TripID like 'CRRCRT%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2023-11-30' AND DataStatus = 'Proofed' AND TripID like 'SLRCRT%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2023-11-30' AND DataStatus = 'Proofed' AND TripID like 'LXRCRT%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2023-11-30' AND DataStatus = 'Proofed' AND TripID like 'LWRCRT%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2023-11-30' AND DataStatus = 'Proofed' AND TripID like 'TBRCRT%';
UPDATE TripInfo SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '27-December-2023' WHERE TripID IN (SELECT TripID FROM #ValidTrips);
UPDATE SampleEvent SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '27.December.2023' WHERE TripID IN (SELECT TripID FROM #ValidTrips);
UPDATE SampleEventWQ SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '27-December-2023' WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));
UPDATE Recruitment SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '27-December-2023' WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));
INSERT INTO hsdb.TripInfo SELECT * FROM TripInfo WHERE DataStatus = 'Completed';
DELETE FROM dbo.TripInfo WHERE DataStatus = 'Completed';
INSERT INTO hsdb.SampleEvent SELECT * FROM SampleEvent WHERE DataStatus = 'Completed';
DELETE FROM dbo.SampleEvent WHERE DataStatus = 'Completed';
INSERT INTO hsdb.SampleEventWQ SELECT * FROM SampleEventWQ WHERE DataStatus = 'Completed';
DELETE FROM dbo.SampleEventWQ WHERE DataStatus = 'Completed';
INSERT INTO hsdb.Recruitment SELECT * FROM Recruitment WHERE DataStatus = 'Completed';
DELETE FROM dbo.Recruitment WHERE DataStatus = 'Completed';
