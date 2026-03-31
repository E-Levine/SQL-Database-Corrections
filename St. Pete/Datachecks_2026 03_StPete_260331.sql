use [Oysters] --COMPLETED in Oysters 260331
go

--Updates to sex ratio samples - COMPLETED in Oysters 260303
--Update hsdb.Repro set Comments = 'Sex ratio sample' where OysterID = 'LXND2504-26'
--Update hsdb.Repro set Sex = 'M/F', ReproStage = 'Z' where OysterID = 'LXND2504-50'
--Update hsdb.Repro set Comments = '1-mat' where OysterID = 'LXND2505-35'
--Update hsdb.Repro set Comments = '0=imm' where OysterID = 'LXND2505-39' or OysterID = 'LXND2505-40' or OysterID = 'LXND2507-25'

--Add missing/incorrect random station LL:
UPDATE hsdb.SampleEvent set LatitudeDec = 27.16516, LongitudeDec = -80.2564 where FixedLocationID = 'L001'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.16891, LongitudeDec = -80.26056 where FixedLocationID = 'L002'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.15987, LongitudeDec = -80.25291 where FixedLocationID = 'L003'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.16244, LongitudeDec = -80.25765 where FixedLocationID = 'L004'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.17318, LongitudeDec = -80.25802 where FixedLocationID = 'L005'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.18403, LongitudeDec = -80.26783 where FixedLocationID = 'L006'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.194167, LongitudeDec = -80.269167 where FixedLocationID = 'L007'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.199167, LongitudeDec = -80.2675 where FixedLocationID = 'L008'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.19937, LongitudeDec = -80.26736 where FixedLocationID = 'L009'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.20514, LongitudeDec = -80.27326 where FixedLocationID = 'L010'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.20551, LongitudeDec = -80.27799 where FixedLocationID = 'L011'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.20844, LongitudeDec = -80.28346 where FixedLocationID = 'L012'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.23125, LongitudeDec = -80.30147 where FixedLocationID = 'L013'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.23653, LongitudeDec = -80.31596 where FixedLocationID = 'L014'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.23761, LongitudeDec = -80.31611 where FixedLocationID = 'L015'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.23917, LongitudeDec = -80.32083 where FixedLocationID = 'L016'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.24148, LongitudeDec = -80.31653 where FixedLocationID = 'L017'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.23592, LongitudeDec = -80.29164 where FixedLocationID = 'L018'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.22374, LongitudeDec = -80.27995 where FixedLocationID = 'L019'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.21404, LongitudeDec = -80.27465 where FixedLocationID = 'L020'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.1707, LongitudeDec = -80.20212 where FixedLocationID = 'L021'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.18399, LongitudeDec = -80.20572 where FixedLocationID = 'L022'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.19052, LongitudeDec = -80.21 where FixedLocationID = 'L023'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.20442, LongitudeDec = -80.2269 where FixedLocationID = 'L024'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.20124, LongitudeDec = -80.23564 where FixedLocationID = 'L025'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.20133, LongitudeDec = -80.24484 where FixedLocationID = 'L026'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.19997, LongitudeDec = -80.24709 where FixedLocationID = 'L027'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.19923, LongitudeDec = -80.24736 where FixedLocationID = 'L028'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.20951, LongitudeDec = -80.25625 where FixedLocationID = 'L029'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.20982, LongitudeDec = -80.25868 where FixedLocationID = 'L030'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.21005, LongitudeDec = -80.2596 where FixedLocationID = 'L031'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.21441, LongitudeDec = -80.25365 where FixedLocationID = 'L032'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.21417, LongitudeDec = -80.2325 where FixedLocationID = 'L033'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.21572, LongitudeDec = -80.23274 where FixedLocationID = 'L034'
UPDATE hsdb.SampleEvent set LatitudeDec = 27.21931, LongitudeDec = -80.2265 where FixedLocationID = 'L035'
UPDATE hsdb.SampleEvent set LongitudeDec = -81.922790 where SampleEventID = 'CRSRVY_20240220_1_C030_1'
UPDATE hsdb.SampleEvent set LatitudeDec = 26.49544, LongitudeDec = -82.00494 where SampleEventID = 'CRSRVY_20240812_1_C052_1'

