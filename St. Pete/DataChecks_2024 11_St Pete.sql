use [Oysters_24-12-18]
go

--Run first. Then continue with datachecks.
UPDATE dbo.SampleEventWQ set Temperature = '28.0', Salinity = '33.72', DissolvedOxygen = '6.72', pH = '7.79', Depth = '0.30', SampleDepth = '0.30', Secchi = '0.30', TurbidityYSI = '6.90', TurbidityHach = '2.18', CollectionTime = '1307', PercentDissolvedOxygen = '103.4' where SampleEventWQID like 'LWCOLL_20230307_1_0235_1_01'
UPDATE dbo.SampleEventWQ set Temperature = '29.6', Salinity = '34.08', DissolvedOxygen = '6.68', pH = '7.78', Depth = '0.30', SampleDepth = '0.30', Secchi = '0.20', TurbidityYSI = '25.76', TurbidityHach = '2.53', CollectionTime = '1346', PercentDissolvedOxygen = '105.8' where SampleEventWQID like 'LWCOLL_20230307_1_0236_1_01'
UPDATE dbo.SampleEventWQ set Temperature = '28.5', Salinity = '37.14', DissolvedOxygen = '6.65', pH = '7.84', Depth = '0.30', SampleDepth = '0.30', Secchi = '0.30', TurbidityYSI = '17.23', TurbidityHach = '1.56', CollectionTime = '1545', PercentDissolvedOxygen = '105.2' where SampleEventWQID like 'LWCOLL_20230307_1_0237_1_01'
UPDATE dbo.SampleEventWQ set Temperature = '28.2', Salinity = '36.02', DissolvedOxygen = '6.56', pH = '7.82', Depth = '0.20', SampleDepth = '0.20', Secchi = '0.20', TurbidityYSI = '18.65', TurbidityHach = '2.53', CollectionTime = '1437', PercentDissolvedOxygen = '102.7' where SampleEventWQID like 'LWCOLL_20230307_1_0240_1_01'
UPDATE dbo.SampleEventWQ set Temperature = '28.2', Salinity = '35.91', DissolvedOxygen = '6.60', pH = '7.85', Depth = '0.30', SampleDepth = '0.30', Secchi = '0.30', TurbidityYSI = '9.86', TurbidityHach = '1.39', CollectionTime = '1512', PercentDissolvedOxygen = '103.5' where SampleEventWQID like 'LWCOLL_20230307_1_0241_1_01'
UPDATE dbo.SampleEventWQ set Temperature = '27.2', Salinity = '33.25', DissolvedOxygen = '6.22', pH = '7.71', Depth = '0.50', SampleDepth = '0.50', Secchi = '0.50', TurbidityYSI = '7.56', TurbidityHach = '2.78', CollectionTime = '1224', PercentDissolvedOxygen = '94.3' where SampleEventWQID like 'LWCOLL_20230307_1_0312_1_01'
UPDATE dbo.Dermo set DataStatus = 'Proofed', DateProofed = '2024-05-31 00:00:00', ProofedBy = 'Madeline Payne' where SampleEventID like 'CRCOLL_202303%'
UPDATE dbo.Dermo set DataStatus = 'Proofed', DateProofed = '2024-05-31 00:00:00', ProofedBy = 'Madeline Payne' where SampleEventID like 'LWCOLL_202303%'
UPDATE dbo.SampleEventWQ set DataStatus = 'Proofed', DateProofed = '2024-05-31 00:00:00', ProofedBy = 'Madeline Payne' where SampleEventID like 'LWCOLL_202303%'
UPDATE dbo.Dermo set DataStatus = 'Proofed', DateProofed = '2024-05-31 00:00:00', ProofedBy = 'Madeline Payne' where SampleEventID like 'LXCOLL_202303%'


