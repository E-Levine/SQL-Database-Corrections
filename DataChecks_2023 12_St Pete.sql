---Code for RCRT database checks
use OystersEL_231201
go

--Checking for childless PKs in Trip info then sucessive tables
select * from TripInfo 
where TripID like 'CRRCRT_20230214_1%'

select * from SampleEvent
where TripID like 'CRRCRT_2023%'

select * from SampleEventWQ
where SampleEventID like 'CRRCRT_20230214_1%'

select * from Recruitment
where SampleEventID like 'CRRCRT_20230214%' order by ShellID

----Code from Teams folder
--Start with Trip Info table
UPDATE [dbo].[TripInfo] 
--Replace error in Trip ID, WHERE should be identical to incorrect Primary Key
--Replace 'LWCOLL_20230104__1' with incorrect pk and 'LWCOLL_20230105_1' with correct pk
SET [TripID] = REPLACE ([TripID], 'LWCOLL_20230104_1','LWCOLL_20230105_1') 
WHERE [TripID] like 'LWCOLL_20230104_1'

UPDATE [dbo].[TripInfo] 
SET [TripDate] = REPLACE ([TripDate], '2022-01-04','2022-01-05')
--WHERE must explicitly state trip ID (Now updated) to match date of incorrect trip
WHERE [TripDate] like '2022-01-04' AND [TripID] like 'LWCOLL_20230105_1'

--Follow throught other base tables (Sample Event and Sample Event WQ)
UPDATE [dbo].[SampleEvent] 
SET [SampleEventID] = REPLACE ([SampleEventID], 'LWCOLL_20230104_1_','LWCOLL_20230105_1_') 
WHERE [SampleEventID] like 'LWCOLL_20230104_1_%'

UPDATE [dbo].[SampleEvent] 
SET [TripID] = REPLACE ([TripID], 'LWCOLL_20230104_1','LWCOLL_20230105_1') 
WHERE [TripID] like 'LWCOLL_20230104_1'

--Be sure to change both SEWQ 1 and 2 if there are multiple WQs for the same event (depths greater than 1m)
--Use following code to check
SELECT *
  FROM [dbo].[SampleEventWQ]
  WHERE [SampleEventWQID] like 'LWCOLL_20230104_1_%'

--Replace incorrect SEWQ PKs
UPDATE [dbo].[SampleEventWQ] 
SET [SampleEventWQID] = REPLACE ([SampleEventWQID], 'LWCOLL_20230104_1_','LWCOLL_20230105_1_') 
WHERE [SampleEventWQID] like 'LWCOLL_20230104_1_%'

UPDATE [dbo].[SampleEventWQ] 
SET [SampleEventID] = REPLACE ([SampleEventID], 'LWCOLL_20230104_1_','LWCOLL_20230105_1_') 
WHERE [SampleEventID] like 'LWCOLL_20230104_1_%'

--Fix PK errors in Recruitment 
SELECT *
  FROM [dbo].[Recruitment]
  WHERE [SampleEventID] like 'ABRCRT_20221216_1_%'

UPDATE [dbo].[Recruitment] 
SET [SampleEventID] = REPLACE ([SampleEventID], 'ABRCRT_20221216_1_','ABRCRT_20221217_1_') 
WHERE [SampleEventID] like 'ABRCRT_20221216_1_%'

UPDATE [dbo].[Recruitment] 
SET [ShellID] = REPLACE ([ShellID], 'ABRCRT_20221216_1_','ABRCRT_20221217_1_') 
WHERE [ShellID] like 'ABRCRT_20221216_1_%'