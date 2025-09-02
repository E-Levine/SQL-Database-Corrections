--St Pete corrections
--August 2025
use [Oysters_25-08-29]
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

--Cage CR 08/2025 missing SH
INSERT INTO [dbo].[CageSH] ([ShellHeightID],[CageCountID],[ShellHeight],[DataStatus],[DateEntered],[EnteredBy],[DateProofed],[ProofedBy],[DateCompleted],[CompletedBy],[Comments],[AdminNotes])
VALUES ('CRCAGE_20250821_1_0232_1_R_Y_01','CRCAGE_20250821_1_0232_1_R_Y','Z','Proofed','2025-08-29','Erica Williams','2025-07-22','Erica Williams',NULL,NULL,NULL,'Added via SMSS')
 GO

 --SDTP LW 08/2025 - GOOD.

 --RCRT 08/2025:
 UPDATE dbo.SampleEventWQ 
set Comments = 'WQ same as dermo',
	ProofedBy = 'Erica Williams'
where SampleEventWQID like 'CRRCRT_20250821_1_0230_1_01' 

--COLL D/R 07/2025 including extra LXN: GOOD.
--COLL dermo 08/2025 - Comment correction 
UPDATE dbo.SampleEventWQ set Comments = REPLACE(Comments, 'ccu', 'ccv') where SampleEventID like 'LXCOLL_202508%' and Comments like '%ccu%'

EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-07-01', @CheckEnd = '2025-08-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-08-01', @CheckEnd = '2025-08-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-08-01', @CheckEnd = '2025-08-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2025-08-01', @CheckEnd = '2025-08-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-08-01', @CheckEnd = '2025-08-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-08-01', @CheckEnd = '2025-08-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-08-01', @CheckEnd = '2025-08-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-08-01', @CheckEnd = '2025-08-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-07-01', @CheckEnd = '2025-07-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-07-01', @CheckEnd = '2025-07-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-07-01', @CheckEnd = '2025-07-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';