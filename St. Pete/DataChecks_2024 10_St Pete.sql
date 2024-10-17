use [Oysters_24-10-17]
go

--Repro checks 07-08/2024, 04-05/2024, 04/2023
DELETE FROM [dbo].[TripInfo] where [TripID] like 'SLCOLL_20240410_2' 
UPDATE [dbo].[SampleEventWQ] set [SampleDepth] = '0.65' where [SampleEventWQID] like 'SLCOLL_20230405_1_0269_1_01'


EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-04-01', @CheckEnd = '2023-04-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-04-01', @CheckEnd = '2023-04-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-04-01', @CheckEnd = '2023-04-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2023-04-01', @CheckEnd = '2023-04-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-07-01', @CheckEnd = '2024-08-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-07-01', @CheckEnd = '2024-08-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-07-01', @CheckEnd = '2024-08-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-07-01', @CheckEnd = '2024-08-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';
--EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-04-01', @CheckEnd = '2024-05-30', @EstuaryCode = 'SL', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-04-01', @CheckEnd = '2024-05-30', @EstuaryCode = 'LX', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-04-01', @CheckEnd = '2024-05-30', @EstuaryCode = 'LW', @DataManager = 'Erica Levine';
EXECUTE [dbo].[spChecksCollections] @CheckStart = '2024-04-01', @CheckEnd = '2024-05-30', @EstuaryCode = 'CR', @DataManager = 'Erica Levine';