--November 2024 data checks
--Rcrt all 11/2024
UPDATE [dbo].[Recruitment]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Ret delayed due to H Helene and Milton' else ', Ret delayed due to H Helene and Milton' end)
where [SampleEventID] like 'TBRCRT_202411%'
--Correct trip date for LX and LW 12/2024
UPDATE [dbo].[TripInfo] set TripID = REPLACE(TripID, '20241205', '20241204') where TripID like 'LWRCRT_20241205%' or TripID like 'LXRCRT_20241205%'
UPDATE [dbo].[TripInfo] set TripDate = REPLACE(TripDate, '2012-12-05', '2024-12-04') where TripID like 'LWRCRT_20241204%' or TripID like 'LXRCRT_20241204%'
UPDATE [dbo].[SampleEvent] set TripID = REPLACE(TripID, '20241205', '20241204') where TripID like 'LWRCRT_20241205%' or TripID like 'LXRCRT_20241205%'
UPDATE [dbo].[SampleEvent] set SampleEventID = REPLACE(SampleEventID, '20241205', '20241204') where TripID like 'LWRCRT_20241204%' or TripID like 'LXRCRT_20241204%'
UPDATE [dbo].[SampleEventWQ] set SampleEventID = REPLACE(SampleEventID, '20241205', '20241204') where SampleEventID like 'LWRCRT_20241205%' or SampleEventID like 'LXRCRT_20241205%'
UPDATE [dbo].[SampleEventWQ] set SampleEventWQID = REPLACE(SampleEventWQID, '20241205', '20241204') where SampleEventID like 'LWRCRT_20241204%' or SampleEventID like 'LXRCRT_20241204%'
UPDATE [dbo].[Recruitment] set SampleEventID = REPLACE(SampleEventID, '20241205', '20241204') where SampleEventID like 'LWRCRT_20241205%' or SampleEventID like 'LXRCRT_20241205%'
UPDATE [dbo].[Recruitment] set ShellID = REPLACE(ShellID, '20241205', '20241204') where SampleEventID like 'LWRCRT_20241204%' or SampleEventID like 'LXRCRT_20241204%'

--SDTP: LW 11-12/2024, CR 10-11/2024, TB 11/2024 
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
UPDATE [dbo].[SedimentTrap]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Ret delayed due to H Helene and Milton' else ', Ret delayed due to H Helene and Milton' end)
where [SampleEventID] like 'TBSDTP_202411%'


