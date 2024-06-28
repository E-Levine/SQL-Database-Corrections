---Database corrections St Pete 2023/12/27 - E Levine - COMPLETED 2023/01/05
Use OystersEL_231227
go

---CR RCRT updates
  --Remove incorrect TripIDs
DELETE FROM [dbo].[TripInfo]
WHERE [TripID] like 'CRRCRT_20230913%' or [TripID] like 'CRRCRT_20230621%'

--Update 2023/02/14 Trip IDs in SampleEvent
UPDATE [dbo].[SampleEvent] 
SET [TripID] = REPLACE ([TripID], 'CRRCRT_20230413_1','CRRCRT_20230214_1') 
WHERE [SampleEventID] like 'CRRCRT_20230214_1_%'

--Update 2023/05/09 0230 SampleEventWQ to proofed
UPDATE [dbo].[SampleEventWQ] 
SET [DataStatus] = 'Proofed', [DateProofed] = '2023-12-01 00:00:00', [ProofedBy] = 'Erica Levine'
WHERE [SampleEventID] like 'CRRCRT_20230509_1_0230%'

  --Update 20230613 WQ comment
UPDATE [dbo].[SampleEventWQ] 
SET [Comments] = 'Same as dermo WQ'
WHERE [SampleEventWQID] like 'CRRCRT_20230613_1_0232_1_01%'

--Update 2023/01/10 Rcrt data comments to identify retrevial after hurricane Ian
UPDATE [dbo].[SampleEvent] 
SET [Comments] = 'Retrieval after hurricane Ian' 
WHERE [TripID] like 'CRRCRT_20230110%'

UPDATE [dbo].[Recruitment] 
SET [Comments] = 'Retrieval after hurricane Ian'
where [SampleEventID] like 'CRRCRT_20230110%'
---End of CR RCRT Jan 2023 - Nov 2023 data checks. With corrections above, data is complete.
  
---SL RCRT updates
--Update 2023/03/08 WQ comment
UPDATE [dbo].[SampleEventWQ] 
SET [Comments] = 'Same as dermo WQ'
WHERE [SampleEventWQID] like 'SLRCRT_20230308_1_0269%' or [SampleEventWQID] like 'SLRCRT_20230308_1_0256%' or [SampleEventWQID] like 'SLRCRT_20230308_1_0257%' or [SampleEventWQID] like 'SLRCRT_20230308_1_0271%'
---End of SL RCRT Jan 2023 - Nov 2023 data checks. With corrections above, data is complete.

--LX RCRT Updates
--Remove 02/07/2023 extra data entered under LW 
DELETE FROM [dbo].[SampleEvent]
WHERE ([TripID] like 'LXRCRT_202302%') and ([FixedLocationID] = '0235' or [FixedLocationID] = '0236' or [FixedLocationID] = '0237' or [FixedLocationID] = '0240' or [FixedLocationID] = '0241' or [FixedLocationID] = '0312')
DELETE FROM [dbo].[SampleEventWQ]
WHERE [SampleEventID] like 'LXRCRT_20230207_1_0235_1' or [SampleEventID] like 'LXRCRT_20230207_1_0236_1' or [SampleEventID] like 'LXRCRT_20230207_1_0237_1' or [SampleEventID] like 'LXRCRT_20230207_1_0240_1' or [SampleEventID] like 'LXRCRT_20230207_1_0241_1' or [SampleEventID] like 'LXRCRT_20230207_1_0312_1'
--Correct TripID to 02/07/2023 instead of 10/2023
UPDATE [dbo].[SampleEvent]
SET [TripID] = 'LXRCRT_20230207_1'
WHERE [SampleEventID] like 'LXRCRT_202302%' and [TripID] like 'LXRCRT_202310%'
--Correct commment 
UPDATE [dbo].[SampleEventWQ] 
SET [Comments] = 'Same as dermo WQ'
WHERE [SampleEventWQID] like 'LXRCRT_20230606_1_0249%'
---End of LX RCRT Jan 2023 - Nov 2023 data checks. With corrections above, data is complete.

--LW RCRT updates
--Remove 06/08/2023 data (incorrect date)
DELETE FROM [dbo].[TripInfo]
WHERE [TripID] like 'LWRCRT_20230608%' 
DELETE FROM [dbo].[SampleEvent]
WHERE [SampleEventID] like 'LWRCRT_20230608%'
DELETE FROM [dbo].[SampleEventWQ]
WHERE [SampleEventID] like 'LWRCRT_20230608%'
DELETE FROM [dbo].[Recruitment]
WHERE [SampleEventID] like 'LWRCRT_20230608%'
---End of LW RCRT Jan 2023 - Nov 2023 data checks. With corrections above, data is complete.

