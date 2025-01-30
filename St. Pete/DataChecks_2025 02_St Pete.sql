use [Oysters_25-01-30]
go

UPDATE [hsdb].[CageCount]
set [DateProofed] = '2025-01-30 00:00:00', [ProofedBy] = 'Erica Levine'
where [SampleEventID] like  'CRCAGE_20240813_1_0231_1'

INSERT INTO [hsdb].[CageSH](ShellHeightID, CageCountID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, Comments)
VALUES