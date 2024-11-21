use [Oysters_24-11-21]
go

--November 2024 data checks
--Rcrt all 11/2024
UPDATE [dbo].[Recruitment]
set [Comments] = CONCAT(Comments, case when Comments is null then 'Ret delayed due to H Helene and Milton' else ', Ret delayed due to H Helene and Milton' end)
where [SampleEventID] like 'TBRCRT_202411%'

--SDTP: LW 11/2024, CR 10-11/2024: None 

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
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-11-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-11-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-11-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-11-01', @CheckEnd = '2024-11-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';