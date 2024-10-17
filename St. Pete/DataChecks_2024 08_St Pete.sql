use [Oysters_24-10-02]
go

--FixedLocation info: Cages
UPDATE [dbo].[FixedLocations] set Cage = 'N' where Estuary like 'TB' or StationName like 'SL-N-4'

--Cage data: CR 08/2024
--Update missing SH
UPDATE [dbo].[CageCount] set TotalCount = 16 where [CageCountID] like 'CRCAGE_20240813_1_0231_1_R_B'
INSERT into CageSH(ShellHeightID, CageCountID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes)
values ('CRCAGE_20240813_1_0231_1_R_B_16', 'CRCAGE_20240813_1_0231_1_R_B', '56', 'Entered', '2024-08-27 00:00:00', 'Erica Levine', '2024-08-27 00:00:00', 'Erica Levine', NULL, NULL, NULL, NULL);

--Sediment Trap: TB
--TB 07/2024 - GOOD.
--LW/CR 8/2024
UPDATE [dbo].[SedimentTrap]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data confirmed' else ' Data confirmed' end)
where [CupSampleID] like 'LWL2408-02-1' or [CupSampleID] like 'CRE2408-01-1' or [CupSampleID] like 'CRE2408-01-2' or [CupSampleID] like 'CRE2408-02-1' or [CupSampleID] like 'CRE2408-02-2' 

--Dermo data: SL, LW, LX, CR
--SL, LX
UPDATE [dbo].[Dermo]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data confirmed' else ' Data confirmed' end)
where [OysterID] like 'SLND2408-08' or [OysterID] like 'LXND2408-13' or [OysterID] like 'LXSD2409-09'

--RCRT: 
--Remove incorrectly created trips
DELETE from [dbo].[TripInfo] where [TripID] like 'CRRCRT_20240806_1%' or [TripID] like 'LWRCRT_20240820_1' or [TripID] like 'CRRCRT_20240919_1%'
--Correct incorrect deployed dates
UPDATE [dbo].[Recruitment] set DeployedDate = '2024-07-09' where SampleEventID like 'LWRCRT_20240806_1_0235_1' or SampleEventID like 'LWRCRT_20240806_1_0237_1'
--Confirm TB data
UPDATE [dbo].[SampleEventWQ]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Data confirmed' else ' Data confirmed' end)
where [SampleEventWQID] like 'TBRCRT_20240823_1_0528_1_01' or [SampleEventWQID] like 'TBRCRT_20240823_1_0527_1_01' or [SampleEventWQID] like 'TBRCRT_20240823_1_0529_1_02' or [SampleEventWQID] like 'TBRCRT_20240823_1_0278_1_01' or [SampleEventWQID] like 'TBRCRT_20240823_1_0277_1_01'
--Add proofing tags
UPDATE [dbo].[Recruitment] set DataStatus = 'Proofed',  DateProofed = '2024-09-10 00:00:00', ProofedBy = 'Darian Blackiston' where SampleEventID like 'SLRCRT_202409%' or SampleEventID like 'LXRCRT_202409%'

