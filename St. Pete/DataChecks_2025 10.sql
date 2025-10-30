use [Oysters] --COMPLETED 30/10/25
go

--Run TB_SRVY_SrvySH_202509 & LX_Repro_Repro_2025_09 upload files!!

--LXN 08/2025 extra samples: - Completed on Oysters
--update dbo.Dermo set ShellLength = '26.14' where OysterID like 'LXND2508-18' 
--update dbo.Dermo set DataStatus = 'Proofed', ProofedBy = 'Erica Williams', DateProofed = '2025-10-10' where OysterID like 'LXND2508%' and DermoMantle is NULL

--upadte LXN extra samples comments -Completed on Oysters
--UPDATE hsdb.Repro set Comments = '0=immature' where OysterID like 'LXND2504-25'
--UPDATE hsdb.Repro set Comments = '1=mature' where OysterID like 'LXND2504-41'
--UPDATE hsdb.Repro set Comments = '1=mature' where OysterID like 'LXND2506-38'


--  LW 09/2025 - incorrect dry filter weights for LWR, updated ave in comments -Completed in Oysters
--UPDATE [hsdb].[SedimentTrap] set Comments = REPLACE(Comments, 'DW = 1.676', 'DW = 3.27') where SampleEventID like 'LWSDTP_20250902_1_0240%'
--UPDATE [hsdb].[SedimentTrap] set Comments = REPLACE(Comments, 'DW = 1.699','DW = 3.23') where SampleEventID like 'LWSDTP_20250902_1_0241%'
--UPDATE [hsdb].[SedimentTrap] set Comments = REPLACE(Comments, 'DW = 1.600', 'DW = 3.22') where SampleEventID like 'LWSDTP_20250902_1_0312%'

-- Dermo/Repro data
-- 2016-2022: LX, SL
-- 2016-2021: CR
-- 2022/09 CR:
DELETE from hsdb.TripInfo where TripID like 'CRCOLL_202209%' 
UPDATE dbo.TripInfo set DataStatus = 'Proofed', DateProofed = '2025-10-21 00:00:00.0000000', ProofedBy = 'Erica Willams' where TripID like 'CRCOLL_202209%'

UPDATE hsdb.SampleEvent set 
	DataStatus = 'Completed', DateProofed = '2025-10-21 00:00:00.0000000', ProofedBy = 'Erica Willams',  
	DateCompleted = '2025-10-21 00:00:00.0000000', CompletedBy = 'Erica Willams'
where TripID like 'CRCOLL_202209%' 

DELETE from dbo.SampleEventWQ where SampleEventID like 'CRCOLL_202209%' --incorrect data
INSERT INTO [hsdb].[SampleEventWQ]
    ([SampleEventWQID],[SampleEventID],[Temperature],[Salinity],[DissolvedOxygen],[pH],[Depth],[SampleDepth],[Secchi],[TurbidityYSI],[TurbidityHach],[DataStatus],[DateEntered],[EnteredBy],[DateProofed],[ProofedBy],[DateCompleted],[CompletedBy],[Comments],[AdminNotes],[CollectionTime],[PercentDissolvedOxygen],[YSICalibration],[YSINotes])
  VALUES
      ('CRCOLL_20220913_1_0230_1_01','CRCOLL_20220913_1_0230_1','30.7','8.02','6.38','7.81','0.6','0.6','0.6','0.77','2.28','Proofed','2025-10-21 00:00:00.000000','Erica Williams','2025-10-21','Erica Williams',NULL,NULL,NULL,NULL,'1040','89.3',NULL,NULL)
 GO
INSERT INTO [hsdb].[SampleEventWQ]
    ([SampleEventWQID],[SampleEventID],[Temperature],[Salinity],[DissolvedOxygen],[pH],[Depth],[SampleDepth],[Secchi],[TurbidityYSI],[TurbidityHach],[DataStatus],[DateEntered],[EnteredBy],[DateProofed],[ProofedBy],[DateCompleted],[CompletedBy],[Comments],[AdminNotes],[CollectionTime],[PercentDissolvedOxygen],[YSICalibration],[YSINotes])
  VALUES
      ('CRCOLL_20220913_1_0231_1_01','CRCOLL_20220913_1_0231_1','31.1','10.7','4.64','7.56','0.55','0.55','0.55','1.55','5.22','Proofed','2025-10-21 00:00:00.000000','Erica Williams','2025-10-21','Erica Williams',NULL,NULL,NULL,NULL,'1111','66.4',NULL,NULL)
	  GO
INSERT INTO [hsdb].[SampleEventWQ]
     ([SampleEventWQID],[SampleEventID],[Temperature],[Salinity],[DissolvedOxygen],[pH],[Depth],[SampleDepth],[Secchi],[TurbidityYSI],[TurbidityHach],[DataStatus],[DateEntered],[EnteredBy],[DateProofed],[ProofedBy],[DateCompleted],[CompletedBy],[Comments],[AdminNotes],[CollectionTime],[PercentDissolvedOxygen],[YSICalibration],[YSINotes])
 VALUES
      ('CRCOLL_20220913_1_0232_1_01','CRCOLL_20220913_1_0232_1','31.2' ,'15.96','6.15' ,'7.84','0.5','0.5','0.5','2.6','6.08','Proofed','2025-10-21 00:00:00.000000','Erica Williams','2025-10-21','Erica Williams',NULL,NULL,NULL,NULL,'1211','90.5',NULL,NULL)
 GO
