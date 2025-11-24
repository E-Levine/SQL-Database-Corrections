use [Oysters_25-11-24]
go

--Cages moved SLC1 > SLC2 -- COMPLETED ON OYSTERS
--UPDATE FixedLocations set Cage = 'Y' where FixedLocationID = '0256'

--Extra sample:
DELETE from hsdb.Dermo where OysterID like 'LXSD2112-01' and SampleEventID like 'LXCOLL_20211207_1_0249_1'

-- LW SDTP 11/2025. Good.

--CERP, PBC dermo checks 11/2025
--Add comment to Sex ratio samples, check SLS2511-10 data
UPDATE [dbo].[Dermo] set Comments = CONCAT('Sex ratio project sample ', Comments) where OysterID = 'LXND2511-16' or OysterID = 'LXND2511-17' or OysterID = 'LXND2511-18' or 
	OysterID = 'LXND2511-19' or OysterID like 'LXND2511-2%' or OysterID like 'LXND2511-3%' or OysterID like 'LXND2511-4%' 

--CERP, PBC RCRT checks 11/2025
--Update CRW4 deployed date
Update [dbo].[Recruitment] set DeployedDate = '2025-10-14' where SampleEventID = 'CRRCRT_20251112_1_0233_1'

EXECUTE [dbo].[spChecksSediment] @CheckStart = '2025-11-01', @CheckEnd = '2025-11-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-11-01', @CheckEnd = '2025-11-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-11-01', @CheckEnd = '2025-11-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-11-01', @CheckEnd = '2025-11-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-11-01', @CheckEnd = '2025-11-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';