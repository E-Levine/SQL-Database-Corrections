
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
      ('I125'
      ,'WC'
      ,'C'
      ,'WII3'
      ,'3'
      ,'29.01171'
      ,'-82.75816'
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
      ,'O ROCK'
      ,'datalogger upload FixedLocationID'
      ,'WII3-I3'
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
      ('WCSRVY_20260212_1_I125_1'
      ,'WCSRVY_20260212_1'
      ,'I125'
      ,'29.01171'
      ,'-82.75816'
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
      ('WCSRVY_20260212_1_I125_1_01'
      ,'WCSRVY_20260212_1_I125_1'
      ,'0'
      ,'0'
      ,'0'
      ,'0'
      ,'0'
      ,'0'
      ,'Proofed'
      ,'2026-04-22 00:00:00.000'
      ,'Tomena Scholze'
      ,'2026-04-22 00:00:00.000'
      ,'Tomena Scholze'
      ,'Notes = O ROCK DPTH_STRTA = I BOTTOM_TYP = OY Class = PD'
      ,'1019')
 GO
