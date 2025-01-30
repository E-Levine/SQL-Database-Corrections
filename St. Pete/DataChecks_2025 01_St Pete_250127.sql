use [Oysters] --Completed 01/27/2025 EW.
go

--SDTP: 12/2024 TB/CR, ,1/2025 LW Remove incorrect TripID
DELETE FROM [dbo].[TripInfo] where TripID like 'LWSDTP_20250116%'

--COLL 01/2025
UPDATE [dbo].[Dermo]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Oysters collected from SLS1, no oysters at SLS3' else ', Oysters collected from SLS1, no oysters at SLS3' end)
where [OysterID] like 'SLSD2501-11' or OysterID like 'SLSD2501-12' or OysterID like 'SLSD2501-13' or OysterID like 'SLSD2501-14' or OysterID like 'SLSD2501-15'
UPDATE [dbo].[Dermo]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Oysters collected from SLS2, no oysters at SLS3' else ', Oysters collected from SLS2, no oysters at SLS3' end)
where [OysterID] like  'SLSD2412-11' or OysterID like 'SLSD2412-12' or OysterID like 'SLSD2412-13' or OysterID like 'SLSD2412-14' or OysterID like 'SLSD2412-15'

--Repro/COLL 10-12/2024
UPDATE [dbo].[SampleEventWQ]
set [DataStatus] = 'Proofed', DateProofed = '2024-10-22 00:00:00', ProofedBy = 'Lily Harmon'
where SampleEventID like 'LWCOLL_20241002%'
UPDATE [dbo].[SampleEvent]
set [DataStatus] = 'Proofed', DateProofed = '2024-10-22 00:00:00', ProofedBy = 'Lily Harmon'
where SampleEventID like 'LWCOLL_20241002%'
UPDATE [dbo].[Repro]
set [ReproStage] = 'Z', Comments = 'Stage = 2'
where OysterID like 'CRWD2412-03'

--RCRT 01/2025 CERP, PBC & TB 12/2024-01/2025 - Done

EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-12-01', @CheckEnd = '2024-12-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-12-01', @CheckEnd = '2024-12-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2025-01-01', @CheckEnd = '2025-01-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-10-01', @CheckEnd = '2024-12-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-10-01', @CheckEnd = '2024-12-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-10-01', @CheckEnd = '2024-12-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-10-01', @CheckEnd = '2024-12-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-01-01', @CheckEnd = '2025-01-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-01-01', @CheckEnd = '2025-01-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-01-01', @CheckEnd = '2025-01-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-01-01', @CheckEnd = '2025-01-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-12-01', @CheckEnd = '2025-01-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-12-01', @CheckEnd = '2025-01-31', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-12-01', @CheckEnd = '2025-01-31', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-12-01', @CheckEnd = '2025-01-31', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';

---CAGE 04-08/2024: Data not found in TripInfo, SampleEvent, or SampleEventWQ but found in CageCount and CageSH
	-- Query the CageCounts table using the temporary table
	UPDATE dbo.CageCount
	SET DataStatus = 'Completed', CompletedBy = 'Erica Williams', DateCompleted = '2025-01-27 00:00:00'
	WHERE SampleEventID like '%2024%';
	
	-- Query the CageSH table using the temporary table
	UPDATE dbo.CageSH 
	SET DataStatus = 'Completed', CompletedBy = 'Erica Williams', DateCompleted = '2025-01-27 00:00:00'
	WHERE CageCountID like '%2024%';

	INSERT INTO hsdb.CageCount SELECT * FROM CageCount WHERE DataStatus = 'Completed';
	DELETE FROM dbo.CageCount WHERE DataStatus = 'Completed';
	INSERT INTO hsdb.CageSH SELECT * FROM CageSH WHERE DataStatus = 'Completed';
    DELETE FROM dbo.CageSH WHERE DataStatus = 'Completed';
