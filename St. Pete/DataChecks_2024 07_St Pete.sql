use [Oysters_24-08-01]
go

--CAGE checks
--CR  04-07/2024
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
--SL 04-07/2024
UPDATE [dbo].[SampleEventWQ]
set [DataStatus] = 'Proofed',
	[DateProofed] = '2024-07-10 00:00:00',
	[ProofedBy] = 'Erica Levine'
where [SampleEventWQID] like 'SLCAGE_20240604_1_0255_1_01'
DELETE FROM [dbo].[TripInfo] where [TripID] like 'SLCAGE_20240603_1' 
DELETE FROM [dbo].[SampleEventWQ] where [SampleEventWQID] like 'SLCAGE_20240604_1_0255_1_01' and DateEntered = '2024-06-11 00:00:00'
--LX 04-07/2024
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

--RCRT 07/2024: LW, LX, SL, CR
--SDTP 07/2024: LW
--Dermo 07/2024:
--SL
UPDATE [dbo].[SampleEventWQ] set Secchi = 0.50 where [SampleEventID] like 'SLCOLL_20240710_1_0255_1'
UPDATE [dbo].[Dermo]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data as recorded on datasheet' else ' Data as recorded on datasheet' end)
where [OysterID] like 'LWLD2407-15' or [OysterID] like 'LWRD2407-13%' or [OysterID] like 'LWRD2407-14%' or [OysterID] like 'LWRD2407-15%' or [OysterID] like 'LWLD2407-01%' or [OysterID] like 'LWRD2407-04%'

--TB SRVY 06/2024
UPDATE [dbo].[SampleEventWQ]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data confirmed' else ' Data confirmed' end)
where [SampleEventWQID] like 'TBSRVY_20240624_1_T039_1_01' or [SampleEventWQID] like 'TBSRVY_20240624_1_T045_1_01%'
UPDATE [dbo].[SurveyQuadrat]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data confirmed' else ', Data confirmed' end)
where [QuadratID] like 'TBSRVY_20240624_1_0291_1_02'
DELETE FROM [dbo].[TripInfo] where [TripID] like 'TBSRVY_20240626_2'
UPDATE [dbo].[SampleEvent] set TripID = 'TBSRVY_20240626_1' where TripID like 'TBSRVY_202406%' and FixedLocationID like 'T%'
UPDATE [dbo].[SampleEvent] set SampleEventID = REPLACE(SampleEventID, '_2_', '_1_') where TripID like 'TBSRVY_202406%' and FixedLocationID like 'T%'
UPDATE [dbo].[SampleEvent] set SampleEventID = REPLACE(SampleEventID, '20240624', '20240626') where SampleEventID like 'TBSRVY_20240624%' and FixedLocationID like 'T%'
UPDATE [dbo].[SampleEventWQ] set SampleEventWQID = REPLACE(SampleEventWQID, '20240624', '20240626') where SampleEventID like 'TBSRVY_20240624_1_T%' 
UPDATE [dbo].[SampleEventWQ] set SampleEventID = REPLACE(SampleEventID, '20240624', '20240626') where SampleEventID like 'TBSRVY_20240624_1_T%' 
UPDATE [dbo].[SampleEventWQ] set SampleEventWQID = REPLACE(SampleEventWQID, '_2_', '_1_') where SampleEventID like 'TBSRVY_20240626_2_T%' 
UPDATE [dbo].[SampleEventWQ] set SampleEventID = REPLACE(SampleEventID, '_2_', '_1_') where SampleEventID like 'TBSRVY_20240626_2_T%' 
UPDATE [dbo].[SurveyQuadrat] set QuadratID = REPLACE(QuadratID, '20240624', '20240626') where SampleEventID like 'TBSRVY_20240624_1_T%' 
UPDATE [dbo].[SurveyQuadrat] set SampleEventID = REPLACE(SampleEventID, '20240624', '20240626') where SampleEventID like 'TBSRVY_20240624_1_T%' 
UPDATE [dbo].[SurveyQuadrat] set QuadratID = REPLACE(QuadratID, '_2_', '_1_') where SampleEventID like 'TBSRVY_20240626_2_T%' 
UPDATE [dbo].[SurveyQuadrat] set SampleEventID = REPLACE(SampleEventID, '_2_', '_1_') where SampleEventID like 'TBSRVY_20240626_2_T%' 
UPDATE [dbo].[SurveySH] set ShellHeightID = REPLACE(ShellHeightID, '20240624', '20240626') where QuadratID like 'TBSRVY_20240624_1_T%' 
UPDATE [dbo].[SurveySH] set QuadratID = REPLACE(QuadratID, '20240624', '20240626') where QuadratID like 'TBSRVY_20240624_1_T%' 
UPDATE [dbo].[SurveySH] set ShellHeightID = REPLACE(ShellHeightID, '_2_', '_1_') where QuadratID like 'TBSRVY_20240626_2_T%' 
UPDATE [dbo].[SurveySH] set QuadratID = REPLACE(QuadratID, '_2_', '_1_') where QuadratID like 'TBSRVY_20240626_2_T%' 

