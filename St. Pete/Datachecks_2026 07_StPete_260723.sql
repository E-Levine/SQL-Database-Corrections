use [Oysters] --COMPLETED in OYSTERS 260723
go

-- Repro 04-06/2026: LW, CERP GOOD -COMPLETED IN OYSTERS 7/21/26

-- COLL 07/2026 - GOOD

-- TB COLL data
-- 04/2024 CI - Good
-- 12/2025 Repro - Good
-- 05-06/2026 Dermo - Good

-- TB Rcrt 03/2026 - GOOD

-- CERP/PBC Rcrt 07/2026 - GOOD

-- Cages 07/2026 - GOOD


--EXECUTE [dbo].[spChecksCollections] @CheckStart = '2026-04-01', @CheckEnd = '2026-06-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
--EXECUTE [dbo].[spChecksCollections] @CheckStart = '2026-04-01', @CheckEnd = '2026-06-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
--EXECUTE [dbo].[spChecksCollections] @CheckStart = '2026-04-01', @CheckEnd = '2026-06-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
--EXECUTE [dbo].[spChecksCollections] @CheckStart = '2026-04-01', @CheckEnd = '2026-06-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-04-01', @CheckEnd = '2024-04-28', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-12-01', @CheckEnd = '2025-12-28', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-03-01', @CheckEnd = '2026-03-31', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-07-01', @CheckEnd = '2026-07-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-07-01', @CheckEnd = '2026-07-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-07-01', @CheckEnd = '2026-07-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-07-01', @CheckEnd = '2026-07-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-07-01', @CheckEnd = '2026-07-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-07-01', @CheckEnd = '2026-07-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-07-01', @CheckEnd = '2026-07-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';