--CAGE LX 3-10/2023
--10/2023 Missing SHs
UPDATE [dbo].[CageSH] set ShellHeight = 51 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_19'
UPDATE [dbo].[CageSH] set ShellHeight = 36 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_20'
UPDATE [dbo].[CageSH] set ShellHeight = 46 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_21'
UPDATE [dbo].[CageSH] set ShellHeight = 36 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_22'
UPDATE [dbo].[CageSH] set ShellHeight = 41 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_23'
UPDATE [dbo].[CageSH] set ShellHeight = 56 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_24'
UPDATE [dbo].[CageSH] set ShellHeight = 35 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_25'
UPDATE [dbo].[CageSH] set ShellHeight = 44 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_26'
UPDATE [dbo].[CageSH] set ShellHeight = 53 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_27'
UPDATE [dbo].[CageSH] set ShellHeight = 41 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_28'
UPDATE [dbo].[CageSH] set ShellHeight = 57 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_29'
UPDATE [dbo].[CageSH] set ShellHeight = 49 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_B_30'
UPDATE [dbo].[CageSH] set ShellHeight = 46 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_01'
UPDATE [dbo].[CageSH] set ShellHeight = 47 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_02'
UPDATE [dbo].[CageSH] set ShellHeight = 51 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_03'
UPDATE [dbo].[CageSH] set ShellHeight = 28 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_04'
UPDATE [dbo].[CageSH] set ShellHeight = 51 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_05'
UPDATE [dbo].[CageSH] set ShellHeight = 51 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_06'
UPDATE [dbo].[CageSH] set ShellHeight = 52 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_07'
UPDATE [dbo].[CageSH] set ShellHeight = 55 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_08'
UPDATE [dbo].[CageSH] set ShellHeight = 62 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_09'
UPDATE [dbo].[CageSH] set ShellHeight = 61 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_10'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_11'
UPDATE [dbo].[CageSH] set ShellHeight = 33 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_12'
UPDATE [dbo].[CageSH] set ShellHeight = 54 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_13'
UPDATE [dbo].[CageSH] set ShellHeight = 58 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_14'
UPDATE [dbo].[CageSH] set ShellHeight = 48 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_15'
UPDATE [dbo].[CageSH] set ShellHeight = 46 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_16'
UPDATE [dbo].[CageSH] set ShellHeight = 58 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_17'
UPDATE [dbo].[CageSH] set ShellHeight = 52 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_18'
UPDATE [dbo].[CageSH] set ShellHeight = 54 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_19'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_20'
UPDATE [dbo].[CageSH] set ShellHeight = 37 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_21'
UPDATE [dbo].[CageSH] set ShellHeight = 48 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_22'
UPDATE [dbo].[CageSH] set ShellHeight = 37 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_23'
UPDATE [dbo].[CageSH] set ShellHeight = 35 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_24'
UPDATE [dbo].[CageSH] set ShellHeight = 41 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_25'
UPDATE [dbo].[CageSH] set ShellHeight = 43 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_26'
UPDATE [dbo].[CageSH] set ShellHeight = 45 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_27'
UPDATE [dbo].[CageSH] set ShellHeight = 63 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_28'
UPDATE [dbo].[CageSH] set ShellHeight = 32 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_29'
UPDATE [dbo].[CageSH] set ShellHeight = 52 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_R_30'
UPDATE [dbo].[CageSH] set ShellHeight = 65 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_01'
UPDATE [dbo].[CageSH] set ShellHeight = 55 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_02'
UPDATE [dbo].[CageSH] set ShellHeight = 44 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_03'
UPDATE [dbo].[CageSH] set ShellHeight = 51 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_04'
UPDATE [dbo].[CageSH] set ShellHeight = 35 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_05'
UPDATE [dbo].[CageSH] set ShellHeight = 53 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_06'
UPDATE [dbo].[CageSH] set ShellHeight = 31 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_07'
UPDATE [dbo].[CageSH] set ShellHeight = 57 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_08'
UPDATE [dbo].[CageSH] set ShellHeight = 48 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_09'
UPDATE [dbo].[CageSH] set ShellHeight = 36 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_10'
UPDATE [dbo].[CageSH] set ShellHeight = 42 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_11'
UPDATE [dbo].[CageSH] set ShellHeight = 36 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_12'
UPDATE [dbo].[CageSH] set ShellHeight = 48 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_13'
UPDATE [dbo].[CageSH] set ShellHeight = 46 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_14'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_15'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_16'
UPDATE [dbo].[CageSH] set ShellHeight = 43 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_17'
UPDATE [dbo].[CageSH] set ShellHeight = 45 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_18'
UPDATE [dbo].[CageSH] set ShellHeight = 60 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_19'
UPDATE [dbo].[CageSH] set ShellHeight = 54 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_20'
UPDATE [dbo].[CageSH] set ShellHeight = 61 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_21'
UPDATE [dbo].[CageSH] set ShellHeight = 35 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_22'
UPDATE [dbo].[CageSH] set ShellHeight = 39 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_23'
UPDATE [dbo].[CageSH] set ShellHeight = 49 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_24'
UPDATE [dbo].[CageSH] set ShellHeight = 58 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_25'
UPDATE [dbo].[CageSH] set ShellHeight = 41 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_26'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_27'
UPDATE [dbo].[CageSH] set ShellHeight = 53 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_28'
UPDATE [dbo].[CageSH] set ShellHeight = 41 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_29'
UPDATE [dbo].[CageSH] set ShellHeight = 43 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_D_Y_30'
UPDATE [dbo].[CageSH] set ShellHeight = 53 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_01'
UPDATE [dbo].[CageSH] set ShellHeight = 68 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_02'
UPDATE [dbo].[CageSH] set ShellHeight = 42 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_03'
UPDATE [dbo].[CageSH] set ShellHeight = 43 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_04'
UPDATE [dbo].[CageSH] set ShellHeight = 37 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_05'
UPDATE [dbo].[CageSH] set ShellHeight = 41 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_06'
UPDATE [dbo].[CageSH] set ShellHeight = 79 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_07'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_08'
UPDATE [dbo].[CageSH] set ShellHeight = 72 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_09'
UPDATE [dbo].[CageSH] set ShellHeight = 38 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_10'
UPDATE [dbo].[CageSH] set ShellHeight = 49 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_11'
UPDATE [dbo].[CageSH] set ShellHeight = 45 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_12'
UPDATE [dbo].[CageSH] set ShellHeight = 37 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_13'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_B_14'
UPDATE [dbo].[CageSH] set ShellHeight = 54 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_01'
UPDATE [dbo].[CageSH] set ShellHeight = 53 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_02'
UPDATE [dbo].[CageSH] set ShellHeight = 61 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_03'
UPDATE [dbo].[CageSH] set ShellHeight = 69 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_04'
UPDATE [dbo].[CageSH] set ShellHeight = 43 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_05'
UPDATE [dbo].[CageSH] set ShellHeight = 65 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_06'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_07'
UPDATE [dbo].[CageSH] set ShellHeight = 47 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_08'
UPDATE [dbo].[CageSH] set ShellHeight = 59 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_09'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_10'
UPDATE [dbo].[CageSH] set ShellHeight = 44 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_11'
UPDATE [dbo].[CageSH] set ShellHeight = 46 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_12'
UPDATE [dbo].[CageSH] set ShellHeight = 61 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_13'
UPDATE [dbo].[CageSH] set ShellHeight = 55 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_14'
UPDATE [dbo].[CageSH] set ShellHeight = 56 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_15'
UPDATE [dbo].[CageSH] set ShellHeight = 48 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_16'
UPDATE [dbo].[CageSH] set ShellHeight = 40 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_17'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_18'
UPDATE [dbo].[CageSH] set ShellHeight = 43 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_R_19'
UPDATE [dbo].[CageSH] set ShellHeight = 55 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_01'
UPDATE [dbo].[CageSH] set ShellHeight = 49 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_02'
UPDATE [dbo].[CageSH] set ShellHeight = 62 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_03'
UPDATE [dbo].[CageSH] set ShellHeight = 60 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_04'
UPDATE [dbo].[CageSH] set ShellHeight = 53 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_05'
UPDATE [dbo].[CageSH] set ShellHeight = 50 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_06'
UPDATE [dbo].[CageSH] set ShellHeight = 48 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_07'
UPDATE [dbo].[CageSH] set ShellHeight = 68 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_08'
UPDATE [dbo].[CageSH] set ShellHeight = 68 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_09'
UPDATE [dbo].[CageSH] set ShellHeight = 54 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_10'
UPDATE [dbo].[CageSH] set ShellHeight = 51 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_11'
UPDATE [dbo].[CageSH] set ShellHeight = 47 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_12'
UPDATE [dbo].[CageSH] set ShellHeight = 68 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_13'
UPDATE [dbo].[CageSH] set ShellHeight = 64 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_14'
UPDATE [dbo].[CageSH] set ShellHeight = 44 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_15'
UPDATE [dbo].[CageSH] set ShellHeight = 46 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_16'
UPDATE [dbo].[CageSH] set ShellHeight = 47 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_17'
UPDATE [dbo].[CageSH] set ShellHeight = 65 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_18'
UPDATE [dbo].[CageSH] set ShellHeight = 53 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_19'
UPDATE [dbo].[CageSH] set ShellHeight = 49 where [ShellHeightID] like 'LXCAGE_20231003_1_0243_1_R_Y_20'

