use [Oysters_25-06-27]
go

--Remove duplicate CR survey stations - Completed in Oysters
--WITH CTE AS (
--    SELECT *,
--           ROW_NUMBER() OVER (PARTITION BY FixedLocationID,Estuary, SectionName, StationName, StationNumber, ParcelName, ParcelArea, CultchDensity, LatitudeDec, LongitudeDec, Recruitment, Survey, Sediment, Collections, ShellBudget, Dataloggers, Cage, Wave, StartDate, EndDate, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes, StationNameNumber, EstuaryLongName, DateLastCultched ORDER BY (SELECT NULL)) AS row_num
--    FROM FixedLocations
--)
--DELETE FROM CTE WHERE row_num > 1;
--Add missing CR survey stations - Completed in Oysters
--INSERT INTO [dbo].[FixedLocations]
--    ([FixedLocationID],[Estuary],[SectionName],[StationName],[StationNumber],[ParcelName],[ParcelArea],[CultchDensity],[LatitudeDec],[LongitudeDec],[Recruitment],[Survey],[Sediment],[Collections],[ShellBudget],[Dataloggers],[Cage],[Wave],[StartDate],[EndDate],[DataStatus],[DateEntered],[EnteredBy],[DateProofed],[ProofedBy],[DateCompleted],[CompletedBy],[Comments],[AdminNotes],[StationNameNumber],[EstuaryLongName])
--  VALUES
--      ('C025','CR','B','CR B 26464_82107 29','29',NULL,NULL,NULL,26.77481,-82.1791,'N','Y','N','N','N','N','N','N','2023-08-31','2023-11-01','Completed','2024-02-05','EL',NULL,NULL,NULL,NULL,'26464_82107',NULL,'CR-B-26464_82107-29','Caloosahatchee River')
--GO
--INSERT INTO [dbo].[FixedLocations]
--        ([FixedLocationID],[Estuary],[SectionName],[StationName],[StationNumber],[ParcelName],[ParcelArea],[CultchDensity],[LatitudeDec],[LongitudeDec],[Recruitment],[Survey],[Sediment],[Collections],[ShellBudget],[Dataloggers],[Cage],[Wave],[StartDate],[EndDate],[DataStatus],[DateEntered],[EnteredBy],[DateProofed],[ProofedBy],[DateCompleted],[CompletedBy],[Comments],[AdminNotes],[StationNameNumber],[EstuaryLongName])
--  VALUES
--     ('C026','CR','W','CR W 26362_82030 30','30',NULL,NULL,NULL,26.60476,-82.05074,'N','Y','N','Y','N','N','N','N','2023-08-31','2023-11-01','Completed','2024-02-05','EL',NULL,NULL,NULL,NULL,'26362_82030',NULL,'CR-W-26362_82030-30','Caloosahatchee River')
--GO
--INSERT INTO [dbo].[FixedLocations]
--        ([FixedLocationID],[Estuary],[SectionName],[StationName],[StationNumber],[ParcelName],[ParcelArea],[CultchDensity],[LatitudeDec],[LongitudeDec],[Recruitment],[Survey],[Sediment],[Collections],[ShellBudget],[Dataloggers],[Cage],[Wave],[StartDate],[EndDate],[DataStatus],[DateEntered],[EnteredBy],[DateProofed],[ProofedBy],[DateCompleted],[CompletedBy],[Comments],[AdminNotes],[StationNameNumber],[EstuaryLongName])
--  VALUES
--      ('C027','CR','W','CR W 26332_82046 31','31',NULL,NULL,NULL,26.55481,-82.07687,'N','Y','N','N','N','N','N','N','2023-08-31','2023-11-01','Completed','2024-02-05','EL',NULL,NULL,NULL,NULL,'26332_82046',NULL,'CR-W-26332_82046-31','Caloosahatchee River')
--GO
--INSERT INTO [dbo].[FixedLocations]
--        ([FixedLocationID],[Estuary],[SectionName],[StationName],[StationNumber],[ParcelName],[ParcelArea],[CultchDensity],[LatitudeDec],[LongitudeDec],[Recruitment],[Survey],[Sediment],[Collections],[ShellBudget],[Dataloggers],[Cage],[Wave],[StartDate],[EndDate],[DataStatus],[DateEntered],[EnteredBy],[DateProofed],[ProofedBy],[DateCompleted],[CompletedBy],[Comments],[AdminNotes],[StationNameNumber],[EstuaryLongName])
--  VALUES
--      ('C028','CR','W','CR W 26340_82044 32','32',NULL,NULL,NULL,26.56728,-82.0747,'N','Y','N','N','N','N','N','N','2023-08-31','2023-11-01','Completed','2024-02-05','EL',NULL,NULL,NULL,NULL,'26340_82044',NULL,'CR-W-26340_82044-32','Caloosahatchee River')
--GO
--INSERT INTO [dbo].[FixedLocations]
--       ([FixedLocationID],[Estuary],[SectionName],[StationName],[StationNumber],[ParcelName],[ParcelArea],[CultchDensity],[LatitudeDec],[LongitudeDec],[Recruitment],[Survey],[Sediment],[Collections],[ShellBudget],[Dataloggers],[Cage],[Wave],[StartDate],[EndDate],[DataStatus],[DateEntered],[EnteredBy],[DateProofed],[ProofedBy],[DateCompleted],[CompletedBy],[Comments],[AdminNotes],[StationNameNumber],[EstuaryLongName])
--  VALUES
--      ('C029','CR','W','CR W 26339_82039 33','33',NULL,NULL,NULL,26.56548,-82.06556,'N','Y','N','N','N','N','N','N','2023-08-31','2023-11-01','Completed','2024-02-05','EL',NULL,NULL,NULL,NULL,'26339_82039',NULL,'CR-W-26339_82039-33','Caloosahatchee River')
--GO

