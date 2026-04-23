
INSERT INTO [dbo].[SurveyQuadrat]
           ([QuadratID]
           ,[SampleEventID]
           ,[QuadratNumber]
           ,[NumLive]
           ,[NumDead]
           ,[TotalVolume]
           ,[TotalWeight]
           ,[NumDrills]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[Comments]
           ,[NumLegal])
     VALUES
      ('WCSRVY_20260212_1_I126_1_01'
      ,'WCSRVY_20260212_1_I126_1'
      ,'1'
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,'Proofed'
      ,'2026-04-22 00:00:00.000'
      ,'Tomena Scholze'
      ,'2026-04-22 00:00:00.000'
      ,'Tomena Scholze'
      ,'Notes = No Quad data recorded; 1 Class = CA'
      ,NULL)
 GO

INSERT INTO [dbo].[SurveySH]
           ([ShellHeightID]
           ,[QuadratID]
           ,[ShellHeight]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[Comments])
     VALUES
      ('WCSRVY_20260212_1_I126_1_01_001'
      ,'WCSRVY_20260212_1_I126_1_01'
      ,NULL
      ,'Proofed'
      ,'2026-04-22 00:00:00.000'
      ,'Tomena Scholze'
      ,'2026-04-22 00:00:00.000'
      ,'Tomena Scholze'
      ,NULL)
 GO