--2023-01, 02, 12 Dermo, Repro checks: SL, LX, LW, CR
DELETE from [dbo].[TripInfo] where [TripID] like 'CRCOLL_20230127_1%'
UPDATE [dbo].[SampleEventWQ] set DataStatus = 'Proofed',  DateProofed = '2024-07-02 00:00:00', ProofedBy = 'Mallory Gassen-Kurtz' where SampleEventWQID like 'SLCOLL_20230208_1_0269_1_01' or SampleEventWQID like 'SLCOLL_20230208_1_0270_1_01' or SampleEventWQID like 'SLCOLL_20230208_1_0271_1_01' or SampleEventWQID like 'LWCOLL_20231205_1_0312_1_01'
UPDATE [dbo].[SampleEvent] set DataStatus = 'Proofed',  DateProofed = '2024-07-02 00:00:00', ProofedBy = 'Mallory Gassen-Kurtz' where SampleEventID like 'SLCOLL_20230208_1_0269_1' or SampleEventID like 'SLCOLL_20230208_1_0270_1' or SampleEventID like 'SLCOLL_20230208_1_0271_1' or SampleEventID like 'LWCOLL_20231205_1_0312_1'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 109.3 where SampleEventWQID like 'SLCOLL_20230105_1_0261_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 102.2 where SampleEventWQID like 'CRCOLL_20230110_1_0230_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 101.8 where SampleEventWQID like 'CRCOLL_20230110_1_0232_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 121.9 where SampleEventWQID like 'CRCOLL_20230110_1_0233_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 101.1 where SampleEventWQID like 'LXCOLL_20230207_1_0243_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 108.4 where SampleEventWQID like 'LXCOLL_20230207_1_0247_1_01'
UPDATE [dbo].[SampleEventWQ] set SampleDepth = 0.55 where SampleEventWQID like 'SLCOLL_20230208_1_0255_1_01'
UPDATE [dbo].[SampleEventWQ] set SampleDepth = 0.40 where SampleEventWQID like 'SLCOLL_20230208_1_0256_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 101.7 where SampleEventWQID like 'SLCOLL_20230208_1_0262_1_01'
UPDATE [dbo].[SampleEventWQ] set SampleDepth = 0.40 where SampleEventWQID like 'SLCOLL_20230208_1_0257_1_01'
UPDATE [dbo].[SampleEventWQ] set SampleDepth = 0.60 where SampleEventWQID like 'CRCOLL_20230214_1_0230_1_01'
UPDATE [dbo].[SampleEventWQ] set SampleDepth = 0.50 where SampleEventWQID like 'CRCOLL_20230214_1_0231_1_01'
UPDATE [dbo].[SampleEventWQ] set SampleDepth = 0.50, PercentDissolvedOxygen = 119.0 where SampleEventWQID like 'CRCOLL_20230214_1_0232_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 106.5 where SampleEventWQID like 'CRCOLL_20230214_1_0233_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 111.8 where SampleEventWQID like 'LWCOLL_20230104_1_0235_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 114.8 where SampleEventWQID like 'LWCOLL_20230104_1_0236_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 111.7 where SampleEventWQID like 'LWCOLL_20230104_1_0240_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 102.4 where SampleEventWQID like 'LWCOLL_20230104_1_0237_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 110.3 where SampleEventWQID like 'LWCOLL_20230104_1_0241_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 120.4 where SampleEventWQID like 'LWCOLL_20230104_1_0312_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 114.2 where SampleEventWQID like 'LWCOLL_20230207_1_0237_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 102.1 where SampleEventWQID like 'LWCOLL_20230207_1_0241_1_01'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = 102.3 where SampleEventWQID like 'LWCOLL_20230207_1_0312_1_01'
UPDATE [dbo].[Dermo] set [Comments] = CONCAT(Comments, case when Comments is null then 'Data confirmed' else ' Data confirmed' end) where [OysterID] like 'LXSD2301-13'
UPDATE [dbo].[FixedLocations] set Cage = 'N' where FixedLocationID like '0600'