--TB RCRT Updates
--WQ data missing from trips. Add additional data as local database for join. Name database SPDecMissing for use in following code.
--UPDATE [dbo].[SampleEventWQ]
--SET [SampleEventWQ].Temperature = (SELECT[2023_12_MissingTBRCRTData].Temperature FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID),
--[SampleEventWQ].Salinity = (SELECT[2023_12_MissingTBRCRTData].Salinity FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID),
--[SampleEventWQ].DissolvedOxygen = (SELECT [2023_12_MissingTBRCRTData].DissolvedOxygen FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID),
--[SampleEventWQ].pH = (SELECT [2023_12_MissingTBRCRTData].pH FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID),
--[SampleEventWQ].Depth = (SELECT [2023_12_MissingTBRCRTData].Depth FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID),
--[SampleEventWQ].SampleDepth = (SELECT [2023_12_MissingTBRCRTData].SampleDepth FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID),
--[SampleEventWQ].Secchi = (SELECT [2023_12_MissingTBRCRTData].Secchi FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID),
--[SampleEventWQ].TurbidityYSI = (SELECT [2023_12_MissingTBRCRTData].TurbidityYSI FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID),
--[SampleEventWQ].TurbidityHach = (SELECT [2023_12_MissingTBRCRTData].TurbidityHach FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID),
--[SampleEventWQ].CollectionTime = (SELECT [2023_12_MissingTBRCRTData].CollectionTime FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID),
--[SampleEventWQ].PercentDissolvedOxygen = (SELECT [2023_12_MissingTBRCRTData].PercentDissolvedOxygen FROM [SPDecMissing].[dbo].[2023_12_MissingTBRCRTData] WHERE [2023_12_MissingTBRCRTData].SampleEventWQID = [SampleEventWQ].SampleEventWQID)
--WHERE [SampleEventWQ].SampleEventID like 'TBRCRT_202305%' or [SampleEventWQ].SampleEventID like 'TBRCRT_202306%' or [SampleEventWQ].SampleEventID like 'TBRCRT_202307%' or [SampleEventWQ].SampleEventID like 'TBRCRT_202308%';
--Add in the missing SampleEventWQs manually since we don't have db creation permissions
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230518_1_0278_1_01'
           ,'TBRCRT_20230518_1_0278_1'
           ,'28.4'
           ,'36.53'
           ,'5.72'
           ,'7.96'
           ,'0.6'
           ,'1.38'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'932')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230518_1_0277_1_01'
           ,'TBRCRT_20230518_1_0277_1'
           ,'29.6'
           ,'37.59'
           ,'6.9'
           ,'7.99'
           ,'0.7'
           ,'1.91'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1059')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230518_1_0291_1_01'
           ,'TBRCRT_20230518_1_0291_1'
           ,'28.3'
           ,'31.98'
           ,'4.13'
           ,'7.62'
           ,'0.4'
           ,'2.65'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'827')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230518_1_0527_1_01'
           ,'TBRCRT_20230518_1_0527_1'
           ,'29'
           ,'36.91'
           ,'6.55'
           ,'8.18'
           ,'0.8'
           ,'1.53'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1011')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230518_1_0528_1_01'
           ,'TBRCRT_20230518_1_0528_1'
           ,'30.9'
           ,'31.23'
           ,'6.46'
           ,'7.73'
           ,'0.9'
           ,'1.57'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1304')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230518_1_0529_1_01'
           ,'TBRCRT_20230518_1_0529_1'
           ,'29.8'
           ,'33.65'
           ,'5.87'
           ,'7.73'
           ,'2.5'
           ,'1.74'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1333')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230518_1_0529_1_02'
           ,'TBRCRT_20230518_1_0529_1'
           ,'29.8'
           ,'33.64'
           ,'5.9'
           ,'7.71'
           ,'2.5'
           ,'1.86'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1333')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230626_1_0278_1_01'
           ,'TBRCRT_20230626_1_0278_1'
           ,'30.2'
           ,'36.68'
           ,'5.83'
           ,'7.89'
           ,'0.6'
           ,'1.66'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'934')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230626_1_0277_1_01'
           ,'TBRCRT_20230626_1_0277_1'
           ,'31.3'
           ,'35.08'
           ,'5.68'
           ,'7.86'
           ,'0.5'
           ,'8.39'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1116')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230626_1_0291_1_01'
           ,'TBRCRT_20230626_1_0291_1'
           ,'29.8'
           ,'31.44'
           ,'4.4'
           ,'7.64'
           ,'0.9'
           ,'0.57'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'805')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230626_1_0527_1_01'
           ,'TBRCRT_20230626_1_0527_1'
           ,'30.5'
           ,'37.3'
           ,'6.52'
           ,'8.14'
           ,'0.9'
           ,'2.05'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1021')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230626_1_0528_1_01'
           ,'TBRCRT_20230626_1_0528_1'
           ,'31.9'
           ,'17.37'
           ,'5.11'
           ,'7.51'
           ,'0.5'
           ,'2.88'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1330')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230626_1_0529_1_01'
           ,'TBRCRT_20230626_1_0529_1'
           ,'32.5'
           ,'22.76'
           ,'5.11'
           ,'7.55'
           ,'2.7'
           ,'1.57'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1425')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230626_1_0529_1_02'
           ,'TBRCRT_20230626_1_0529_1'
           ,'32.4'
           ,'23.4'
           ,'5.48'
           ,'7.57'
           ,'2.7'
           ,'1.29'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1425')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230718_1_0278_1_01'
           ,'TBRCRT_20230718_1_0278_1'
           ,'30.9'
           ,'36.01'
           ,'5.07'
           ,'7.94'
           ,'0.7'
           ,'0.66'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1129')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230718_1_0277_1_01'
           ,'TBRCRT_20230718_1_0277_1'
           ,'32.3'
           ,'36.52'
           ,'6.02'
           ,'8.03'
           ,'0.8'
           ,'1.46'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1224')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230718_1_0291_1_01'
           ,'TBRCRT_20230718_1_0291_1'
           ,'30'
           ,'30.48'
           ,'2.26'
           ,'7.49'
           ,'0.9'
           ,'0.76'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'805')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230718_1_0527_1_01'
           ,'TBRCRT_20230718_1_0527_1'
           ,'31.5'
           ,'37.49'
           ,'6.28'
           ,'8.14'
           ,'0.9'
           ,'1.27'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1148')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230718_1_0528_1_01'
           ,'TBRCRT_20230718_1_0528_1'
           ,'32.2'
           ,'25.29'
           ,'5.7'
           ,'7.78'
           ,'0.9'
           ,'0.58'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1401')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230718_1_0529_1_01'
           ,'TBRCRT_20230718_1_0529_1'
           ,'32.7'
           ,'29.09'
           ,'6.19'
           ,'7.93'
           ,'2.9'
           ,'0.15'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1430')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230718_1_0529_1_02'
           ,'TBRCRT_20230718_1_0529_1'
           ,'32.3'
           ,'29.25'
           ,'6.08'
           ,'7.91'
           ,'2.9'
           ,'9.9'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1430')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230815_1_0278_1_01'
           ,'TBRCRT_20230815_1_0278_1'
           ,'31'
           ,'35.43'
           ,'4.65'
           ,'8'
           ,'0.7'
           ,'6.32'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'911')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230815_1_0277_1_01'
           ,'TBRCRT_20230815_1_0277_1'
           ,'32.6'
           ,'36.69'
           ,'4.22'
           ,'7.98'
           ,'0.8'
           ,'6.47'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1014')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230815_1_0291_1_01'
           ,'TBRCRT_20230815_1_0291_1'
           ,'30.8'
           ,'30.03'
           ,'2.08'
           ,'7.51'
           ,'0.7'
           ,'0.93'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'807')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230815_1_0527_1_01'
           ,'TBRCRT_20230815_1_0527_1'
           ,'31.6'
           ,'36.96'
           ,'5.49'
           ,'8.15'
           ,'0.9'
           ,'3.82'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'937')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230815_1_0528_1_01'
           ,'TBRCRT_20230815_1_0528_1'
           ,'32'
           ,'26.04'
           ,'5.44'
           ,'7.7'
           ,'0.9'
           ,'5.5'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1224')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230815_1_0529_1_01'
           ,'TBRCRT_20230815_1_0529_1'
           ,'32.6'
           ,'29.75'
           ,'5.55'
           ,'7.78'
           ,'2.9'
           ,'1.68'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1255')
