use [Oysters] --Completed 2/27/25 EW
go

UPDATE [hsdb].[CageCount]
set [DateProofed] = '2025-01-30 00:00:00', [ProofedBy] = 'Erica Levine'
where [SampleEventID] like  'CRCAGE_20240813_1_0231_1'
UPDATE [hsdb].[CageSH]
set ShellHeight = '69'
where [ShellHeightID] like 'CRCAGE_20240813_1_0231_1_R_B_16'

INSERT INTO [hsdb].[CageSH](ShellHeightID, CageCountID, ShellHeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments)
VALUES('CRCAGE_20240813_1_0231_1_D_R_01', 'CRCAGE_20240813_1_0231_1_D_R', '67', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_02', 'CRCAGE_20240813_1_0231_1_D_R', '77', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_03', 'CRCAGE_20240813_1_0231_1_D_R', '92', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_04', 'CRCAGE_20240813_1_0231_1_D_R', '60', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_05', 'CRCAGE_20240813_1_0231_1_D_R', '79', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_06', 'CRCAGE_20240813_1_0231_1_D_R', '99', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_07', 'CRCAGE_20240813_1_0231_1_D_R', '47', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_08', 'CRCAGE_20240813_1_0231_1_D_R', '37', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_09', 'CRCAGE_20240813_1_0231_1_D_R', '35', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_10', 'CRCAGE_20240813_1_0231_1_D_R', '40', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_11', 'CRCAGE_20240813_1_0231_1_D_R', '54', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_12', 'CRCAGE_20240813_1_0231_1_D_R', '92', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_13', 'CRCAGE_20240813_1_0231_1_D_R', '35', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_14', 'CRCAGE_20240813_1_0231_1_D_R', '56', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_15', 'CRCAGE_20240813_1_0231_1_D_R', '61', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_16', 'CRCAGE_20240813_1_0231_1_D_R', '33', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_17', 'CRCAGE_20240813_1_0231_1_D_R', '53', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_18', 'CRCAGE_20240813_1_0231_1_D_R', '67', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_19', 'CRCAGE_20240813_1_0231_1_D_R', '34', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_20', 'CRCAGE_20240813_1_0231_1_D_R', '38', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_21', 'CRCAGE_20240813_1_0231_1_D_R', '66', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_22', 'CRCAGE_20240813_1_0231_1_D_R', '54', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_23', 'CRCAGE_20240813_1_0231_1_D_R', '48', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_24', 'CRCAGE_20240813_1_0231_1_D_R', '60', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_25', 'CRCAGE_20240813_1_0231_1_D_R', '58', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_26', 'CRCAGE_20240813_1_0231_1_D_R', '61', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_27', 'CRCAGE_20240813_1_0231_1_D_R', '59', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_28', 'CRCAGE_20240813_1_0231_1_D_R', '63', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_29', 'CRCAGE_20240813_1_0231_1_D_R', '68', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_R_30', 'CRCAGE_20240813_1_0231_1_D_R', '56', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_01', 'CRCAGE_20240813_1_0231_1_D_B', '70', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_02', 'CRCAGE_20240813_1_0231_1_D_B', '68', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_03', 'CRCAGE_20240813_1_0231_1_D_B', '87', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_04', 'CRCAGE_20240813_1_0231_1_D_B', '96', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_05', 'CRCAGE_20240813_1_0231_1_D_B', '48', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_06', 'CRCAGE_20240813_1_0231_1_D_B', '55', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_07', 'CRCAGE_20240813_1_0231_1_D_B', '58', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_08', 'CRCAGE_20240813_1_0231_1_D_B', '54', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_09', 'CRCAGE_20240813_1_0231_1_D_B', '65', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_10', 'CRCAGE_20240813_1_0231_1_D_B', '71', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_11', 'CRCAGE_20240813_1_0231_1_D_B', '48', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_12', 'CRCAGE_20240813_1_0231_1_D_B', '49', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_13', 'CRCAGE_20240813_1_0231_1_D_B', '65', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_14', 'CRCAGE_20240813_1_0231_1_D_B', '63', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_15', 'CRCAGE_20240813_1_0231_1_D_B', '88', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_16', 'CRCAGE_20240813_1_0231_1_D_B', '76', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_17', 'CRCAGE_20240813_1_0231_1_D_B', '86', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_18', 'CRCAGE_20240813_1_0231_1_D_B', '53', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_19', 'CRCAGE_20240813_1_0231_1_D_B', '68', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_20', 'CRCAGE_20240813_1_0231_1_D_B', '80', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_21', 'CRCAGE_20240813_1_0231_1_D_B', '71', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_22', 'CRCAGE_20240813_1_0231_1_D_B', '82', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_23', 'CRCAGE_20240813_1_0231_1_D_B', '51', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_24', 'CRCAGE_20240813_1_0231_1_D_B', '52', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_25', 'CRCAGE_20240813_1_0231_1_D_B', '38', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_26', 'CRCAGE_20240813_1_0231_1_D_B', '64', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_27', 'CRCAGE_20240813_1_0231_1_D_B', '53', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_28', 'CRCAGE_20240813_1_0231_1_D_B', '63', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_29', 'CRCAGE_20240813_1_0231_1_D_B', '81', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_B_30', 'CRCAGE_20240813_1_0231_1_D_B', '66', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_01', 'CRCAGE_20240813_1_0231_1_D_Y', '39', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_02', 'CRCAGE_20240813_1_0231_1_D_Y', '63', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_03', 'CRCAGE_20240813_1_0231_1_D_Y', '82', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_04', 'CRCAGE_20240813_1_0231_1_D_Y', '67', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_05', 'CRCAGE_20240813_1_0231_1_D_Y', '76', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_06', 'CRCAGE_20240813_1_0231_1_D_Y', '73', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_07', 'CRCAGE_20240813_1_0231_1_D_Y', '57', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_08', 'CRCAGE_20240813_1_0231_1_D_Y', '32', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_09', 'CRCAGE_20240813_1_0231_1_D_Y', '51', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_10', 'CRCAGE_20240813_1_0231_1_D_Y', '59', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_11', 'CRCAGE_20240813_1_0231_1_D_Y', '78', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_12', 'CRCAGE_20240813_1_0231_1_D_Y', '54', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_13', 'CRCAGE_20240813_1_0231_1_D_Y', '67', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_14', 'CRCAGE_20240813_1_0231_1_D_Y', '58', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_15', 'CRCAGE_20240813_1_0231_1_D_Y', '124', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_16', 'CRCAGE_20240813_1_0231_1_D_Y', '60', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_17', 'CRCAGE_20240813_1_0231_1_D_Y', '63', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_18', 'CRCAGE_20240813_1_0231_1_D_Y', '67', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_19', 'CRCAGE_20240813_1_0231_1_D_Y', '81', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_20', 'CRCAGE_20240813_1_0231_1_D_Y', '46', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_21', 'CRCAGE_20240813_1_0231_1_D_Y', '83', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_22', 'CRCAGE_20240813_1_0231_1_D_Y', '58', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_23', 'CRCAGE_20240813_1_0231_1_D_Y', '43', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_24', 'CRCAGE_20240813_1_0231_1_D_Y', '51', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_25', 'CRCAGE_20240813_1_0231_1_D_Y', '72', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_26', 'CRCAGE_20240813_1_0231_1_D_Y', '61', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_27', 'CRCAGE_20240813_1_0231_1_D_Y', '68', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_28', 'CRCAGE_20240813_1_0231_1_D_Y', '53', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_29', 'CRCAGE_20240813_1_0231_1_D_Y', '66', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_D_Y_30', 'CRCAGE_20240813_1_0231_1_D_Y', '82', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_R_01', 'CRCAGE_20240813_1_0231_1_R_R', '73', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_R_02', 'CRCAGE_20240813_1_0231_1_R_R', '102', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_R_03', 'CRCAGE_20240813_1_0231_1_R_R', '59', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_R_04', 'CRCAGE_20240813_1_0231_1_R_R', '80', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_R_05', 'CRCAGE_20240813_1_0231_1_R_R', '91', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_R_06', 'CRCAGE_20240813_1_0231_1_R_R', '70', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_R_07', 'CRCAGE_20240813_1_0231_1_R_R', '95', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_R_08', 'CRCAGE_20240813_1_0231_1_R_R', '65', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_R_09', 'CRCAGE_20240813_1_0231_1_R_R', '64', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_R_10', 'CRCAGE_20240813_1_0231_1_R_R', '63', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_R_11', 'CRCAGE_20240813_1_0231_1_R_R', '75', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_R_12', 'CRCAGE_20240813_1_0231_1_R_R', '74', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_R_13', 'CRCAGE_20240813_1_0231_1_R_R', '68', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_B_01', 'CRCAGE_20240813_1_0231_1_R_B', '55', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_B_02', 'CRCAGE_20240813_1_0231_1_R_B', '86', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_B_03', 'CRCAGE_20240813_1_0231_1_R_B', '80', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_B_04', 'CRCAGE_20240813_1_0231_1_R_B', '81', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_B_05', 'CRCAGE_20240813_1_0231_1_R_B', '86', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_B_06', 'CRCAGE_20240813_1_0231_1_R_B', '84', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_B_07', 'CRCAGE_20240813_1_0231_1_R_B', '70', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_B_08', 'CRCAGE_20240813_1_0231_1_R_B', '64', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_B_09', 'CRCAGE_20240813_1_0231_1_R_B', '70', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_B_10', 'CRCAGE_20240813_1_0231_1_R_B', '85', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_B_11', 'CRCAGE_20240813_1_0231_1_R_B', '56', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_B_12', 'CRCAGE_20240813_1_0231_1_R_B', '74', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_B_13', 'CRCAGE_20240813_1_0231_1_R_B', '66', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_B_14', 'CRCAGE_20240813_1_0231_1_R_B', '71', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_B_15', 'CRCAGE_20240813_1_0231_1_R_B', '79', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_Y_01', 'CRCAGE_20240813_1_0231_1_R_Y', '79', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_Y_02', 'CRCAGE_20240813_1_0231_1_R_Y', '69', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_Y_03', 'CRCAGE_20240813_1_0231_1_R_Y', '66', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_Y_04', 'CRCAGE_20240813_1_0231_1_R_Y', '88', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_Y_05', 'CRCAGE_20240813_1_0231_1_R_Y', '60', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_Y_06', 'CRCAGE_20240813_1_0231_1_R_Y', '83', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_Y_07', 'CRCAGE_20240813_1_0231_1_R_Y', '68', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_Y_08', 'CRCAGE_20240813_1_0231_1_R_Y', '126', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_Y_09', 'CRCAGE_20240813_1_0231_1_R_Y', '70', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_Y_10', 'CRCAGE_20240813_1_0231_1_R_Y', '86', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_Y_11', 'CRCAGE_20240813_1_0231_1_R_Y', '73', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data'),
('CRCAGE_20240813_1_0231_1_R_Y_12', 'CRCAGE_20240813_1_0231_1_R_Y', '84', 'Completed', '2025-01-30 00:00:00', 'Erica Williams', '2025-01-30 00:00:00', 'Erica Williams', '2025-02-06 00:00:00', 'Erica Williams', 'Added missing SH data')

--Remove incorrect TripInfo and SampleEvent data
DELETE FROM [hsdb].[TripInfo] where TripID like 'LXCAGE_20240410_1%'
DELETE FROM [hsdb].[SampleEvent] where SampleEventID like 'LXCAGE_20240212_1_0243_1%' and TripID like 'LXCAGE_20230308_1'

--February data checks
--SL/LW/LW/CRE - Done
UPDATE [dbo].[Dermo] set [TotalWeight] = '37.28', [ShellWetWeight] = '33.11' where [OysterID] like 'CRWD2502-01'
UPDATE [dbo].[Dermo] set [TotalWeight] = '23.56', [ShellWetWeight] = '17.39' where [OysterID] like 'CRWD2502-02'
UPDATE [dbo].[Dermo] set [TotalWeight] = '20.48', [ShellWetWeight] = '16.56' where [OysterID] like 'CRWD2502-03'
UPDATE [dbo].[Dermo] set [TotalWeight] = '33.82', [ShellWetWeight] = '24.32' where [OysterID] like 'CRWD2502-04'
UPDATE [dbo].[Dermo] set [TotalWeight] = '16.09', [ShellWetWeight] = '11.89' where [OysterID] like 'CRWD2502-05'
UPDATE [dbo].[Dermo] set [TotalWeight] = '13.92', [ShellWetWeight] = '11.15' where [OysterID] like 'CRWD2502-06'
UPDATE [dbo].[Dermo] set [TotalWeight] = '11.73', [ShellWetWeight] = '9.25' where [OysterID] like 'CRWD2502-07'
UPDATE [dbo].[Dermo] set [TotalWeight] = '45.26', [ShellWetWeight] = '34.41' where [OysterID] like 'CRWD2502-08'
UPDATE [dbo].[Dermo] set [TotalWeight] = '16.94', [ShellWetWeight] = '12.95' where [OysterID] like 'CRWD2502-09'
UPDATE [dbo].[Dermo] set [TotalWeight] = '15.60', [ShellWetWeight] = '12.21' where [OysterID] like 'CRWD2502-10'

--SDTP Done
--Cages Done
--RCRT Done


EXECUTE [dbo].[spChecksSediment] @CheckStart = '2025-02-01', @CheckEnd = '2025-02-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-02-01', @CheckEnd = '2025-02-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-02-01', @CheckEnd = '2025-02-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksCage] @CheckStart = '2025-02-01', @CheckEnd = '2025-02-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-02-01', @CheckEnd = '2025-02-28', @EstuaryCode = 'SL', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-02-01', @CheckEnd = '2025-02-28', @EstuaryCode = 'LX', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-02-01', @CheckEnd = '2025-02-28', @EstuaryCode = 'LW', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-02-01', @CheckEnd = '2025-02-28', @EstuaryCode = 'CR', @DataManager = 'Erica Williams';
EXECUTE [dbo].[spChecksRecruitment] @CheckStart = '2025-02-01', @CheckEnd = '2025-02-28', @EstuaryCode = 'TB', @DataManager = 'Erica Williams';