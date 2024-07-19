use [Oysters_24-07-19]
go

--CAGE checks
--CR  04-06/2024
DELETE FROM [dbo].[SampleEventWQ] where [SampleEventWQID] like 'CRCAGE_20240516_1_0231_1_01' and DateEntered = '2024-06-11 00:00:00'
DELETE FROM [dbo].[SampleEventWQ] where [SampleEventWQID] like 'CRCAGE_20240516_1_0232_1_01' and DateEntered = '2024-06-11 00:00:00'
UPDATE [dbo].[SampleEventWQ] 
set [DataStatus] = 'Proofed',
	[DateProofed] = '2024-07-10 00:00:00',
	[ProofedBy] = 'Erica Levine'
where [SampleEventWQID] like 'CRCAGE_20240516_1_0231_1_01' or [SampleEventWQID] like 'CRCAGE_20240516_1_0232_1_01'
UPDATE [dbo].[CageCount]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Red flipped' else ', Red flipped' end)
where [SampleEventID] like 'CRCAGE_20240408_1_0232_1'
UPDATE [dbo].[CageCount]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Yellow flipped' else ', Yellow flipped' end)
where [SampleEventID] like 'CRCAGE_20240408_1_0232_1'
--SL 04-06/2024
UPDATE [dbo].[SampleEventWQ]
set [DataStatus] = 'Proofed',
	[DateProofed] = '2024-07-10 00:00:00',
	[ProofedBy] = 'Erica Levine'
where [SampleEventWQID] like 'SLCAGE_20240604_1_0255_1_01'
DELETE FROM [dbo].[TripInfo] where [TripID] like 'SLCAGE_20240603_1' 
DELETE FROM [dbo].[SampleEventWQ] where [SampleEventWQID] like 'SLCAGE_20240604_1_0255_1_01' and DateEntered = '2024-06-11 00:00:00'
--LX 04-06/2024
DELETE FROM [dbo].[SampleEventWQ] where [SampleEventWQID] like 'LXCAGE_20240506_1_0243_1_01' and DateEntered = '2024-06-11 00:00:00'
UPDATE [dbo].[SampleEventWQ]
set [DataStatus] = 'Proofed',
	[DateProofed] = '2024-07-10 00:00:00',
	[ProofedBy] = 'Erica Levine'
where [SampleEventWQID] like 'LXCAGE_20240506_1_0243_1_01'

--Add missing DOPct to Column
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 104.0 where [SampleEventWQID] like 'LWCOLL_20240506_1_0235_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 104.1 where [SampleEventWQID] like 'LWCOLL_20240506_1_0236_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 106.3 where [SampleEventWQID] like 'LWCOLL_20240506_1_0237_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 101.9 where [SampleEventWQID] like 'LWCOLL_20240506_1_0240_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 100.8 where [SampleEventWQID] like 'LWCOLL_20240506_1_0241_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 108.0 where [SampleEventWQID] like 'LWCOLL_20240506_1_0312_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 107.8 where [SampleEventWQID] like 'LXCOLL_20240506_1_0242_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 101.0 where [SampleEventWQID] like 'LXCOLL_20240506_1_0243_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 124.5 where [SampleEventWQID] like 'LXCOLL_20240506_1_0246_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 127.9 where [SampleEventWQID] like 'LXCOLL_20240506_1_0247_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 125.0 where [SampleEventWQID] like 'LXCOLL_20240506_1_0249_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 106.8 where [SampleEventWQID] like 'CRCOLL_20240408_1_0230_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 108.0 where [SampleEventWQID] like 'CRCOLL_20240408_1_0232_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 102.8 where [SampleEventWQID] like 'CRCOLL_20240408_1_0233_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 102.1 where [SampleEventWQID] like 'LWCOLL_20240409_1_0237_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 102 where [SampleEventWQID] like 'LWCOLL_20240409_1_0312_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 102.6 where [SampleEventWQID] like 'LXCOLL_20240409_1_0243_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 107.3 where [SampleEventWQID] like 'LXCOLL_20240409_1_0246_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 124.0 where [SampleEventWQID] like 'LXCOLL_20240409_1_0247_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 108.2 where [SampleEventWQID] like 'LXCOLL_20240409_1_0249_1_01'


EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-04-01', @CheckEnd = '2024-06-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-04-01', @CheckEnd = '2024-06-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-04-01', @CheckEnd = '2024-06-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';