GO
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[CollectionTime])
     VALUES
           ('TBRCRT_20230815_1_0529_1_02'
           ,'TBRCRT_20230815_1_0529_1'
           ,'32.3'
           ,'30.23'
           ,'4.99'
           ,'7.74'
           ,'2.9'
           ,'2.67'
           ,'Proofed'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'2024-01-04 15:37:21.865'
           ,'Erica Levine'
           ,'1255')
GO

--Update Comments for corrected data.
UPDATE [dbo].[SampleEventWQ]
SET Comments = NULL
WHERE SampleEventID like 'TBRCRT_202305%' or SampleEventID like 'TBRCRT_202306%' or SampleEventID like 'TBRCRT_202307%' or SampleEventID like 'TBRCRT_202308%'
--Confirm dates and days deployed
UPDATE [dbo].[Recruitment]
SET Comments = 'Dates and days deployed correct'
WHERE SampleEventID like 'TBRCRT_20230227%' or SampleEventID like 'TBRCRT_20230626%' 
--Update missing comment for shell order
UPDATE [dbo].[Recruitment]
SET Comments = 'Shell broke in field, mixed up shell order'
WHERE SampleEventID like 'TBRCRT_20230227_1_0527%' and ShellReplicate = 2 and ShellPosition < 7
--Confirm WQ data
UPDATE [dbo].[SampleEventWQ]
SET Comments = 'pH value okay'
WHERE SampleEventID like 'TBRCRT_20231017_1_0291%' or SampleEventID like 'TBRCRT_20231117_1_0529%'
UPDATE [dbo].[SampleEventWQ]
SET Comments = 'YSI turbidity okay'
WHERE SampleEventID like 'TBRCRT_20230118_1_027%' or SampleEventID like 'TBRCRT_20231118_1_0528%'
UPDATE [dbo].[SampleEventWQ]
SET Comments = 'DO value okay'
WHERE SampleEventID like 'TBRCRT_20230815_1_0291%' or SampleEventID like 'TBRCRT_20230718_1_0291%'
---End of TB RCRT Jan 2023 - Nov 2023 data checks. With corrections above, data is complete.


