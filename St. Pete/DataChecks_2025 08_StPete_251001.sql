--St Pete corrections - Completed Oysters 2025/10/01
--August - September 2025
use [Oysters]
go

--Update CR dermo: -- completed in Oysters:
--INSERT INTO [dbo].[Dermo] ([OysterID],[SampleEventID],[ShellHeight],[ShellLength],[ShellWidth],[TotalWeight],[ShellWetWeight],[DermoMantle],[DermoGill],[DataStatus],[DateEntered],[EnteredBy],[DateProofed],[ProofedBy],[DateCompleted],[CompletedBy],[Comments],[AdminNotes])
 --VALUES ('CRED2507-01','CRCOLL_20250724_1_0230_1',79.33,NULL,NULL,44.74,34.42,0.5,0,'Proofed','2025-08-25','Erica Williams','2025-08-25','Erica Williams',NULL,NULL,'0','Added via SMSS')
 -- GO
--INSERT INTO [dbo].[Dermo] ([OysterID],[SampleEventID],[ShellHeight],[ShellLength],[ShellWidth],[TotalWeight],[ShellWetWeight],[DermoMantle],[DermoGill],[DataStatus],[DateEntered],[EnteredBy],[DateProofed],[ProofedBy],[DateCompleted],[CompletedBy],[Comments],[AdminNotes])
 -- VALUES ('CRED2507-02','CRCOLL_20250724_1_0230_1',53,NULL,NULL,22.97,15.93,0.5,0,'Proofed','2025-08-25','Erica Williams','2025-08-25','Erica Williams',NULL,NULL,'0','Added via SMSS')
 --GO

 --Update missing LXN repro: Completed in Oysters
 --INSERT INTO [dbo].[Repro] ([OysterID],[SampleEventID],[Sex],[ReproStage],[Parasite],[BadSlide],[DataStatus],[DateEntered],[EnteredBy],[DateProofed],[ProofedBy],[DateCompleted],[CompletedBy],[Comments],[AdminNotes])
  --VALUES ('LXND2507-38','LXCOLL_20250708_1_0243_1','Z','4','No','N','Proofed','2025-08-25','Erica Williams','2025-08-25','Erica Williams',NULL,NULL,'1 = mature','Added via SMSS')
  --GO
 --INSERT INTO [dbo].[Repro] ([OysterID],[SampleEventID],[Sex],[ReproStage],[Parasite],[BadSlide],[DataStatus],[DateEntered],[EnteredBy],[DateProofed],[ProofedBy],[DateCompleted],[CompletedBy],[Comments],[AdminNotes])
  --VALUES ('LXND2507-39','LXCOLL_20250708_1_0243_1','M','2','No','N','Proofed','2025-08-25','Erica Williams','2025-08-25','Erica Williams',NULL,NULL,NULL,'Added via SMSS')
  --GO

--Cage CR 08/2025 missing SH, 09/2025 missing Z
INSERT INTO [dbo].[CageSH] ([ShellHeightID],[CageCountID],[ShellHeight],[DataStatus],[DateEntered],[EnteredBy],[DateProofed],[ProofedBy],[DateCompleted],[CompletedBy],[Comments],[AdminNotes])
VALUES ('CRCAGE_20250821_1_0232_1_R_Y_01','CRCAGE_20250821_1_0232_1_R_Y','Z','Proofed','2025-08-29','Erica Williams','2025-07-22','Erica Williams',NULL,NULL,NULL,'Added via SMSS')
 
