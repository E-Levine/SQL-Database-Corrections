use [Oysters_25-03-28] 
go

--RCRT 03/2025 - TB, SL, LX, LW, CR
UPDATE [dbo].[SampleEventWQ]
set Comments = 'WQ same as dermo' 
WHERE SampleEventWQID like 'TBRCRT_20250313_1_0529_1_%'

--DERMO 03/20525 - SL, LX, LW, CR
DELETE from [dbo].[TripInfo] WHERE TripID like 'LWCOLL_20250318_1'
UPDATE [dbo].[Dermo] set ShellWetWeight = '9.57' WHERE OysterID like 'LXSD2503-10'
UPDATE [dbo].[Dermo] set ShellWetWeight = '16.98' WHERE OysterID like 'SLCD2503-15'
--Change SLS3 samples to 11-15 and SLS2 to 6-10
UPDATE [dbo].[Dermo] set OysterID = 'SLSD2503-16' where OysterID like 'SLSD2503-06'
UPDATE [dbo].[Dermo] set OysterID = 'SLSD2503-17' where OysterID like 'SLSD2503-07'
UPDATE [dbo].[Dermo] set OysterID = 'SLSD2503-18' where OysterID like 'SLSD2503-08'
UPDATE [dbo].[Dermo] set OysterID = 'SLSD2503-19' where OysterID like 'SLSD2503-09'
UPDATE [dbo].[Dermo] set OysterID = 'SLSD2503-20' where OysterID like 'SLSD2503-10'
UPDATE [dbo].[Dermo] set OysterID = 'SLSD2503-06', Comments = 'Samples for SLS3 collected from SLS1' where OysterID like 'SLSD2503-11'
UPDATE [dbo].[Dermo] set OysterID = 'SLSD2503-07', Comments = 'Samples for SLS3 collected from SLS1' where OysterID like 'SLSD2503-12'
UPDATE [dbo].[Dermo] set OysterID = 'SLSD2503-08', Comments = 'Samples for SLS3 collected from SLS1' where OysterID like 'SLSD2503-13'
UPDATE [dbo].[Dermo] set OysterID = 'SLSD2503-09', Comments = 'Samples for SLS3 collected from SLS1' where OysterID like 'SLSD2503-14'
UPDATE [dbo].[Dermo] set OysterID = 'SLSD2503-10', Comments = 'Samples for SLS3 collected from SLS1' where OysterID like 'SLSD2503-15'
UPDATE [dbo].[Dermo] set OysterID = 'SLSD2503-11', Comments = 'Samples for SLS3 collected from SLS1' where OysterID like 'SLSD2503-16'
UPDATE [dbo].[Dermo] set OysterID = 'SLSD2503-12', Comments = 'Samples for SLS3 collected from SLS1' where OysterID like 'SLSD2503-17'
UPDATE [dbo].[Dermo] set OysterID = 'SLSD2503-13', Comments = 'Samples for SLS3 collected from SLS1' where OysterID like 'SLSD2503-18'
UPDATE [dbo].[Dermo] set OysterID = 'SLSD2503-14', Comments = 'Samples for SLS3 collected from SLS1' where OysterID like 'SLSD2503-19'
UPDATE [dbo].[Dermo] set OysterID = 'SLSD2503-25', Comments = 'Samples for SLS3 collected from SLS1' where OysterID like 'SLSD2503-20'

EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-03-01', @CheckEnd = '2025-03-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-03-01', @CheckEnd = '2025-03-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-03-01', @CheckEnd = '2025-03-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-03-01', @CheckEnd = '2025-03-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-03-01', @CheckEnd = '2025-03-28', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';