IF OBJECT_ID('tempdb..#ValidTrips') IS NOT NULL BEGIN DROP TABLE #ValidTrips; END
CREATE TABLE #ValidTrips ( TripID VARCHAR(50) );
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2023-11-30' AND DataStatus = 'Proofed' AND TripID like 'CRRCRT%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2023-11-30' AND DataStatus = 'Proofed' AND TripID like 'SLRCRT%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2023-11-30' AND DataStatus = 'Proofed' AND TripID like 'LXRCRT%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2023-11-30' AND DataStatus = 'Proofed' AND TripID like 'LWRCRT%';
INSERT INTO #ValidTrips (TripID) SELECT TripID FROM TripInfo WHERE TripDate > '2023-01-01' AND TripDate < '2023-11-30' AND DataStatus = 'Proofed' AND TripID like 'TBRCRT%';
UPDATE TripInfo SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '27-December-2023' WHERE TripID IN (SELECT TripID FROM #ValidTrips);
UPDATE SampleEvent SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '27.December.2023' WHERE TripID IN (SELECT TripID FROM #ValidTrips);
UPDATE SampleEventWQ SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '27-December-2023' WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));
UPDATE Recruitment SET DataStatus = 'Completed', CompletedBy = 'Erica Levine', DateCompleted = '27-December-2023' WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));
INSERT INTO hsdb.TripInfo SELECT * FROM TripInfo WHERE DataStatus = 'Completed';
DELETE FROM dbo.TripInfo WHERE DataStatus = 'Completed';
INSERT INTO hsdb.SampleEvent 
(SampleEventID,TripID,FixedLocationID,LatitudeDec,LongitudeDec,LatDec,LatMin,LongDec,LongMin,NumDrills,HarvestStatus,DataStatus,DateEntered,EnteredBy,DateProofed,ProofedBy,DateCompleted, CompletedBy,Comments,AdminNotes) 
SELECT SampleEventID,TripID,FixedLocationID,LatitudeDec,LongitudeDec,LatDec,LatMin,LongDec,LongMin,NumDrills,HarvestStatus,DataStatus,DateEntered,EnteredBy,DateProofed,ProofedBy,DateCompleted, CompletedBy,Comments,AdminNotes 
FROM SampleEvent WHERE DataStatus = 'Completed';
DELETE FROM dbo.SampleEvent WHERE DataStatus = 'Completed';
INSERT INTO hsdb.SampleEventWQ SELECT * FROM SampleEventWQ WHERE DataStatus = 'Completed';
DELETE FROM dbo.SampleEventWQ WHERE DataStatus = 'Completed';
INSERT INTO hsdb.Recruitment SELECT * FROM Recruitment WHERE DataStatus = 'Completed';
DELETE FROM dbo.Recruitment WHERE DataStatus = 'Completed';
