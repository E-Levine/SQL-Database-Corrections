
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
      ('I110'
      ,'WC'
      ,'C'
      ,'WII10'
      ,'10'
      ,'29.02136'
      ,'-82.74877'
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
      ,'GOATS'
      ,'datalogger upload FixedLocationID'
      ,'WII10-I10'
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
      ('WCSRVY_20260212_1_I110_1'
      ,'WCSRVY_20260212_1'
      ,'I110'
      ,'29.02136'
      ,'-82.74877'
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
      ('WCSRVY_20260212_1_I110_1_01'
      ,'WCSRVY_20260212_1_I110_1'
      ,'16'
      ,'19.26'
      ,'8.49'
      ,'7.87'
      ,'0.5'
      ,'1.04'
      ,'Proofed'
      ,'2026-04-22 00:00:00.000'
      ,'Tomena Scholze'
      ,'2026-04-22 00:00:00.000'
      ,'Tomena Scholze'
      ,'Notes = GOATS DPTH_STRTA = I BOTTOM_TYP = OY Class = PD'
      ,'1040')
 GO
