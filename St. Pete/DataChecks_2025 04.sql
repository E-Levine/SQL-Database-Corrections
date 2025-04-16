use [Oysters_25-04-15]
go

--Adding/correcting for extra LXN COLL samples
DELETE FROM [dbo].[Dermo] where OysterID like 'LXND2503%'
--Run LX_COLL_Dermo_2025_EW file

select * from Dermo where OysterID like 'LXND2503-%' order by OysterID