--Survey data: 9/2024
UPDATE [dbo].[SurveyQuadrat] set NumLive = 7 where QuadratID like 'LXSRVY_20240904_1_0247_1_03'
UPDATE [dbo].[SurveyQuadrat] set NumLive = 5 where QuadratID like 'LXSRVY_20240904_1_0249_1_05'
--Add missing random station information
UPDATE [dbo].[SurveyQuadrat] set QuadratID = 'CRSRVY_20240812_1_C048_1_01', QuadratNumber = 1, NumLive = 0, NumDead = 0, DataStatus = 'Proofed', DateProofed = '2024-10-02 00:00:00', ProofedBy = 'Erica Levine', Comments = 'presence/absense' where QuadratID like 'CRSRVY_20240812_1_C048_1_00'
UPDATE [dbo].[SurveyQuadrat] set QuadratID = 'CRSRVY_20240812_1_C049_1_01', QuadratNumber = 1, NumLive = 0, NumDead = 0, DataStatus = 'Proofed', DateProofed = '2024-10-02 00:00:00', ProofedBy = 'Erica Levine', Comments = 'presence/absense' where QuadratID like 'CRSRVY_20240812_1_C049_1_00'
UPDATE [dbo].[SurveyQuadrat] set QuadratID = 'CRSRVY_20240812_1_C050_1_01', QuadratNumber = 1, NumLive = 0, NumDead = 0, DataStatus = 'Proofed', DateProofed = '2024-10-02 00:00:00', ProofedBy = 'Erica Levine', Comments = 'presence/absense' where QuadratID like 'CRSRVY_20240812_1_C050_1_00'
UPDATE [dbo].[SurveyQuadrat] set QuadratID = 'CRSRVY_20240812_1_C051_1_01', QuadratNumber = 1, NumLive = 0, NumDead = 0, DataStatus = 'Proofed', DateProofed = '2024-10-02 00:00:00', ProofedBy = 'Erica Levine', Comments = 'presence/absense' where QuadratID like 'CRSRVY_20240812_1_C051_1_00'
UPDATE [dbo].[SurveyQuadrat] set QuadratID = 'CRSRVY_20240812_1_C053_1_01', QuadratNumber = 1, NumLive = 0, NumDead = 0, DataStatus = 'Proofed', DateProofed = '2024-10-02 00:00:00', ProofedBy = 'Erica Levine', Comments = 'presence/absense' where QuadratID like 'CRSRVY_20240812_1_C053_1_00'
UPDATE [dbo].[SurveySH] set ShellHeightID = 'CRSRVY_20240812_1_C048_1_01_001', QuadratID = 'CRSRVY_20240812_1_C048_1_01', DataStatus = 'Proofed', DateProofed = '2024-10-02 00:00:00', ProofedBy = 'Erica Levine' where QuadratID like 'CRSRVY_20240812_1_C048_1_00'
UPDATE [dbo].[SurveySH] set ShellHeightID = 'CRSRVY_20240812_1_C049_1_01_001', QuadratID = 'CRSRVY_20240812_1_C049_1_01', DataStatus = 'Proofed', DateProofed = '2024-10-02 00:00:00', ProofedBy = 'Erica Levine' where QuadratID like 'CRSRVY_20240812_1_C049_1_00'
UPDATE [dbo].[SurveySH] set ShellHeightID = 'CRSRVY_20240812_1_C050_1_01_001', QuadratID = 'CRSRVY_20240812_1_C050_1_01', DataStatus = 'Proofed', DateProofed = '2024-10-02 00:00:00', ProofedBy = 'Erica Levine' where QuadratID like 'CRSRVY_20240812_1_C050_1_00'
UPDATE [dbo].[SurveySH] set ShellHeightID = 'CRSRVY_20240812_1_C051_1_01_001', QuadratID = 'CRSRVY_20240812_1_C051_1_01', DataStatus = 'Proofed', DateProofed = '2024-10-02 00:00:00', ProofedBy = 'Erica Levine' where QuadratID like 'CRSRVY_20240812_1_C051_1_00'
UPDATE [dbo].[SurveySH] set ShellHeightID = 'CRSRVY_20240812_1_C053_1_01_001', QuadratID = 'CRSRVY_20240812_1_C053_1_01', DataStatus = 'Proofed', DateProofed = '2024-10-02 00:00:00', ProofedBy = 'Erica Levine' where QuadratID like 'CRSRVY_20240812_1_C053_1_00'
DELETE from [dbo].[SurveyQuadrat] where QuadratID is NULL and SampleEventID like 'CRSRVY_20240812_1%' 
UPDATE [dbo].[SampleEventWQ] set [Comments] = CONCAT(Comments, case when Comments is null then 'WQ confirmed' else ' WQ confirmed' end) where [SampleEventWQID] like 'CRSRVY_20240812_1_C047_1_01' or SampleEventWQID like 'CRSRVY_20240812_1_C048_1_01' or SampleEventWQID like 'CRSRVY_20240812_1_C052_1_01' or SampleEventWQID like 'CRSRVY_20240812_1_C053_1_01'

