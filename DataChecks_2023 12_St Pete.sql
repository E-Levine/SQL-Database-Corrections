---Database corrections St Pete 2023/12/01 - E Levine
Use OystersEL_231201
go

---CR RCRT updates
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

---End of CR RCRT Jan 2023 - Oct 2023 data checks. With corrections above, data is complete.
IF OBJECT_ID('tempdb..#ValidTrips') IS NOT NULL BEGIN DROP TABLE #ValidTrips; END
CREATE TABLE #ValidTrips ( TripID VARCHAR(50) );
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2023-10-31' AND DataStatus = 'Proofed' AND TripID like 'CRRCRT%';
UPDATE TripInfo SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '01-December-2023' WHERE TripID IN (SELECT TripID FROM #ValidTrips);
UPDATE SampleEvent SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '01.December.2023' WHERE TripID IN (SELECT TripID FROM #ValidTrips);
UPDATE SampleEventWQ SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '01-December-2023' WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));
UPDATE Recruitment SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '01-December-2023' WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));
INSERT INTO hsdb.TripInfo SELECT * FROM TripInfo WHERE DataStatus = 'Completed';
DELETE FROM dbo.TripInfo WHERE DataStatus = 'Completed';
INSERT INTO hsdb.SampleEvent SELECT * FROM SampleEvent WHERE DataStatus = 'Completed';
DELETE FROM dbo.SampleEvent WHERE DataStatus = 'Completed';
INSERT INTO hsdb.SampleEventWQ SELECT * FROM SampleEventWQ WHERE DataStatus = 'Completed';
DELETE FROM dbo.SampleEventWQ WHERE DataStatus = 'Completed';
INSERT INTO hsdb.Recruitment SELECT * FROM Recruitment WHERE DataStatus = 'Completed';
DELETE FROM dbo.Recruitment WHERE DataStatus = 'Completed';
