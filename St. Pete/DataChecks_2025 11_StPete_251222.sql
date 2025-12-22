use [Oysters] --Completed in Oysters 25/12/22
go

--Cages moved SLC1 > SLC2 -- COMPLETED ON OYSTERS
--UPDATE FixedLocations set Cage = 'Y' where FixedLocationID = '0256'

--Extra sample:
DELETE from hsdb.Dermo where OysterID like 'LXSD2112-01' and SampleEventID like 'LXCOLL_20211207_1_0249_1'

-- LW SDTP 11-12/2025. Good.

--CERP, PBC dermo checks 11-12/2025
--Add comment to Sex ratio samples, check SLS2511-10 data
UPDATE [dbo].[Dermo] set Comments = CONCAT('Sex ratio project sample ', Comments) where OysterID = 'LXND2511-16' or OysterID = 'LXND2511-17' or OysterID = 'LXND2511-18' or 
	OysterID = 'LXND2511-19' or OysterID like 'LXND2511-2%' or OysterID like 'LXND2511-3%' or OysterID like 'LXND2511-4%' or
	OysterID = 'LXND2512-16' or OysterID = 'LXND2512-17' or OysterID = 'LXND2512-18' or 
	OysterID = 'LXND2512-19' or OysterID like 'LXND2512-2%' or OysterID like 'LXND2512-3%' or OysterID like 'LXND2512-4%'

--CERP, PBC RCRT checks 11-12/2025
--Update CRW4 deployed date
Update [dbo].[Recruitment] set DeployedDate = '2025-10-14' where SampleEventID = 'CRRCRT_20251112_1_0233_1'
Update [dbo].[Recruitment] set Comments = 'Data not recorded' where ShellID = 'LXRCRT_20251202_1_0243_1_36'

-- TB RCRT 11-12/2025
Update [dbo].[SampleEventWQ] set TurbidityHach = 2.87 where SampleEventWQID = 'TBRCRT_20251118_1_0529_1_02'

-- Mini survey - SL, CR Good

EXECUTE [dbo].[spChecksSediment] @CheckStart = '2025-11-01', @CheckEnd = '2025-12-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-11-01', @CheckEnd = '2025-12-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-11-01', @CheckEnd = '2025-12-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-11-01', @CheckEnd = '2025-12-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-11-01', @CheckEnd = '2025-12-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-11-01', @CheckEnd = '2025-12-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2025-12-01', @CheckEnd = '2025-12-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2025-12-01', @CheckEnd = '2025-12-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';