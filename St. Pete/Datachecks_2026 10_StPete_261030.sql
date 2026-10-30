use [Oysters] --COMPLETED IN OYSTERS 10/30/26
go

--CAGE 09-10:
--Add missing SH data row
INSERT INTO [dbo].[CageSH] (ShellHeightID, CageCountID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('CRCAGE_20261013_1_0233_1_R_R_01', 'CRCAGE_20261013_1_0233_1_R_R', NULL, 'Proofed', '2026-10-30 00:00:00', 'Erica Williams', '2026-10-30 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
--Add missing deployed counts
UPDATE CageCount set TotalCount = 30 where CageCountID = 'SLCAGE_20261007_1_0256_1_D_B'
UPDATE CageCount set TotalCount = 30 where CageCountID = 'SLCAGE_20261007_1_0256_1_D_R'
UPDATE CageCount set TotalCount = 30 where CageCountID = 'SLCAGE_20261007_1_0256_1_D_Y'

--SDTP 09-10: GOOD.
--RCRT 09-10: GOOD.
--COLL: 09-10. GOOD. Finish 09. 10 needs Repro. TB not checked.
--SRVY: 09.
--Rows not marked as Proofed
update dbo.SampleEventWQ set DataStatus = 'Proofed', DateProofed = '2026-09-21 00:00:00', ProofedBy = 'Celia Smith' where SampleEventWQID = 'LXSRVY_20260903_1_0249_1_01'
update dbo.SurveyQuadrat set DataStatus = 'Proofed', DateProofed = '2026-09-11 00:00:00', ProofedBy = 'Celia Smith', Comments = '' 
	where QuadratID like 'LXSRVY_20260902_1_0242%' or QuadratID like 'LXSRVY_20260902_1_0243%' or QuadratID like 'LXSRVY_20260903_1_0246%' or QuadratID like 'LXSRVY_20260903_1_0247%' 
		or QuadratID like 'LWSRVY_20260901_1_0236%'
		or QuadratID like 'SLSRVY_20260902_1_0255_1%' or QuadratID like 'SLSRVY_20260902_1_0261_1%' or QuadratID like 'SLSRVY_20260902_1_0264_1%'
update dbo.SurveySH set DataStatus = 'Proofed', DateProofed = '2026-09-11 00:00:00', ProofedBy = 'Celia Smith', Comments = ''
	where QuadratID like 'LWSRVY_20260901_1_0236_1_09%' 
	or QuadratID like 'LXSRVY_20260902_1_0242_1_07%' or QuadratID like 'LXSRVY_20260902_1_0243_1_01%' or QuadratID like 'LXSRVY_20260903_1_0246_1_09%' or QuadratID like 'LXSRVY_20260903_1_0247%'
	or QuadratID like 'SLSRVY_20260902_1_0255_1_05%' or QuadratID like 'SLSRVY_20260902_1_0261%' or QuadratID like 'SLSRVY_20260902_1_0264_1_13%'



EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-09-01', @CheckEnd = '2026-10-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-09-01', @CheckEnd = '2026-10-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-09-01', @CheckEnd = '2026-10-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2026-09-01', @CheckEnd = '2026-10-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-09-01', @CheckEnd = '2026-10-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-09-01', @CheckEnd = '2026-10-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-09-01', @CheckEnd = '2026-10-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-09-01', @CheckEnd = '2026-10-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2026-09-01', @CheckEnd = '2026-09-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2026-09-01', @CheckEnd = '2026-09-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2026-09-01', @CheckEnd = '2026-09-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2026-09-01', @CheckEnd = '2026-09-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2026-09-01', @CheckEnd = '2026-09-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2026-09-01', @CheckEnd = '2026-09-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2026-09-01', @CheckEnd = '2026-09-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2026-09-01', @CheckEnd = '2026-09-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';