UPDATE [dbo].[TripInfo] set DataStatus = 'Entered' where TripID like 'SLCOLL_20240410_1'
UPDATE [dbo].[FixedLocations] set Collections = 'Y' where FixedLocationID like 'C026' or FixedLocationID like 'C027' or FixedLocationID like 'T023' or FixedLocationID like 'T024' or FixedLocationID like 'T026'

EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-08-01', @CheckEnd = '2024-09-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-08-01', @CheckEnd = '2024-09-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-08-01', @CheckEnd = '2024-09-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-07-01', @CheckEnd = '2024-08-31', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-08-01', @CheckEnd = '2024-09-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-08-01', @CheckEnd = '2024-09-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-08-01', @CheckEnd = '2024-09-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-08-01', @CheckEnd = '2024-09-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-08-01', @CheckEnd = '2024-09-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-08-01', @CheckEnd = '2024-09-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-08-01', @CheckEnd = '2024-09-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksWave] @CheckStart = '2024-01-01', @CheckEnd = '2024-01-31', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2023-03-01', @CheckEnd = '2023-10-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-01-01', @CheckEnd = '2023-02-27', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-01-01', @CheckEnd = '2023-02-27', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-01-01', @CheckEnd = '2023-02-27', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-01-01', @CheckEnd = '2023-02-27', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-12-01', @CheckEnd = '2023-12-27', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-12-01', @CheckEnd = '2023-12-27', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-12-01', @CheckEnd = '2023-12-27', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-12-01', @CheckEnd = '2023-12-27', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2024-08-01', @CheckEnd = '2024-09-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2024-08-01', @CheckEnd = '2024-09-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2024-08-01', @CheckEnd = '2024-09-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2024-08-01', @CheckEnd = '2024-09-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';