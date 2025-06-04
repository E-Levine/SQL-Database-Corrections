use [Oysters] -- Completed 6/4/2025.
go

--RCRT 05/2025 -CERP/PBC Done.

--STDP 05/2025 - No DW measurements. Add ave meas to comments for each station for working tables (reports) NOT TO DATABASE
--Update [dbo].[SedimentTrap] set FilterDryWeight = 4.39, PanDryWeight = 177.34 where CupSampleID like 'LWL2505-01-3' or CupSampleID like 'LWL2505-01-4'
--Update [dbo].[SedimentTrap] set FilterDryWeight = 3.81, PanDryWeight = 18.62 where CupSampleID like 'LWL2505-02%'
--Update [dbo].[SedimentTrap] set FilterDryWeight = 3.97, PanDryWeight = 15.49 where CupSampleID like 'LWL2505-03-1' or CupSampleID like 'LWL2505-03-4'
--Update [dbo].[SedimentTrap] set FilterDryWeight = 4.28, PanDryWeight = 36.52 where CupSampleID like 'LWR2505-02-1' or CupSampleID like 'LWR2505-02-2' or CupSampleID like 'LWR2505-02-4'
--Update [dbo].[SedimentTrap] set FilterDryWeight = 4.30, PanDryWeight = 40.04 where CupSampleID like 'LWR2505-03%'
--Update [dbo].[SedimentTrap] set FilterDryWeight = 3.90 where CupSampleID like 'LWR2505-04%'

--CAGE 05/2025 - Done.

--COLL 05/2025 - Done. 
Update [dbo].[Dermo] set Comments = 'SLS3 collected from SLS1 due to no oysters at SLS3' where OysterID = 'SLSD2505-11'
Update [dbo].[Dermo] set Comments = 'SLS3 collected from SLS1 due to no oysters at SLS3' where OysterID = 'SLSD2505-12'
Update [dbo].[Dermo] set Comments = 'SLS3 collected from SLS1 due to no oysters at SLS3' where OysterID = 'SLSD2505-13'
Update [dbo].[Dermo] set Comments = 'SLS3 collected from SLS1 due to no oysters at SLS3' where OysterID = 'SLSD2505-14'
Update [dbo].[Dermo] set Comments = 'SLS3 collected from SLS1 due to no oysters at SLS3' where OysterID = 'SLSD2505-15'
Update [dbo].[SampleEventWQ] set Comments = 'pH = 10.30' where SampleEventID = 'CRCOLL_20250514_1_0233_1'

--Correct Trip finished before data entered
Update [dbo].[TripInfo] set DataStatus = 'Not Entered', DateProofed = NULL, ProofedBy = NULL where TripID = 'LXCOLL_20250408_1'


EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-05-01', @CheckEnd = '2025-05-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-05-01', @CheckEnd = '2025-05-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-05-01', @CheckEnd = '2025-05-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-05-01', @CheckEnd = '2025-05-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-05-01', @CheckEnd = '2025-05-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2025-05-01', @CheckEnd = '2025-05-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-05-01', @CheckEnd = '2025-05-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-05-01', @CheckEnd = '2025-05-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-05-01', @CheckEnd = '2025-05-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';