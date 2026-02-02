--January 2026 data checks:

use [Oysters_26-01-28]
go

--Quarterly repro data: DONE
-- Dermo data: SL, CR, LW DONE
--Add comments to LX extra samples
UPDATE [dbo].[Dermo] set Comments = CONCAT('Sex ratio project sample ', Comments) where OysterID = 'LXND2601-16' or OysterID = 'LXND2601-17' or OysterID = 'LXND2601-18' or 
	OysterID = 'LXND2601-19' or OysterID like 'LXND2601-2%' or OysterID like 'LXND2601-3%' or OysterID like 'LXND2601-4%'

--RCRT data: SL, LX, LW, CR DONE
--TB WQ correct surface vs depth:
UPDATE dbo.SampleEventWQ 
	set Temperature = '19.5', Salinity = '30.43', DissolvedOxygen = '7.70', pH = '7.91', Depth = '2.75', SampleDepth = '0.3',
	TurbidityHach = '0.94', PercentDissolvedOxygen = '100.30'
	where SampleEventWQID = 'TBRCRT_20260114_1_0529_1_01'	
UPDATE dbo.SampleEventWQ 
	set Temperature = '19.8', Salinity = '30.32', DissolvedOxygen = '7.60', pH = '7.90', SampleDepth = '0.30',
	TurbidityYSI =	'1.10', PercentDissolvedOxygen = '99.50'
	where SampleEventWQID = 'TBRCRT_20260114_1_0529_1_02'

-- LW SDTP DONE
-- CAGE SL, LX, CR 01/2026 DONE

-- LW dermo data correction
UPDATE [hsdb].[Dermo]
	set ShellHeight = 46.01
	where OysterID = 'LXSD2203-09'

EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-11-01', @CheckEnd = '2025-12-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-11-01', @CheckEnd = '2025-12-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-11-01', @CheckEnd = '2025-12-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2025-11-01', @CheckEnd = '2025-12-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-01-01', @CheckEnd = '2026-01-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-01-01', @CheckEnd = '2026-01-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-01-01', @CheckEnd = '2026-01-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-01-01', @CheckEnd = '2026-01-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-01-01', @CheckEnd = '2026-01-30', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2026-01-01', @CheckEnd = '2026-01-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-01-01', @CheckEnd = '2026-01-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-01-01', @CheckEnd = '2026-01-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-01-01', @CheckEnd = '2026-01-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';