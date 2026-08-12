use [Oysters] -- COMPLETED in Oysters 260601
go

--Add new TB station - COMPLETED in OYSTERS 260429
--INSERT INTO FixedLocations (
 --FixedLocationID, Estuary, SectionName, StationName, StationNumber, ParcelName, ParcelArea, CultchDensity, LatitudeDec,	LongitudeDec,
 --Recruitment, Survey, Sediment, Collections, ShellBudget, Dataloggers, Cage, Wave, StartDate, EndDate,
 --DataStatus, DateEntered, EnteredBy, DateProofed,ProofedBy,	DateCompleted, CompletedBy, Comments, AdminNotes, StationNameNumber, EstuaryLongName, DateLastCultched
 --)
 --VALUES (
 --'0401', 'TB', 'R', 'TB Braden South', '9', NULL, NULL, NULL, 27.49570,	82.52368,
 --'N', 'N', 'N', 'Y', 'N', 'Y', 'N', 'N', '2026-04-01', '2099-12-31',
 --'Proofed', '2026-04-29 00:00:00.0000000', 'Erica Williams', '2026-04-29 00:00:00.0000000', 'Erica Williams', NULL, NULL, 'Sex ratio project station', 'Added via SMSS for sex ratio project samples', 'TB Braden South 9', 'Tampa Bay', NULL
 --)

 -- COLL 05/2026 -DONE: SL, LW, LX, CR
 -- RCRT 05/2026 -DONE: SL, LW, LX, CR
 UPDATE SampleEventWQ set Depth = 3.01 where SampleEventWQID = 'TBRCRT_20260521_1_0529_1_01'

 -- SDTP 05/2026 LW - DONE
 -- CAGE 05/2026 -DONE: SL, LX, CR


EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-05-01', @CheckEnd = '2026-05-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-05-01', @CheckEnd = '2026-05-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-05-01', @CheckEnd = '2026-05-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-05-01', @CheckEnd = '2026-05-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-05-01', @CheckEnd = '2026-05-28', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2026-05-01', @CheckEnd = '2026-05-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-05-01', @CheckEnd = '2026-05-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-05-01', @CheckEnd = '2026-05-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-05-01', @CheckEnd = '2026-05-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';