INSERT INTO [hsdb].[SampleEventWQ]
    ([SampleEventWQID],[SampleEventID],[Temperature],[Salinity],[DissolvedOxygen],[pH],[Depth],[SampleDepth],[Secchi],[TurbidityYSI],[TurbidityHach],[DataStatus],[DateEntered],[EnteredBy],[DateProofed],[ProofedBy],[DateCompleted],[CompletedBy],[Comments],[AdminNotes],[CollectionTime],[PercentDissolvedOxygen],[YSICalibration],[YSINotes])
  VALUES
      ('CRCOLL_20220913_1_0233_1_01','CRCOLL_20220913_1_0233_1','31.7','20.66','7.34','7.96','0.75','0.75','0.75' ,'6.61','6.53','Proofed','2025-10-21 00:00:00.000000','Erica Williams','2025-10-21','Erica Williams',NULL,NULL,NULL,NULL ,'1314','111.8',NULL,NULL)
 GO

DELETE from Dermo where SampleEventID like 'CRCOLL_202209%' 
UPDATE hsdb.Dermo set 
	DataStatus = 'Completed', DateProofed = '2025-10-21 00:00:00.0000000', ProofedBy = 'Erica Willams',  
	DateCompleted = '2025-10-21 00:00:00.0000000', CompletedBy = 'Erica Willams' where SampleEventID like 'CRCOLL_202209%'

DELETE from Repro where SampleEventID like 'CRCOLL_202209%'
UPDATE hsdb.Repro set 
	DataStatus = 'Completed', DateProofed = '2025-10-21 00:00:00.0000000', ProofedBy = 'Erica Willams',  
	DateCompleted = '2025-10-21 00:00:00.0000000', CompletedBy = 'Erica Willams'
	where SampleEventID like 'CRCOLL_202209%' 

-- Oct CAGE, RCRT (-TB) data - GOOD
--TB RCRT 2025-07,08,09
DELETE from SampleEvent where SampleEventID = 'TBRCRT_20250923_1_0277_1' or SampleEventID = 'TBRCRT_20250923_1_0278_1'
UPDATE SampleEventWQ set DataStatus = 'Proofed', ProofedBy = 'Lily Harmon', DateProofed = '2025-09-22 00:00:00.0000000' where SampleEventWQID = 'TBRCRT_20250728_1_0278_1_01'
DELETE from SampleEventWQ where SampleEventWQID = 'TBRCRT_20250923_1_0277_1_01' or SampleEventWQID = 'TBRCRT_20250923_1_0278_1_01'
UPDATE Recruitment set DataStatus = 'Proofed', ProofedBy = 'Lily Harmon', DateProofed = '2025-09-22 00:00:00.0000000' where SampleEventID = 'TBRCRT_20250728_1_0278_1'
DELETE from SampleEvent where SampleEventID = 'TBSRVY_20250924_1_0291_1' or SampleEventID = 'TBSRVY_20250924_1_0528_1' or  SampleEventID = 'TBSRVY_20250924_1_0529_1'
DELETE from SampleEventWQ where SampleEventWQID = 'TBSRVY_20250924_1_0291_1_01' or SampleEventWQID = 'TBSRVY_20250924_1_0528_1_01' or  SampleEventWQID = 'TBSRVY_20250924_1_0529_1_01'
UPDATE SurveyQuadrat set Comments = 'Volumetrics not recorded' where SampleEventID = 'TBSRVY_20250924_1_0280_1' or SampleEventID = 'TBSRVY_20250924_1_0282_1'

--TB COLL 2025/06, 2025/09 -- GOOD

-- COLL 10/2025 -- CERP -- GOOD
-- Completed CERP COLL 08-09/2025

-- TB RCRT 10/2025 - GOOD

--LW SDTP 10/2025
UPDATE SampleEventWQ set Comments = 'WQ same as dermo' where SampleEventWQID = 'LWSDTP_20251007_1_0235_1_01'

DELETE from TripInfo where TripID = 'LWCAGE_20250902_1'

--Update cage comments for SLC
UPDATE SampleEvent set Comments = 'Oysters from SLC1, cages at SCL2' where SampleEventID like 'SLCAGE%'
UPDATE hsdb.SampleEvent set Comments = 'Oysters from SLC1, cages at SCL2' where SampleEventID like 'SLCAGE_2024%' or SampleEventID like 'SLCAGE_2025%' 

EXECUTE [dbo].[spChecksCollections] @CheckStart = '2016-01-01', @CheckEnd = '2022-12-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2016-01-01', @CheckEnd = '2022-12-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2016-01-01', @CheckEnd = '2022-12-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-10-01', @CheckEnd = '2025-10-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-10-01', @CheckEnd = '2025-10-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-10-01', @CheckEnd = '2025-10-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-10-01', @CheckEnd = '2025-10-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-10-01', @CheckEnd = '2025-10-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-10-01', @CheckEnd = '2025-10-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-10-01', @CheckEnd = '2025-10-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-07-01', @CheckEnd = '2025-09-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2025-09-01', @CheckEnd = '2025-09-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-06-01', @CheckEnd = '2025-06-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-09-01', @CheckEnd = '2025-09-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-08-01', @CheckEnd = '2025-09-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-08-01', @CheckEnd = '2025-09-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-08-01', @CheckEnd = '2025-09-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-10-01', @CheckEnd = '2025-10-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2025-10-01', @CheckEnd = '2025-10-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';