--CR SRVY 06/2024
--CR/TB SDTP 05-07/2024
UPDATE [dbo].[SedimentTrap]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data confirmed' else ' Data confirmed' end)
where [CupSampleID] like 'CRE2406-02-1' or [CupSampleID] like 'CRE2406-02-2%' or [CupSampleID] like 'CRW2406-03-2%'

--LW,CR SDTP 2-3/2024
UPDATE [dbo].[SedimentTrap]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data confirmed' else ' Data confirmed' end)
where [CupSampleID] like 'LWL2402-01-1' or [CupSampleID] like 'LWL2402-01-2' or [CupSampleID] like 'LWL2402-01-3' or [CupSampleID] like 'LWL2402-01-4' or [CupSampleID] like 'LWR2402-02-2' or [CupSampleID] like 'LWR2403-02-2'
UPDATE [dbo].[SedimentTrap]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data confirmed' else ' Data confirmed' end)
where [CupSampleID] like 'CRE2402-02-2' or [CupSampleID] like 'CRW2402-03-2' or [CupSampleID] like 'CRW2402-04-2' or [CupSampleID] like 'CRE2403-01-1' or [CupSampleID] like 'CRE2403-01-2' or [CupSampleID] like 'CRE2403-02-1' or [CupSampleID] like 'CRE2403-02-2' or [CupSampleID] like 'CRW2403-03-1' or [CupSampleID] like 'CRW2403-03-2'
DELETE FROM [dbo].[TripInfo] where [TripID] like 'TBSDTP_20240212_1' 
UPDATE [dbo].[SedimentTrap]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data confirmed' else ' Data confirmed' end)
where [CupSampleID] like 'TBL2402-01-1' or [CupSampleID] like 'TBL2402-06-1' or [CupSampleID] like 'TBL2403-01-1' or [CupSampleID] like 'TBL2403-01-2' or [CupSampleID] like 'TBM2403-05-4'

--TB CI/dermo 6-7 & 6/2024
UPDATE [dbo].[ConditionIndex]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data confirmed' else ' Data confirmed' end)
where [OysterID] like 'TBRC2406-04' or [OysterID] like 'TBRC2407-09' or [OysterID] like 'TBRC2407-10' or [OysterID] like 'TBLD2406-03'

--Repro 06/2024 - Dermo already completed: LX, SL, LW, CR
 DELETE FROM [dbo].[TripInfo] where [TripID] like 'LWCOLL_20240520%'
 DELETE FROM [dbo].[TripInfo] where [TripID] like 'SLCAGE_20240603%'


EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-04-01', @CheckEnd = '2024-07-31', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-04-01', @CheckEnd = '2024-07-31', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-04-01', @CheckEnd = '2024-07-31', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-07-01', @CheckEnd = '2024-07-31', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-07-01', @CheckEnd = '2024-07-31', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-07-01', @CheckEnd = '2024-07-31', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-07-01', @CheckEnd = '2024-07-31', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-07-01', @CheckEnd = '2024-07-31', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2024-06-01', @CheckEnd = '2024-07-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2024-06-01', @CheckEnd = '2024-07-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-06-01', @CheckEnd = '2024-07-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-02-01', @CheckEnd = '2024-04-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-02-01', @CheckEnd = '2024-03-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-01-01', @CheckEnd = '2024-03-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-06-01', @CheckEnd = '2024-06-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-06-01', @CheckEnd = '2024-06-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-06-01', @CheckEnd = '2024-06-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-06-01', @CheckEnd = '2024-06-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';