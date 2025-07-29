use [Oysters_25-07-24]
go


--Update Datalogger locations --COMPLETED in OYSTERS
--UPDATE FixedLocations set Dataloggers = 'Y' where StationNameNumber = 'TB Braden River 8' or StationNameNumber = 'LW-L-2-2' 
--LXN sex ratio repro samples for June-July 2025 added to Oysters 7/22/25

--RCRT: TB 06/2025, SL/LX/LW 07/2025

--SDTP: LW 07/2025, add means to comments for missing 05/2025 data
--LW STDP 05/2025 - No DW measurements. Add ave meas to comments for each station for working tables (reports) NOT TO DATABASE
UPDATE [hsdb].[SedimentTrap] set Comments = CONCAT(Comments, ', Mean previous FDW = 4.39, PDW = 177.34') where CupSampleID like 'LWL2505-01-3' or CupSampleID like 'LWL2505-01-4'
UPDATE [hsdb].[SedimentTrap] set Comments = CONCAT(Comments, ', Mean previous FDW = 4.39') where CupSampleID like 'LWL2505-01-1' or CupSampleID like 'LWL2505-01-2'
UPDATE [hsdb].[SedimentTrap] set Comments = CONCAT(Comments, ', Mean previous FDW = 3.81, PDW = 18.62') where CupSampleID like 'LWL2505-02%'
UPDATE [hsdb].[SedimentTrap] set Comments = CONCAT(Comments, ', Mean previous FDW = 3.97, PDW = 15.49') where CupSampleID like 'LWL2505-03-1' or CupSampleID like 'LWL2505-03-4'
UPDATE [hsdb].[SedimentTrap] set Comments = CONCAT(Comments, ', Mean previous FDW = 3.97') where CupSampleID like 'LWL2505-03-2' or CupSampleID like 'LWL2505-03-3'
UPDATE [hsdb].[SedimentTrap] set Comments = CONCAT(Comments, ', Mean previous FDW = 4.28, PDW = 36.52') where CupSampleID like 'LWR2505-02-1' or CupSampleID like 'LWR2505-02-2' or CupSampleID like 'LWR2505-02-4'
UPDATE [hsdb].[SedimentTrap] set Comments = CONCAT(Comments, ', Mean previous FDW = 4.28') where CupSampleID like 'LWR2505-02-3'
Update [hsdb].[SedimentTrap] set Comments = CONCAT(Comments, ', Mean previous FDW = 4.30, PDW = 40.04') where CupSampleID like 'LWR2505-03%'
UPDATE [hsdb].[SedimentTrap] set Comments = CONCAT(Comments, ', Mean previous FDW = 3.90') where CupSampleID like 'LWR2505-04%'

--CAGE: 06/2025, SL/LX 07/2025
UPDATE dbo.CageCount set [Comments] = CONCAT(Comments, ', 29 deployed-miscounted') where CageCountID like 'LXCAGE_20250708_1_0243_1_D_B%'

--COLL: TB 06/2024 Repro. LW 04-05/2025, CERP 04-06/2025, LW/LX/SL dermo 07/2025, TB 06/2025
UPDATE dbo.ConditionIndex set [Comments] = 'Shallow' where OysterID like 'TBRC2406-04%'
DELETE from TripInfo where TripID = 'TBCOLL_20250630_1'
UPDATE dbo.SampleEventWQ set [Secchi] = 0.30 where SampleEventWQID like 'TBCOLL_20250623_1_0529_1_01%'

