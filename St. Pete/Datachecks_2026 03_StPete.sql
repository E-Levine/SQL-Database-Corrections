use [Oysters]
go

--Updates to sex ratio samples - COMPLETED in Oysters 260303
Update hsdb.Repro set Comments = 'Sex ratio sample' where OysterID = 'LXND2504-26'
Update hsdb.Repro set Sex = 'M/F', ReproStage = 'Z' where OysterID = 'LXND2504-50'
Update hsdb.Repro set Comments = '1-mat' where OysterID = 'LXND2505-35'
Update hsdb.Repro set Comments = '0=imm' where OysterID = 'LXND2505-39' or OysterID = 'LXND2505-40' or OysterID = 'LXND2507-25'