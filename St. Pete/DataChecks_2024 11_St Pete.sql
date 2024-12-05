use [Oysters_24-12-04]
go

--November 2024 data checks
--Rcrt all 11/2024
UPDATE [dbo].[Recruitment]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Ret delayed due to H Helene and Milton' else ', Ret delayed due to H Helene and Milton' end)
where [SampleEventID] like 'TBRCRT_202411%'

--SDTP: LW 11/2024, CR 10-11/2024, TB 11/2024: None 
--TB 6/2024 - Incorrectly entered AshWeights corrected
UPDATE [hsdb].[SedimentTrap] set AshWeight = '50.50' where CupSampleID like 'TBL2405-01-1'
UPDATE [hsdb].[SedimentTrap] set AshWeight = '52.94' where CupSampleID like 'TBL2405-01-2'
UPDATE [hsdb].[SedimentTrap] set AshWeight = '26.03' where CupSampleID like 'TBB2405-04-1'
UPDATE [hsdb].[SedimentTrap] set AshWeight = '33.84' where CupSampleID like 'TBB2405-04-2'
UPDATE [hsdb].[SedimentTrap] set AshWeight = '37.50' where CupSampleID like 'TBM2405-05-1'
UPDATE [hsdb].[SedimentTrap] set AshWeight = '23.12' where CupSampleID like 'TBM2405-05-2'
UPDATE [hsdb].[SedimentTrap] set AshWeight = '39.24' where CupSampleID like 'TBL2405-06-1'
UPDATE [hsdb].[SedimentTrap] set AshWeight = '46.72' where CupSampleID like 'TBL2405-06-2'
UPDATE [hsdb].[SedimentTrap] set AshWeight = '53.23' where CupSampleID like 'TBR2405-07-1'
UPDATE [hsdb].[SedimentTrap] set AshWeight = '61.64' where CupSampleID like 'TBR2405-07-2'
UPDATE [hsdb].[SedimentTrap] set AshWeight = '36.38' where CupSampleID like 'TBR2405-08-1'
UPDATE [hsdb].[SedimentTrap] set AshWeight = '37.05' where CupSampleID like 'TBR2405-08-2'
UPDATE [hsdb].[SedimentTrap] set PortionofSample = '0.50' where CupSampleID like 'TBR2312-07-2'
UPDATE [hsdb].[SedimentTrap] set PortionofSample = '0.10' where CupSampleID like 'TBL2401-06-2'
UPDATE [hsdb].[SedimentTrap] set PortionofSample = '0.10' where CupSampleID like 'TBL2404-01-1'
UPDATE [hsdb].[SedimentTrap] set PortionofSample = '0.10' where CupSampleID like 'TBL2404-01-2'


--Dermo: All 11/2024
--Delete incorrect Trip
DELETE from [dbo].[TripInfo] where [TripID] like 'SLCOLL_20241105%'

EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-11-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-11-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-11-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-11-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-11-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-10-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-10-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-10-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-06-01', @CheckEnd = '2024-06-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-06-01', @CheckEnd = '2024-07-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-11-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
--EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-11-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
--EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-11-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
--EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-11-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
--EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-11-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';