--Update Datalogger locations
UPDATE FixedLocations set Dataloggers = 'Y' where StationNameNumber = 'SL-N-1-1' or StationNameNumber = 'LX-N-2-2' or StationNameNumber = 'PPT-1'

--Update station for collections
UPDATE FixedLocations set Collections = 'Y' where FixedLocationID like 'C027'

-- TB 03/2025 SRVY -- DONE.
--LW RCRT 01/2023-10/2023 -- DONE.
--LX COLL 03/2025 - DONE.
--SL, LX, CR 07/2023-09/2023, 11/2023, 01/2024
UPDATE [dbo].[SampleEvent] set DataStatus = 'Proofed', DateProofed = '2025-03-12 00:00:00.0000000', ProofedBy = 'Darian Blackiston' where SampleEventID like 'LXCOLL_202401%' or SampleEventID like 'SLCOLL_202401%' or SampleEventID like 'CRCOLL_202401%'
UPDATE [dbo].[SampleEventWQ] set DataStatus = 'Proofed', DateProofed = '2025-03-12 00:00:00.0000000', ProofedBy = 'Darian Blackiston' where SampleEventWQID like 'LXCOLL_202401%' or SampleEventWQID like 'SLCOLL_202401%' or SampleEventWQID like 'CRCOLL_202401%'

--TB COLL: 03/2023, 08/2023-01/2024, 03/2025
UPDATE [dbo].[SampleEvent] set DataStatus = 'Proofed', DateProofed = '2025-03-12 00:00:00.0000000', ProofedBy = 'Darian Blackiston' where SampleEventID like 'TBCOLL_202309%' or SampleEventID like 'TBCOLL_202310%' or SampleEventID like 'TBCOLL_202312%' or SampleEventID like 'TBCOLL_202401%' 
UPDATE [dbo].[SampleEventWQ] set DataStatus = 'Proofed', DateProofed = '2025-03-12 00:00:00.0000000', ProofedBy = 'Darian Blackiston' where SampleEventWQID like 'TBCOLL_202309%' or SampleEventID like 'TBCOLL_202310%' or SampleEventID like 'TBCOLL_202312%' or SampleEventID like 'TBCOLL_202401%' 
UPDATE [dbo].[SampleEvent] set DataStatus = 'Proofed', DateProofed = '2025-03-12 00:00:00.0000000', ProofedBy = 'Darian Blackiston' where SampleEventID like 'TBCOLL_202403%' or SampleEventID like 'TBCOLL_20240405%'
UPDATE [dbo].[SampleEventWQ] set DataStatus = 'Proofed', DateProofed = '2025-03-12 00:00:00.0000000', ProofedBy = 'Darian Blackiston' where SampleEventWQID like 'TBCOLL_202403%' or SampleEventID like 'TBCOLL_20240405%'
DELETE from Dermo where SampleEventID like 'TBCOLL_20250313_1_0291_1%' and ShellHeight is NULL
DELETE from Dermo where SampleEventID like 'TBCOLL_20250313_1_0277_1%' and ShellHeight is NULL

-- CERP, PBC RCRT 06/2025 -- DONE.
-- LW SDTP 06/2025 -- DONE.
-- CERP, PBC Dermo 
UPDATE [dbo].[SampleEventWQ] set pH = [value] where SampleEventWQID like 'CRCOLL_20250617_1_0230_1_01%' 
-- Mini survey:
UPDATE [dbo].SurveyQuadrat set DataStatus = 'Proofed', DateProofed = '2025-06-27 00:00:00.0000000', ProofedBy = 'Erica Williams' where SampleEventID like 'SLSRVY_202506%' 
UPDATE [dbo].SurveySH set DataStatus = 'Proofed', DateProofed = '2025-06-27 00:00:00.0000000', ProofedBy = 'Erica Williams' where QuadratID like 'SLSRVY_20250611_1_0255_1_10%' 


EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2025-03-01', @CheckEnd = '2025-03-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2023-01-01', @CheckEnd = '2023-10-31', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-03-01', @CheckEnd = '2025-03-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-07-01', @CheckEnd = '2023-09-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-07-01', @CheckEnd = '2023-09-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-07-01', @CheckEnd = '2023-09-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-11-01', @CheckEnd = '2023-11-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-11-01', @CheckEnd = '2023-11-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-11-01', @CheckEnd = '2023-11-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-01-01', @CheckEnd = '2024-01-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-01-01', @CheckEnd = '2024-01-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-01-01', @CheckEnd = '2024-01-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-03-01', @CheckEnd = '2023-03-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-08-01', @CheckEnd = '2024-01-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-03-01', @CheckEnd = '2024-04-15', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-03-01', @CheckEnd = '2025-04-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-06-01', @CheckEnd = '2025-06-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-06-01', @CheckEnd = '2025-06-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-06-01', @CheckEnd = '2025-06-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-06-01', @CheckEnd = '2025-06-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2025-06-01', @CheckEnd = '2025-06-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2025-06-01', @CheckEnd = '2025-06-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2025-06-01', @CheckEnd = '2025-06-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';