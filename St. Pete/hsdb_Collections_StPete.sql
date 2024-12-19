--HSDB Checks: TB COLL 2008-2011

--TB COLL 2008 - dermo only
--Run TB_COLL_WQ_EW

--TB COLL 2009, 2010, 2011, 2012
--none


EXECUTE [hsdb].[spChecksCollections] @CheckStart = '2008-01-01', @CheckEnd = '2015-12-30', @EstuaryCode = 'TB', @DataManager = 'Erica Levine';