--Correct survey '0' shell heights
UPDATE hsdb.SurveySH set ShellHeight = NULL where ShellHeight = 0

-- LW SDTP 03/2026
-- Update filter DW where < filter WW
UPDATE dbo.SedimentTrap set FilterDryWeight = 3.03 where CupSampleID = 'LWL2603-02-3'
UPDATE dbo.SedimentTrap set FilterDryWeight = 2.98 where CupSampleID = 'LWL2603-02-4'
UPDATE dbo.SedimentTrap set FilterDryWeight = 3.06 where CupSampleID = 'LWR2603-04-4'

-- RCRT: LW, SL, LX, CR - GOOD.

-- COLL: LW, SL, LX, CR
UPDATE dbo.Dermo set TotalWeight = 28.52 where OysterID = 'LWRD2603-15'
UPDATE [dbo].[Dermo] set Comments = CONCAT('Sex ratio project sample ', Comments) where OysterID = 'LXND2603-16' or OysterID = 'LXND2603-17' or OysterID = 'LXND2603-18' or 
	OysterID = 'LXND2603-19' or OysterID like 'LXND2603-2%' or OysterID like 'LXND2603-3%' or OysterID like 'LXND2603-4%'
UPDATE dbo.SampleEventWQ set SampleDepth = 0.58 where SampleEventWQID = 'CRCOLL_20260317_1_0230_1_01'

