use Oysters
go


--LXN 08/2025 extra samples: - Completed on Oysters
--update dbo.Dermo set ShellLength = '26.14' where OysterID like 'LXND2508-18' 
--update dbo.Dermo set DataStatus = 'Proofed', ProofedBy = 'Erica Williams', DateProofed = '2025-10-10' where OysterID like 'LXND2508%' and DermoMantle is NULL

--upadte LXN extra samples comments -Completed on Oysters
UPDATE hsdb.Repro set Comments = '0=immature' where OysterID like 'LXND2504-25'
UPDATE hsdb.Repro set Comments = '1=mature' where OysterID like 'LXND2504-41'
UPDATE hsdb.Repro set Comments = '1=mature' where OysterID like 'LXND2506-38'