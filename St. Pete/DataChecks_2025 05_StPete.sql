use [Oysters_test]
go

--RCRT 05/2025 -Done.

--STDP 05/2025 - No DW measurements. Add ave meas to comments for each station.


--CAGE 05/2025 - Done.
--COLL 05/2025 - Done.
Update [dbo].[Dermo] set Comments = 'SLS3 collected from SLS1 due to no oysters at SLS3' where OysterID = 'SLSD2505-11'
Update [dbo].[Dermo] set Comments = 'SLS3 collected from SLS1 due to no oysters at SLS3' where OysterID = 'SLSD2505-12'
Update [dbo].[Dermo] set Comments = 'SLS3 collected from SLS1 due to no oysters at SLS3' where OysterID = 'SLSD2505-13'
Update [dbo].[Dermo] set Comments = 'SLS3 collected from SLS1 due to no oysters at SLS3' where OysterID = 'SLSD2505-14'
Update [dbo].[Dermo] set Comments = 'SLS3 collected from SLS1 due to no oysters at SLS3' where OysterID = 'SLSD2505-15'


EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-05-01', @CheckEnd = '2025-05-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-05-01', @CheckEnd = '2025-05-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-05-01', @CheckEnd = '2025-05-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-05-01', @CheckEnd = '2025-05-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-05-01', @CheckEnd = '2025-05-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2025-05-01', @CheckEnd = '2025-05-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-05-01', @CheckEnd = '2025-05-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-05-01', @CheckEnd = '2025-05-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-05-01', @CheckEnd = '2025-05-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';