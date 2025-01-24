use [Oysters_25-01-25]
go

--SDTP: 12/2024 TB/CR, ,1/2025 LW Remove incorrect TripID
DELETE FROM [dbo].[TripInfo] where TripID like 'LWSDTP_20250116%'

--COLL 01/2025
UPDATE [dbo].[Dermo]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Oysters collected from SLS1, no oysters at SLS3' else ', Oysters collected from SLS1, no oysters at SLS3' end)
where [OysterID] like 'SLSD2501-11' or OysterID like 'SLSD2501-12' or OysterID like 'SLSD2501-13' or OysterID like 'SLSD2501-14' or OysterID like 'SLSD2501-15'

--Repro/COLL 10-11/2024
UPDATE [dbo].[SampleEventWQ]
set [DataStatus] = 'Proofed', DateProofed = '2024-10-22 00:00:00', ProofedBy = 'Lily Harmon'
where SampleEventID like 'LWCOLL_20241002%'
UPDATE [dbo].[SampleEvent]
set [DataStatus] = 'Proofed', DateProofed = '2024-10-22 00:00:00', ProofedBy = 'Lily Harmon'
where SampleEventID like 'LWCOLL_20241002%'


--RCRT 01/2025 CERP, PBC & TB 12/2024-01/2025 - Done

EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-12-01', @CheckEnd = '2024-12-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-12-01', @CheckEnd = '2024-12-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2025-01-01', @CheckEnd = '2025-01-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-10-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-10-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-10-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-10-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-01-01', @CheckEnd = '2025-01-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-01-01', @CheckEnd = '2025-01-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-01-01', @CheckEnd = '2025-01-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-01-01', @CheckEnd = '2025-01-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-12-01', @CheckEnd = '2025-01-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-12-01', @CheckEnd = '2025-01-31', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-12-01', @CheckEnd = '2025-01-31', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-12-01', @CheckEnd = '2025-01-31', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';