--pH didn't pass CCV for TB and CR 06/2025, nor SL/LX/LW for 07/2025
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 10.82, pH failed CCV' where SampleEventWQID = 'CRCOLL_20250617_1_0230_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 9.88, pH failed CCV' where SampleEventWQID = 'CRCOLL_20250617_1_0231_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 9.22, pH failed CCV' where SampleEventWQID = 'CRCOLL_20250617_1_0232_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 8.13, pH failed CCV' where SampleEventWQID = 'CRCOLL_20250617_1_0233_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 8.11, pH failed CCV' where SampleEventWQID = 'TBCOLL_20250623_1_0277_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 8.14, pH failed CCV' where SampleEventWQID = 'TBCOLL_20250623_1_0278_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 7.94, pH failed CCV' where SampleEventWQID = 'TBCOLL_20250623_1_0291_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 8.39, pH failed CCV' where SampleEventWQID = 'TBCOLL_20250623_1_0527_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 7.76, pH failed CCV' where SampleEventWQID = 'TBCOLL_20250623_1_0528_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 7.62, pH failed CCV' where SampleEventWQID = 'TBCOLL_20250623_1_0529_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 7.6, pH failed CCV' where SampleEventWQID = 'TBCOLL_20250623_1_0529_1_02'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 6.89, pH failed CCV' where SampleEventWQID = 'LWCOLL_20250708_1_0235_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 7.84, pH failed CCV' where SampleEventWQID = 'LWCOLL_20250708_1_0236_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 7.44, pH failed CCV' where SampleEventWQID = 'LWCOLL_20250708_1_0237_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 7.49, pH failed CCV' where SampleEventWQID = 'LWCOLL_20250708_1_0240_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 6.19, pH failed CCV' where SampleEventWQID = 'LWCOLL_20250708_1_0241_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 8.7, pH failed CCV' where SampleEventWQID = 'LWCOLL_20250708_1_0312_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 7.21, pH failed CCV' where SampleEventWQID = 'LXCOLL_20250708_1_0242_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 6.12, pH failed CCV' where SampleEventWQID = 'LXCOLL_20250708_1_0243_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 6.85, pH failed CCV' where SampleEventWQID = 'LXCOLL_20250708_1_0244_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 6.27, pH failed CCV' where SampleEventWQID = 'LXCOLL_20250708_1_0246_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 7.07, pH failed CCV' where SampleEventWQID = 'LXCOLL_20250708_1_0247_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 6.3, pH failed CCV' where SampleEventWQID = 'LXCOLL_20250708_1_0249_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 6.02, pH failed CCV' where SampleEventWQID = 'SLCOLL_20250709_1_0255_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 5.95, pH failed CCV' where SampleEventWQID = 'SLCOLL_20250709_1_0256_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 5.92, pH failed CCV' where SampleEventWQID = 'SLCOLL_20250709_1_0257_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 6.44, pH failed CCV' where SampleEventWQID = 'SLCOLL_20250709_1_0261_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 5.74, pH failed CCV' where SampleEventWQID = 'SLCOLL_20250709_1_0262_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 5.95, pH failed CCV' where SampleEventWQID = 'SLCOLL_20250709_1_0264_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 5.76, pH failed CCV' where SampleEventWQID = 'SLCOLL_20250709_1_0269_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 5.89, pH failed CCV' where SampleEventWQID = 'SLCOLL_20250709_1_0270_1_01'
UPDATE dbo.SampleEventWQ set [pH] = NULL, [Comments] = 'pH = 5.74, pH failed CCV' where SampleEventWQID = 'SLCOLL_20250709_1_0271_1_01'



EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-06-01', @CheckEnd = '2025-06-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-07-01', @CheckEnd = '2025-07-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-07-01', @CheckEnd = '2025-07-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-07-01', @CheckEnd = '2025-07-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-07-01', @CheckEnd = '2025-07-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2025-07-01', @CheckEnd = '2025-07-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-06-01', @CheckEnd = '2025-06-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-06-01', @CheckEnd = '2025-07-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-06-01', @CheckEnd = '2025-07-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-06-01', @CheckEnd = '2024-06-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-04-01', @CheckEnd = '2025-06-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-01-01', @CheckEnd = '2025-06-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-04-01', @CheckEnd = '2025-06-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-04-01', @CheckEnd = '2025-06-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';