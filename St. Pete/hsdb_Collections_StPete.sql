--HSDB Checks: TB COLL 2008-2011

--TB COLL 2008 - dermo only
--Run TB_COLL_WQ_EW

--TB COLL 2009, 2010, 2011, 2012, 2013, 2014, 2015
--none

--TB COLL 2016
--Run TB_COLL_WQ_2016_EW

--TB COLL 2017
--Run TB_COLL_WQ_2017_EW
UPDATE [hsdb].[Repro] set [Comments] = CONCAT(Comments, case when Comments is null then 'Sex=M' else ', Sex=M' end) where OysterID like 'TBLD1702-08'
UPDATE [hsdb].[Repro] set Sex = REPLACE(Sex, 'F', 'Z') where OysterID like 'TBLD1702-08'
UPDATE [hsdb].[Repro] set [Comments] = CONCAT(Comments, case when Comments is null then 'Sex=M' else ', Sex=M' end) where OysterID like 'TBBD1703-03'
UPDATE [hsdb].[Repro] set Sex = REPLACE(Sex, 'F', 'Z') where OysterID like 'TBBD1703-03'
UPDATE [hsdb].[Repro] set [Comments] = CONCAT(Comments, case when Comments is null then 'Sex=F' else ', Sex=F' end) where OysterID like 'TBLD1705-12'
UPDATE [hsdb].[Repro] set Sex = REPLACE(Sex, 'F', 'Z') where OysterID like 'TBLD1705-12'
UPDATE [hsdb].[Repro] set [Comments] = CONCAT(Comments, case when Comments is null then 'Sex=F' else ', Sex=F' end) where OysterID like 'TBLD1706-12'
UPDATE [hsdb].[Repro] set Sex = REPLACE(Sex, 'F', 'Z') where OysterID like 'TBLD1706-12'

--TB COLL 2018
--Run TB_COLL_WQ_2018_EW


EXECUTE [hsdb].[spChecksCollections] @CheckStart = '2008-01-01', @CheckEnd = '2018-12-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