-- SRVY: CR
INSERT INTO dbo.[SurveySH] 
	(ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
	VALUES 
	('CRSRVY_20260317_1_0230_1_03_001', 'CRSRVY_20260317_1_0230_1_03', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, 'Entered vis SMSS', NULL)
INSERT INTO dbo.[SurveySH] 
	(ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) 
	VALUES 
	('CRSRVY_20260317_1_0230_1_04_001', 'CRSRVY_20260317_1_0230_1_04', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, 'Entered vis SMSS', NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LWSRVY_20260310_1_0235_1_01_001', 'LWSRVY_20260310_1_0235_1_01', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LWSRVY_20260310_1_0235_1_02_001', 'LWSRVY_20260310_1_0235_1_02', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LWSRVY_20260310_1_0235_1_03_001', 'LWSRVY_20260310_1_0235_1_03', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LWSRVY_20260310_1_0235_1_04_001', 'LWSRVY_20260310_1_0235_1_04', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LWSRVY_20260310_1_0235_1_07_001', 'LWSRVY_20260310_1_0235_1_07', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LWSRVY_20260310_1_0235_1_10_001', 'LWSRVY_20260310_1_0235_1_10', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LWSRVY_20260310_1_0235_1_12_001', 'LWSRVY_20260310_1_0235_1_12', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LWSRVY_20260310_1_0235_1_13_001', 'LWSRVY_20260310_1_0235_1_13', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LWSRVY_20260310_1_0235_1_15_001', 'LWSRVY_20260310_1_0235_1_15', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LWSRVY_20260310_1_0237_1_01_001', 'LWSRVY_20260310_1_0237_1_01', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LWSRVY_20260310_1_0237_1_03_001', 'LWSRVY_20260310_1_0237_1_03', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LWSRVY_20260310_1_0237_1_04_001', 'LWSRVY_20260310_1_0237_1_04', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LWSRVY_20260310_1_0237_1_05_001', 'LWSRVY_20260310_1_0237_1_05', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LWSRVY_20260310_1_0237_1_08_001', 'LWSRVY_20260310_1_0237_1_08', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LWSRVY_20260310_1_0237_1_15_001', 'LWSRVY_20260310_1_0237_1_15', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('SLSRVY_20260311_1_0269_1_08_001', 'SLSRVY_20260311_1_0269_1_08', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('SLSRVY_20260311_1_0269_1_09_001', 'SLSRVY_20260311_1_0269_1_09', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LXSRVY_20260311_1_0247_1_03_001', 'LXSRVY_20260311_1_0247_1_03', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LXSRVY_20260311_1_0247_1_09_001', 'LXSRVY_20260311_1_0247_1_09', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LXSRVY_20260311_1_0247_1_11_001', 'LXSRVY_20260311_1_0247_1_11', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LXSRVY_20260311_1_0249_1_02_001', 'LXSRVY_20260311_1_0249_1_02', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LXSRVY_20260311_1_0249_1_03_001', 'LXSRVY_20260311_1_0249_1_03', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LXSRVY_20260311_1_0249_1_04_001', 'LXSRVY_20260311_1_0249_1_04', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LXSRVY_20260311_1_0249_1_06_001', 'LXSRVY_20260311_1_0249_1_06', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LXSRVY_20260311_1_0249_1_09_001', 'LXSRVY_20260311_1_0249_1_09', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LXSRVY_20260311_1_0249_1_10_001', 'LXSRVY_20260311_1_0249_1_10', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LXSRVY_20260311_1_0249_1_11_001', 'LXSRVY_20260311_1_0249_1_11', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('SLSRVY_20260311_1_0264_1_09_001', 'SLSRVY_20260311_1_0264_1_09', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LXSRVY_20260312_1_0243_1_01_001', 'LXSRVY_20260312_1_0243_1_01', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LXSRVY_20260312_1_0243_1_04_001', 'LXSRVY_20260312_1_0243_1_04', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LXSRVY_20260312_1_0243_1_08_001', 'LXSRVY_20260312_1_0243_1_08', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LXSRVY_20260312_1_0243_1_10_001', 'LXSRVY_20260312_1_0243_1_10', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LXSRVY_20260312_1_0243_1_12_001', 'LXSRVY_20260312_1_0243_1_12', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[SurveySH] (ShellHeightID, QuadratID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes) VALUES ('LXSRVY_20260312_1_0243_1_14_001', 'LXSRVY_20260312_1_0243_1_14', NULL, 'Proofed', '2026-03-31 00:00:00', 'Erica Williams', '2026-03-31 00:00:00', 'Erica Williams', NULL, NULL, NULL, NULL)
UPDATE dbo.SurveyQuadrat set DataStatus = 'Proofed', DateProofed = '2026-03-25 00:00:00.0000000', ProofedBy = 'Olivia Schlei' where QuadratID = 'SLSRVY_20260311_1_0262_1_04'
UPDATE dbo.SurveySH set DataStatus = 'Proofed', DateProofed = '2026-03-25 00:00:00.0000000', ProofedBy = 'Olivia Schlei' where QuadratID = 'SLSRVY_20260311_1_0262_1_04'

-- Cage data
Delete from CageSH where ShellHeight = ''

-- Data completed:
EXECUTE [dbo].[spChecksSediment] @CheckStart = '2026-03-01', @CheckEnd = '2026-03-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-03-01', @CheckEnd = '2026-03-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-03-01', @CheckEnd = '2026-03-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-03-01', @CheckEnd = '2026-03-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-03-01', @CheckEnd = '2026-03-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2026-03-01', @CheckEnd = '2026-03-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2026-03-01', @CheckEnd = '2026-03-30', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2026-03-01', @CheckEnd = '2026-03-30', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2026-03-01', @CheckEnd = '2026-03-30', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksSurvey] @CheckStart = '2026-03-01', @CheckEnd = '2026-03-30', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-03-01', @CheckEnd = '2026-03-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-03-01', @CheckEnd = '2026-03-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2026-03-01', @CheckEnd = '2026-03-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';