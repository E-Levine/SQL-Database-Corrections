use [Oysters_24-12-04]
go

--Run first. THen continue with datachecks.
UPDATE dbo.SampleEventWQ set Temperature = '28.0', Salinity = '33.72', DissolvedOxygen = '6.72', pH = '7.79', Depth = '0.30', SampleDepth = '0.30', Secchi = '0.30', TurbidityYSI = '6.90', TurbidityHach = '2.18', CollectionTime = '1307', PercentDissolvedOxyegn = '103.4' where SampleEventWQID like 'LWCOLL_20230307_1_0235_1_01'
UPDATE dbo.SampleEventWQ set Temperature = '29.6', Salinity = '34.08', DissolvedOxygen = '6.68', pH = '7.78', Depth = '0.30', SampleDepth = '0.30', Secchi = '0.20', TurbidityYSI = '25.76', TurbidityHach = '2.53', CollectionTime = '1346', PercentDissolvedOxyegn = '105.8' where SampleEventWQID like 'LWCOLL_20230307_1_0236_1_01'
UPDATE dbo.SampleEventWQ set Temperature = '28.5', Salinity = '37.14', DissolvedOxygen = '6.65', pH = '7.84', Depth = '0.30', SampleDepth = '0.30', Secchi = '0.30', TurbidityYSI = '17.23', TurbidityHach = '1.56', CollectionTime = '1545', PercentDissolvedOxyegn = '105.2' where SampleEventWQID like 'LWCOLL_20230307_1_0237_1_01'
UPDATE dbo.SampleEventWQ set Temperature = '28.2', Salinity = '36.02', DissolvedOxygen = '6.56', pH = '7.82', Depth = '0.20', SampleDepth = '0.20', Secchi = '0.20', TurbidityYSI = '18.65', TurbidityHach = '2.53', CollectionTime = '1437', PercentDissolvedOxyegn = '102.7' where SampleEventWQID like 'LWCOLL_20230307_1_0240_1_01'
UPDATE dbo.SampleEventWQ set Temperature = '28.2', Salinity = '35.91', DissolvedOxygen = '6.60', pH = '7.85', Depth = '0.30', SampleDepth = '0.30', Secchi = '0.30', TurbidityYSI = '9.86', TurbidityHach = '1.39', CollectionTime = '1512', PercentDissolvedOxyegn = '103.5' where SampleEventWQID like 'LWCOLL_20230307_1_0241_1_01'
UPDATE dbo.SampleEventWQ set Temperature = '27.2', Salinity = '33.25', DissolvedOxygen = '6.22', pH = '7.71', Depth = '0.50', SampleDepth = '0.50', Secchi = '0.50', TurbidityYSI = '7.56', TurbidityHach = '2.78', CollectionTime = '1224', PercentDissolvedOxyegn = '94.3' where SampleEventWQID like 'LWCOLL_20230307_1_0312_1_01'
UPDATE dbo.Dermo set DataStatus = 'Proofed', DateProofed = '2024-05-31 00:00:00', ProofedBy = 'Madeline Payne' where SampleEventID like 'CRCOLL_202303%'
UPDATE dbo.Dermo set DataStatus = 'Proofed', DateProofed = '2024-05-31 00:00:00', ProofedBy = 'Madeline Payne' where SampleEventID like 'LWCOLL_202303%'
UPDATE dbo.SampleEventWQ set DataStatus = 'Proofed', DateProofed = '2024-05-31 00:00:00', ProofedBy = 'Madeline Payne' where SampleEventID like 'LWCOLL_202303%'
UPDATE dbo.Dermo set DataStatus = 'Proofed', DateProofed = '2024-05-31 00:00:00', ProofedBy = 'Madeline Payne' where SampleEventID like 'LXCOLL_202303%'
--Remove extra rows of fixed locations
DELETE FROM FixedLocations WHERE FixedLoctionID NOT IN (SELECT MIN(FixedLoctionID) FROM FixedLocations GROUP BY FixedLocationID, Estuary, SectionName, StationName, StationNumber, LatitudeDec, LongitudeDec, StartDate, EndDate, StationNameNumber HAVING COUNT(*) > 1)


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


--Dermo: All 11/2024, 03/2023 (and Repro)
--Delete incorrect Trip
DELETE from [dbo].[TripInfo] where [TripID] like 'SLCOLL_20241105%'
UPDATE dbo.Dermo set TotalWeight = 17.21 where OysterID like 'LWRD2303-07'
UPDATE dbo.Dermo set ShellWetWeight = 27.95 where OysterID like 'LXND2303-10'
UPDATE dbo.SampleEventWQ set PercentDissolvedOyxgen = 107.6 where SampleEventWQID like 'LXCOLL_20230308_1_0246_1_01'
UPDATE dbo.SampleEventWQ set PercentDissolvedOyxgen = 102.1  where SampleEventWQID like 'LXCOLL_20230308_1_0247_1_01'
UPDATE dbo.SampleEventWQ set Depth = 0.60 where SampleEventWQID like 'SLCOLL_20230308_1_0261_1_01'
UPDATE dbo.SampleEventWQ set Depth = 0.50 where SampleEventWQID like 'SLCOLL_20230308_1_0262_1_01'
UPDATE dbo.SampleEventWQ set Depth = 0.40 where SampleEventWQID like 'SLCOLL_20230308_1_0264_1_01'
UPDATE dbo.SampleEventWQ set Depth = 0.40 where SampleEventWQID like 'SLCOLL_20230308_1_0270_1_01'
UPDATE dbo.SampleEventWQ set Depth = 0.20 where SampleEventWQID like 'SLCOLL_20230308_1_0271_1_01'
UPDATE dbo.SampleEventWQ set PercentDissolvedOyxgen = 100.5 where SampleEventWQID like 'CRCOLL_20230314_1_0232_1_01'
UPDATE dbo.SampleEventWQ set PercentDissolvedOyxgen = 100.3 where SampleEventWQID like 'CRCOLL_20230314_1_0233_1_01'

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