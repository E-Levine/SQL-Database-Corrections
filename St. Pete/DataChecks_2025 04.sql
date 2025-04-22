use [Oysters]
go

--SKIP: DONE TO OYSTERS 04/21/2025:Adding/correcting for extra LXN COLL samples
DELETE FROM [dbo].[Dermo] where OysterID like 'LXND2503%'
Delete FROM [dbo].[TripInfo] where TripID like 'LXCOLL_20250318_2' or TripID like 'LXCOLL_20250318_3'
Delete FROM [dbo].[SampleEvent] where TripID like 'LXCOLL_20250318_2'
Delete FROM [dbo].[SampleEventWQ] where SampleEventID like 'LXCOLL_20250318_2%'
--Run LX_COLL_Dermo_2025_EW file

select * from Dermo where OysterID like 'LXND2503-%' order by OysterID