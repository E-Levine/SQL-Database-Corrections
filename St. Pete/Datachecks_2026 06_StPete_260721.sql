use [Oysters] --COMPLETED IN OYSTERS 260721
go

-- TB RCRT
Update SampleEventWQ set TurbidityHach = 3.91 where SampleEventWQID = 'TBRCRT_20260428_1_0529_1_02'

--TB COLL 03/2026 - GOOD

-- CERP/PBC COLL 04/2026 - GOOD + FINISH
-- CERP/PBC COLL 06/2026 - GOOD

-- Rcrt CERP/PBC?TIG06/2026 - GOOD

-- LW SDTP 06/2026 - GOOD

-- CAGES 06/2026 - GOOD

-- SRVY TB 04/2026
Update TripInfo set DataStatus = 'Proofed', DateProofed = '2026-06-24 00:00:00.0000000', ProofedBy = 'Lily Harmon' where TripID like 'TBSRVY_202604%'
-- SRVY SL, CR 06/2026 - GOOD


EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-04-01', @CheckEnd = '2026-04-28', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2026-03-01', @CheckEnd = '2026-03-31', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2026-04-01', @CheckEnd = '2026-04-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2026-04-01', @CheckEnd = '2026-04-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2026-04-01', @CheckEnd = '2026-04-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2026-03-01', @CheckEnd = '2026-04-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-06-01', @CheckEnd = '2026-06-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-06-01', @CheckEnd = '2026-06-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-06-01', @CheckEnd = '2026-06-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-06-01', @CheckEnd = '2026-06-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-06-01', @CheckEnd = '2026-06-28', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2026-06-01', @CheckEnd = '2026-06-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-06-01', @CheckEnd = '2026-06-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-06-01', @CheckEnd = '2026-06-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-06-01', @CheckEnd = '2026-06-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2026-04-01', @CheckEnd = '2026-04-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2026-06-01', @CheckEnd = '2026-06-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2026-06-01', @CheckEnd = '2026-06-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';