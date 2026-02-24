use [Oysters]
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