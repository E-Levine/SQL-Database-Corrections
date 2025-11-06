use [Oysters]
go

--Cages moved SLC1 > SLC2 -- COMPLETED ON OYSTERS
--UPDATE FixedLocations set Cage = 'Y' where FixedLocationID = '0256'

--Extra sample:
DELETE from hsdb.Dermo where OysterID like 'LXSD2112-01' and SampleEventID like 'LXCOLL_20211207_1_0249_1'