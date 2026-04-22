use [Oysters] --COMPLETED 04/22/2026
go


INSERT INTO [hsdb].[SampleEvent]
    ([SampleEventID],
    [TripID],
    [FixedLocationID],
    [LatitudeDec],
    [LongitudeDec],
    [LatDec],
    [LatMin],
    [LongDec],
    [LongMin],
    [NumDrills],
    [HarvestStatus],
    [DataStatus],
    [DateEntered],
    [EnteredBy],
    [DateProofed],
    [ProofedBy],
    [DateCompleted],
    [CompletedBy],
    [Comments],
    [AdminNotes]
)
  VALUES
      ('LXRCRT_20260210_1_0249_1',
      'LXRCRT_20260210_1',
      '0249',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO

 INSERT INTO [hsdb].[SampleEventWQ]
    ([SampleEventWQID]
,[SampleEventID]
,[Temperature]
,[Salinity]
,[DissolvedOxygen]
,[pH]
,[Depth]
,[SampleDepth]
,[Secchi]
,[TurbidityYSI]
,[TurbidityHach]
,[DataStatus]
,[DateEntered]
,[EnteredBy]
,[DateProofed]
,[ProofedBy]
,[DateCompleted]
,[CompletedBy]
,[Comments]
,[AdminNotes]
,[CollectionTime]
,[PercentDissolvedOxygen]
,[YSICalibration]
,[YSINotes]
)
  VALUES
      ('LXRCRT_20260210_1_0249_1_01'
      ,'LXRCRT_20260210_1_0249_1'
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,'WQ same as dermo'
      ,NULL
      ,NULL
      ,NULL
      ,'Y'
      ,NULL
)
 GO

INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_01'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,1
      ,1
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_02'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,1
      ,2
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_03'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,1
      ,3
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_04'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,1
      ,4
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_05'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,1
      ,5
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_06'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,1
      ,6
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_07'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,1
      ,7
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_08'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,1
      ,8
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_09'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,1
      ,9
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_10'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,1
      ,10
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_11'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,1
      ,11
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_12'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,1
      ,12
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_13'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,2
      ,1
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_14'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,2
      ,2
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_15'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,2
      ,3
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_16'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,2
      ,4
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_17'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,2
      ,5
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_18'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,2
      ,6
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_19'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,2
      ,7
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_20'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,2
      ,8
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_21'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,2
      ,9
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_22'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,2
      ,10
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_23'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,2
      ,11
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_24'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,2
      ,12
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_25'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,3
      ,1
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_26'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,3
      ,2
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_27'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,3
      ,3
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_28'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,3
      ,4
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_29'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,3
      ,5
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_30'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,3
      ,6
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_31'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,3
      ,7
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_32'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,3
      ,8
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_33'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,3
      ,9
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_34'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,3
      ,10
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_35'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,3
      ,11
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO


INSERT INTO [hsdb].[Recruitment]
    ([ShellID]
      ,[SampleEventID]
      ,[DeployedDate]
      ,[ShellReplicate]
      ,[ShellPosition]
      ,[NumTop]
      ,[NumBottom]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES
      ('LXRCRT_20260210_1_0249_1_36'
      ,'LXRCRT_20260210_1_0249_1'
      ,'2026-01-06'
      ,3
      ,12
      ,0
      ,0
      ,'Completed'
      ,'2026-04-22 00:00:00'
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,' 2026-04-22 00:00:00 '
      ,'Erica Williams'
      ,NULL
      ,'Added via SMSS')
 GO