--Dermo: All sites 11/2024, 03-04/2023 (all data)
--Delete incorrect Trip
DELETE from [dbo].[TripInfo] where [TripID] like 'SLCOLL_20241105%'
UPDATE dbo.Dermo set TotalWeight = 17.21 where OysterID like 'LWRD2303-07'
UPDATE dbo.Dermo set ShellWetWeight = 27.95 where OysterID like 'LXND2303-10'
UPDATE dbo.SampleEventWQ set PercentDissolvedOxygen = 107.6 where SampleEventWQID like 'LXCOLL_20230308_1_0246_1_01'
UPDATE dbo.SampleEventWQ set PercentDissolvedOxygen = 102.1  where SampleEventWQID like 'LXCOLL_20230308_1_0247_1_01'
UPDATE dbo.SampleEventWQ set Depth = 0.60 where SampleEventWQID like 'SLCOLL_20230308_1_0261_1_01'
UPDATE dbo.SampleEventWQ set Depth = 0.50 where SampleEventWQID like 'SLCOLL_20230308_1_0262_1_01'
UPDATE dbo.SampleEventWQ set Depth = 0.40 where SampleEventWQID like 'SLCOLL_20230308_1_0264_1_01'
UPDATE dbo.SampleEventWQ set Depth = 0.40 where SampleEventWQID like 'SLCOLL_20230308_1_0270_1_01'
UPDATE dbo.SampleEventWQ set Depth = 0.20 where SampleEventWQID like 'SLCOLL_20230308_1_0271_1_01'
UPDATE dbo.SampleEventWQ set PercentDissolvedOxygen = 100.5 where SampleEventWQID like 'CRCOLL_20230314_1_0232_1_01'
UPDATE dbo.SampleEventWQ set PercentDissolvedOxygen = 100.3 where SampleEventWQID like 'CRCOLL_20230314_1_0233_1_01'
--Correct SWW data SLN and LWR
UPDATE [dbo].[Dermo] set ShellWetWeight = '15.72' where OysterID like 'LWRD2412-01'
UPDATE [dbo].[Dermo] set ShellWetWeight = '4.36' where OysterID like 'LWRD2412-02'
UPDATE [dbo].[Dermo] set ShellWetWeight = '11.11' where OysterID like 'LWRD2412-03'
UPDATE [dbo].[Dermo] set ShellWetWeight = '15.66' where OysterID like 'LWRD2412-04'
UPDATE [dbo].[Dermo] set ShellWetWeight = '10.29' where OysterID like 'LWRD2412-05'
UPDATE [dbo].[Dermo] set ShellWetWeight = '1.85' where OysterID like 'LWRD2412-06'
UPDATE [dbo].[Dermo] set ShellWetWeight = '1.93' where OysterID like 'LWRD2412-07'
UPDATE [dbo].[Dermo] set ShellWetWeight = '10.27' where OysterID like 'LWRD2412-08'
UPDATE [dbo].[Dermo] set ShellWetWeight = '11.03' where OysterID like 'LWRD2412-09'
UPDATE [dbo].[Dermo] set ShellWetWeight = '10.38' where OysterID like 'LWRD2412-10'
UPDATE [dbo].[Dermo] set ShellWetWeight = '2.37' where OysterID like 'LWRD2412-11'
UPDATE [dbo].[Dermo] set ShellWetWeight = '1.49' where OysterID like 'LWRD2412-12'
UPDATE [dbo].[Dermo] set ShellWetWeight = '4.1' where OysterID like 'LWRD2412-13'
UPDATE [dbo].[Dermo] set ShellWetWeight = '7.33' where OysterID like 'LWRD2412-14'
UPDATE [dbo].[Dermo] set ShellWetWeight = '11.37' where OysterID like 'LWRD2412-15'
UPDATE [dbo].[Dermo] set ShellWetWeight = '26.29' where OysterID like 'SLND2412-01'
UPDATE [dbo].[Dermo] set ShellWetWeight = '48.93' where OysterID like 'SLND2412-02'
UPDATE [dbo].[Dermo] set ShellWetWeight = '28.17' where OysterID like 'SLND2412-03'
UPDATE [dbo].[Dermo] set ShellWetWeight = '34.57' where OysterID like 'SLND2412-04'
UPDATE [dbo].[Dermo] set ShellWetWeight = '16.89' where OysterID like 'SLND2412-05'
UPDATE [dbo].[Dermo] set ShellWetWeight = '40.72' where OysterID like 'SLND2412-06'
UPDATE [dbo].[Dermo] set ShellWetWeight = '15.95' where OysterID like 'SLND2412-07'
UPDATE [dbo].[Dermo] set ShellWetWeight = '35.28' where OysterID like 'SLND2412-08'
UPDATE [dbo].[Dermo] set ShellWetWeight = '28.99' where OysterID like 'SLND2412-09'
UPDATE [dbo].[Dermo] set ShellWetWeight = '22.96' where OysterID like 'SLND2412-10'
UPDATE [dbo].[Dermo] set ShellWetWeight = '27.58' where OysterID like 'SLND2412-11'
UPDATE [dbo].[Dermo] set ShellWetWeight = '38.72' where OysterID like 'SLND2412-12'
UPDATE [dbo].[Dermo] set ShellWetWeight = '20.19' where OysterID like 'SLND2412-13'
UPDATE [dbo].[Dermo] set ShellWetWeight = '69.7' where OysterID like 'SLND2412-14'
UPDATE [dbo].[Dermo] set ShellWetWeight = '38.27' where OysterID like 'SLND2412-15'
UPDATE [dbo].[SampleEvent] set TripID = 'LWCOLL_20230307_1', DataStatus = 'Proofed', DateProofed = '2024-05-29 00:00:00', ProofedBy = 'Madeline Payne' where SampleEventID like 'LWCOLL_20230307_1_%'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = '103.2' where SampleEventWQID like 'SLCOLL_20230308_1_0270%'
UPDATE [dbo].[SampleEventWQ] set PercentDissolvedOxygen = '109.6', Depth = 0.3 where SampleEventWQID like 'SLCOLL_20230308_1_0271%'
DELETE FROM [dbo].[TripInfo] where TripID like 'SLCOLL_20240206%'
DELETE FROM [dbo].[SampleEvent] where SampleEventID like 'SLCOLL_20240306_1_0600%'
DELETE FROM [dbo].[SampleEventWQ] where SampleEventID like 'SLCOLL_20240306_1_0600%'
DELETE FROM [dbo].[ConditionIndex] where SampleEventID like 'SLCOLL_20240306_1_0600%'
DELETE FROM [dbo].[TripInfo] where TripID like 'CRCOLL_20240219%' or TripID like 'CRCOLL_20240221%'
DELETE FROM [dbo].[SampleEvent] where TripID like 'CRCOLL_20240219%' or TripID like 'CRCOLL_20240221%'
DELETE FROM [dbo].[SampleEventWQ] where SampleEventID like 'CRCOLL_20240219%' or SampleEventID like 'CRCOLL_20240221%'
--CI- TB 5/2024, 8/2024
UPDATE [dbo].[SampleEvent] set DataStatus = 'Proofed', DateProofed = '2024-09-11 00:00:00', ProofedBy = 'Lily Harmon' where TripID like 'TBCOLL_202408%'
UPDATE [dbo].[SampleEventWQ] set DataStatus = 'Proofed', DateProofed = '2024-09-11 00:00:00', ProofedBy = 'Lily Harmon' where SampleEventID like 'TBCOLL_202408%'


