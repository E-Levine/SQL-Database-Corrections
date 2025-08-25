--St Pete corrections
--August 2025
use Oysters
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