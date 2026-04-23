
INSERT INTO [dbo].[FixedLocations]
           ([FixedLocationID]
           ,[Estuary]
           ,[SectionName]
           ,[StationName]
           ,[StationNumber]
           ,[LatitudeDec]
           ,[LongitudeDec]
           ,[Recruitment]
           ,[Survey]
           ,[Sediment]
           ,[Collections]
           ,[ShellBudget]
           ,[Dataloggers]
           ,[Cage]
           ,[Wave]
           ,[StartDate]
           ,[EndDate]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[Comments]
           ,[AdminNotes]
           ,[StationNameNumber]
           ,[EstuaryLongName])
VALUES
      ('I111'
      ,'WC'
      ,'C'
      ,'WII4'
      ,'4'
      ,'29.03055'
      ,'-82.73974'
      ,'N'
      ,'Y'
      ,'N'
      ,'N'
      ,'N'
      ,'N'
      ,'N'
      ,'N'
      ,'2026-02-12'
      ,'2026-02-12'
      ,'Proofed'
      ,'2026-04-22 00:00:00.000'
      ,'Tomena Scholze'
      ,'2026-04-22 00:00:00.000'
      ,'Tomena Scholze'
      ,NULL
      ,'datalogger upload FixedLocationID'
      ,'WII4-I4'
      ,'Withlacoochee/Crystal River')
 GO


INSERT INTO [dbo].[SampleEvent]
           ([SampleEventID]
           ,[TripID]
           ,[FixedLocationID]
           ,[LatitudeDec]
           ,[LongitudeDec]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy])
     VALUES
      ('WCSRVY_20260212_1_I111_1'
      ,'WCSRVY_20260212_1'
      ,'I111'
      ,'29.03055'
      ,'-82.73974'
      ,'Proofed'
      ,'2026-04-22 00:00:00.000'
      ,'Tomena Scholze'
      ,'2026-04-22 00:00:00.000'
      ,'Tomena Scholze')
 GO


INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[Comments]
           ,[CollectionTime])
     VALUES
      ('WCSRVY_20260212_1_I111_1_01'
      ,'WCSRVY_20260212_1_I111_1'
      ,'16.4'
      ,'23.22'
      ,'7.53'
      ,'7.76'
      ,'0.5'
      ,'1.57'
      ,'Proofed'
      ,'2026-04-22 00:00:00.000'
      ,'Tomena Scholze'
      ,'2026-04-22 00:00:00.000'
      ,'Tomena Scholze'
      ,'DPTH_STRTA = I BOTTOM_TYP = OY Class = PD'
      ,'1201')
 GO