INSERT INTO [dbo].[CageSH] (ShellHeightID, CageCountID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('CRCAGE_20250916_1_0232_1_R_B_01', 'CRCAGE_20250916_1_0232_1_R_B', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

 --SDTP LW 08/2025 - GOOD.
--  LW 09/2025 - incorrect dry filter wegiths for LWR, added ave to comments
UPDATE [dbo].[SedimentTrap] set FilterDryWeight = NULL, Comments = CONCAT(Comments, case when Comments is null then 'FilterDW incorrectly measured. Ave station filter DW = 1.676' else ', FilterDW incorrectly measured. Ave station filter DW = 1.676' end) where SampleEventID like 'LWSDTP_20250902_1_0240%'
UPDATE [dbo].[SedimentTrap] set FilterDryWeight = NULL, Comments = CONCAT(Comments, case when Comments is null then 'FilterDW incorrectly measured. Ave station filter DW = 1.699' else ', FilterDW incorrectly measured. Ave station filter DW = 1.699' end) where SampleEventID like 'LWSDTP_20250902_1_0241%'
UPDATE [dbo].[SedimentTrap] set FilterDryWeight = NULL, Comments = CONCAT(Comments, case when Comments is null then 'FilterDW incorrectly measured. Ave station filter DW = 1.600' else ', FilterDW incorrectly measured. Ave station filter DW = 1.600' end) where SampleEventID like 'LWSDTP_20250902_1_0312%'


 --RCRT 08/2025: 09/2025 DONE.
 UPDATE dbo.SampleEventWQ 
set Comments = 'WQ same as dermo',
	ProofedBy = 'Erica Williams'
where SampleEventWQID like 'CRRCRT_20250821_1_0230_1_01' 

--COLL D/R 07/2025 including extra LXN: GOOD.
--COLL dermo 08/2025 - Comment correction 
UPDATE dbo.SampleEventWQ set Comments = REPLACE(Comments, 'ccu', 'ccv') where SampleEventID like 'LXCOLL_202508%' and Comments like '%ccu%'
--COLL dermo 09/2025

-- Survey 09/2025
--Correct NumLIve
UPDATE [dbo].[SurveyQuadrat] set NumLive = 28 where QuadratID = 'CRSRVY_20250916_1_0233_1_13'
UPDATE [dbo].[SurveyQuadrat] set NumLive = 25 where QuadratID = 'CRSRVY_20250916_1_0233_1_15'
--Add missing Z SHs East Coast
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0235_1_09_001', 'LWSRVY_20250902_1_0235_1_09', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0237_1_01_001', 'LWSRVY_20250902_1_0237_1_01', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0237_1_02_001', 'LWSRVY_20250902_1_0237_1_02', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0237_1_03_001', 'LWSRVY_20250902_1_0237_1_03', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0237_1_04_001', 'LWSRVY_20250902_1_0237_1_04', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0237_1_05_001', 'LWSRVY_20250902_1_0237_1_05', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0237_1_08_001', 'LWSRVY_20250902_1_0237_1_08', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0237_1_09_001', 'LWSRVY_20250902_1_0237_1_09', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0237_1_10_001', 'LWSRVY_20250902_1_0237_1_10', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0237_1_11_001', 'LWSRVY_20250902_1_0237_1_11', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0237_1_12_001', 'LWSRVY_20250902_1_0237_1_12', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0237_1_13_001', 'LWSRVY_20250902_1_0237_1_13', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0237_1_14_001', 'LWSRVY_20250902_1_0237_1_14', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0237_1_15_001', 'LWSRVY_20250902_1_0237_1_15', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0241_1_03_001', 'LWSRVY_20250902_1_0241_1_03', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0241_1_04_001', 'LWSRVY_20250902_1_0241_1_04', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0241_1_08_001', 'LWSRVY_20250902_1_0241_1_08', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0241_1_11_001', 'LWSRVY_20250902_1_0241_1_11', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LWSRVY_20250902_1_0241_1_13_001', 'LWSRVY_20250902_1_0241_1_13', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('SLSRVY_20250903_1_0269_1_14_001', 'SLSRVY_20250903_1_0269_1_14', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('SLSRVY_20250903_1_0270_1_05_001', 'SLSRVY_20250903_1_0270_1_05', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LXSRVY_20250904_1_0247_1_07_001', 'LXSRVY_20250904_1_0247_1_07', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LXSRVY_20250904_1_0249_1_03_001', 'LXSRVY_20250904_1_0249_1_03', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LXSRVY_20250904_1_0249_1_04_001', 'LXSRVY_20250904_1_0249_1_04', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LXSRVY_20250904_1_0249_1_07_001', 'LXSRVY_20250904_1_0249_1_07', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 

INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES ('LXSRVY_20250904_1_0249_1_15_001', 'LXSRVY_20250904_1_0249_1_15', NULL, 'Proofed', '2025-09-22 00:00:00', 'Erica Williams', '2025-09-22 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL) 


EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-07-01', @CheckEnd = '2025-09-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-08-01', @CheckEnd = '2025-09-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-08-01', @CheckEnd = '2025-09-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2025-08-01', @CheckEnd = '2025-09-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-08-01', @CheckEnd = '2025-09-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-08-01', @CheckEnd = '2025-09-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-08-01', @CheckEnd = '2025-09-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-08-01', @CheckEnd = '2025-09-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-07-01', @CheckEnd = '2025-07-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-07-01', @CheckEnd = '2025-07-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-07-01', @CheckEnd = '2025-07-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2025-09-01', @CheckEnd = '2025-09-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2025-09-01', @CheckEnd = '2025-09-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2025-09-01', @CheckEnd = '2025-09-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2025-09-01', @CheckEnd = '2025-09-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';