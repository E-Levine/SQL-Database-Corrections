use [Oysters_Dec]
go

--HSDB SURVRY checks
--TB SRVY 2016, 2017, 2018
UPDATE [hsdb].[SampleEventWQ] set [Comments] = CONCAT(Comments, case when Comments is null then 'PctDO not recorded' else ', PctDO not recorded' end) where SampleEventID like 'TBSRVY_2016%' or SampleEventID like 'TBSRVY_2017%' or SampleEventID like 'TBSRVY_2018%'
INSERT INTO [hsdb].[SurveySH] 
(ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
VALUES 
('TBSRVY_20170905_1_0291_1_01_050', 'TBSRVY_20170905_1_0291_1_01', 16, 'Proofed', '2024-12-20 00:00:00', 'Erica Levine', '2024-12-20 00:00:00', 'Erica Levine', NULL, NULL, 'Entered vis SMSS', NULL)

--TB SRVY 2019 - missing SHS
--Run TB_SRVY_SRVYSH_2019_EW
UPDATE [hsdb].[SampleEventWQ] set [Comments] = CONCAT(Comments, case when Comments is null then 'PctDO not recorded' else ', PctDO not recorded' end) where SampleEventID like 'TBSRVY_2019%'

EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2016-01-01', @CheckEnd = '2019-12-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';