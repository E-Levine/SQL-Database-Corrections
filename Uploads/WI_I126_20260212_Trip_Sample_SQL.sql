
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
      ('I126'
      ,'WC'
      ,'C'
      ,'WII12'
      ,'12'
      ,'29.01577'
      ,'-82.75747'
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
      ,'MUD'
      ,'datalogger upload FixedLocationID'
      ,'WII12-I12'
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
      ('WCSRVY_20260212_1_I126_1'
      ,'WCSRVY_20260212_1'
      ,'I126'
      ,'29.01577'
      ,'-82.75747'
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
      ('WCSRVY_20260212_1_I126_1_01'
      ,'WCSRVY_20260212_1_I126_1'
      ,'0'
      ,'0'
      ,'0'
      ,'0'
      ,'1.25'
      ,'0'
      ,'Proofed'
      ,'2026-04-22 00:00:00.000'
      ,'Tomena Scholze'
      ,'2026-04-22 00:00:00.000'
      ,'Tomena Scholze'
      ,'Notes = MUD DPTH_STRTA = I BOTTOM_TYP = MU Class = CA'
      ,'1030')
 GO
