---Database corrections St Pete 2023/12/01 - E Levine
Use OystersEL_231201
go

---CR RCRT updates
--Update 2023/02/14 Trip IDs in SampleEvent
UPDATE [dbo].[SampleEvent] 
SET [TripID] = REPLACE ([TripID], 'CRRCRT_20230413_1','CRRCRT_20230214_1') 
WHERE [SampleEventID] like 'CRRCRT_20230214_1_%'