--Survey: December - SL, CR-none
--TB Aug 2024
UPDATE [dbo].[SurveyQuadrat] set QuadratNumber = '1', DataStatus = 'Proofed', DateProofed = '2024-11-21 00:00:00', ProofedBy = 'Lily Harmon' where QuadratID like 'TBSRVY_20240829_1_T065_1_%'
UPDATE [dbo].[SurveyQuadrat] set QuadratID = REPLACE(QuadratID, '_00', '_01') where SampleEventID like 'TBSRVY_20240829_1_T065%'
DELETE FROM [dbo].[SurveyQuadrat] where QuadratID is NULL and SampleEventID like 'TBSRVY_202408%'
UPDATE [dbo].[SurveySH] set QuadratID = REPLACE(QuadratID, '_00', '_01') where QuadratID like 'TBSRVY_20240829_1_T065%'
UPDATE [dbo].[SurveySH] set ShellHeightID = REPLACE(ShellHeightID, '_00_', '_01_'), DataStatus = 'Proofed', DateProofed = '2024-11-21 00:00:00', ProofedBy = 'Lily Harmon' where QuadratID like 'TBSRVY_20240829_1_T065%'
UPDATE [dbo].[SurveySH] set DataStatus = 'Proofed', DateProofed = '2024-11-21 00:00:00', ProofedBy = 'Lily Harmon' where QuadratID like 'TBSRVY_20240829_1_T055%'

--Cages November 2024 - none

--Data completed:
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-11-01', @CheckEnd = '2024-12-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-11-01', @CheckEnd = '2024-12-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-11-01', @CheckEnd = '2024-12-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-11-01', @CheckEnd = '2024-12-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2024-11-01', @CheckEnd = '2024-12-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-06-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-11-01', @CheckEnd = '2024-12-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-10-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2024-06-01', @CheckEnd = '2024-06-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2024-12-01', @CheckEnd = '2024-12-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2024-12-01', @CheckEnd = '2024-12-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2024-08-01', @CheckEnd = '2024-08-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-03-01', @CheckEnd = '2023-04-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-03-01', @CheckEnd = '2023-04-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-03-01', @CheckEnd = '2023-04-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-03-01', @CheckEnd = '2023-04-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-02-01', @CheckEnd = '2024-03-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-02-01', @CheckEnd = '2024-03-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-02-01', @CheckEnd = '2024-03-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-02-01', @CheckEnd = '2024-03-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-11-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-11-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2024-11-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-05-01', @CheckEnd = '2024-05-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-08-01', @CheckEnd = '2024-08-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-09-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-11-01', @CheckEnd = '2023-11-15', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
