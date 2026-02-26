use [Oysters] --COMPLETED 02/25/2026
go

----Uploaded Cage data 2015-2022 to Oysters 260224
--Corrected station FID for SL 8/4/2015
--Corrected LX date to 5/2/2017 from 5/3/2017 in SH/Counts
--Corrected SL date to 12/10/2018 from 12/11/2018 in SH/Counts
--No SL cages 11/2017 through 5/2018 need placeholders for these dates.
--No CR2 (0231) cages 12/11/2017 through 03/12/2019
--Added SH placeholder row for CRCAGE_20251112 0232 R Y
--Update NULL SH 
--COMPLETED 260224: Update hsdb.CageSH set ShellHeight = 'Z' where ShellHeightID = 'CRCAGE_20250916_1_0232_1_R_B_01'

--COMPLETED 260224: EXECUTE [dbo].[spChecksCage] @CheckStart = '2015-01-01', @CheckEnd = '2025-12-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
--COMPLETED 260224: EXECUTE [dbo].[spChecksCage] @CheckStart = '2015-01-01', @CheckEnd = '2025-12-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
--COMPLETED 260224: EXECUTE [dbo].[spChecksCage] @CheckStart = '2015-01-01', @CheckEnd = '2025-12-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';

--Monthly data checks:
--LW SDTP - Good

-- Dermo data: SL, CR, LW DONE
--Add comments to LX extra samples
UPDATE [dbo].[Dermo] set Comments = CONCAT('Sex ratio project sample ', Comments) where OysterID = 'LXND2601-16' or OysterID = 'LXND2601-17' or OysterID = 'LXND2601-18' or 
	OysterID = 'LXND2601-19' or OysterID like 'LXND2601-2%' or OysterID like 'LXND2601-3%' or OysterID like 'LXND2601-4%'

--RCRT Good

--CAGE data
--Update CR4 to have Cage data
update dbo.FixedLocations set Cage = 'Y' where StationName = 'KK' and Estuary = 'CR'


EXECUTE [dbo].[spChecksSediment] @CheckStart = '2026-02-01', @CheckEnd = '2026-02-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-02-01', @CheckEnd = '2026-02-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-02-01', @CheckEnd = '2026-02-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-02-01', @CheckEnd = '2026-02-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-02-01', @CheckEnd = '2026-02-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-02-01', @CheckEnd = '2026-02-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-02-01', @CheckEnd = '2026-02-28', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-02-01', @CheckEnd = '2026-02-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-02-01', @CheckEnd = '2026-02-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-02-01', @CheckEnd = '2026-02-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';