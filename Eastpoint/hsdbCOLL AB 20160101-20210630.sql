BEGIN TRY

-- Fix SampleEvent Locations
UPDATE hsdb.SampleEvent
Set LongitudeDec = -84.927717
WHERE SampleEventID = 'ABCOLL_20160306_1_0007_1'

UPDATE hsdb.SampleEvent
Set LatitudeDec = 29.676483
WHERE SampleEventID = 'ABCOLL_20201001_1_0096_1'

UPDATE hsdb.SampleEvent
Set Comments = 'OK, coordinates confirmed'
where SampleEventID = 'ABCOLL_20180315_1_0155_1'
OR SampleEventID = 'ABCOLL_20180411_1_0155_1'
OR SampleEventID = 'ABCOLL_20180508_1_0098_1'

-- Fix WQ errors
UPDATE hsdb.SampleEventWQ
SET Secchi = 1, Depth = 2.25
where SampleEventWQID = 'ABCOLL_20160601_1_0019_1_01'

UPDATE hsdb.SampleEventWQ
SET Secchi = 0.75, Depth = 1.25
where SampleEventWQID = 'ABCOLL_20160802_1_0155_1_01'

UPDATE hsdb.SampleEventWQ
SET Depth = 2
where SampleEventWQID = 'ABCOLL_20170503_1_0102_1_01'


-- Add comments for null and out of range values in WQ


UPDATE hsdb.SampleEventWQ
SET Comments =
	CASE
WHEN SampleEventWQID = 'ABCOLL_20160111_1_0007_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20160111_1_0011_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20160111_1_0016_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20160111_1_0024_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20160111_1_0090_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20160111_1_0100_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20160111_1_0102_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20160111_1_0155_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20160111_1_0158_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20160111_1_0167_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20160207_1_0007_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20160306_1_0007_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20160405_1_0007_1_01' THEN 'Salinity and pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20160502_1_0167_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20160601_1_0167_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20160705_1_0155_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20160907_1_0155_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170104_1_0007_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170104_1_0011_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170104_1_0016_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170104_1_0019_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170104_1_0024_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170104_1_0090_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170104_1_0096_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170104_1_0098_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170104_1_0100_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170104_1_0102_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170104_1_0158_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170104_1_0160_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170104_1_0162_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170201_1_0007_1_01' THEN 'Salinity and pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170201_1_0016_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170201_1_0019_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170201_1_0096_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170201_1_0098_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170201_1_0100_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170201_1_0102_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170301_1_0007_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170301_1_0155_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170601_1_0102_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170601_1_0155_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170601_1_0158_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170601_1_0167_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20170705_1_0167_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20171101_1_0155_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20180201_1_0007_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20180201_1_0016_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20180201_1_0155_1_01' THEN 'DO and pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20180201_1_0158_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20180201_1_0160_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20180201_1_0162_1_01' THEN 'DO and pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20180201_1_0167_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20180703_1_0155_1_01' THEN 'DO outside expected range; pH not recorded'
WHEN SampleEventWQID = 'ABCOLL_20180906_1_0016_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20180906_1_0019_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20180906_1_0096_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20180906_1_0102_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20180906_1_0155_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20180906_1_0162_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20180906_1_0167_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20181204_1_0007_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190103_1_0007_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190103_1_0011_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190103_1_0016_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190103_1_0024_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190103_1_0090_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190103_1_0160_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190205_1_0007_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190205_1_0011_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190205_1_0024_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190205_1_0096_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190205_1_0102_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190205_1_0158_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190205_1_0160_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190205_1_0162_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190308_1_0007_1_01' THEN 'Salinity and pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190402_1_0007_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190503_1_0007_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190801_1_0007_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190801_1_0016_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190801_1_0019_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190801_1_0096_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190801_1_0098_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190801_1_0100_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190801_1_0102_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190801_1_0155_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190801_1_0158_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190801_1_0160_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190801_1_0162_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20190801_1_0167_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20191203_1_0007_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20191203_1_0011_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20191203_1_0016_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20191203_1_0019_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20191203_1_0024_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20191203_1_0090_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20191203_1_0096_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20191203_1_0098_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20191203_1_0100_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20191203_1_0102_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20191203_1_0155_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20191203_1_0158_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20191203_1_0160_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20191203_1_0162_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20191203_1_0167_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20200107_1_0007_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20200107_1_0158_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20200203_1_0155_1_01' THEN 'DO and pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20200203_1_0158_1_01' THEN 'DO and pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20200203_1_0160_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20200203_1_0162_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20200203_1_0167_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20200303_1_0007_1_01' THEN 'Salinity and pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20200303_1_0011_1_01' THEN 'Salinity and pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20200303_1_0024_1_01' THEN 'Salinity and pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20200303_1_0090_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20201001_1_0007_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20201103_1_0011_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20210114_1_0156_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20210203_1_0019_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20210203_1_0160_1_01' THEN 'Temperature outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20210203_1_0162_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20210301_1_0007_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20210301_1_0167_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20210405_1_0011_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20210405_1_0158_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20210405_1_0160_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABCOLL_20210510_1_0007_1_01' THEN 'Salinity outside expected range; pH not recorded'
ELSE Comments
END;


-- Fix CI errors

UPDATE hsdb.ConditionIndex
SET ShellLength = 46.4
WHERE OysterID = 'ABCC1604-04'

UPDATE hsdb.ConditionIndex
SET ShellHeight = 63.11
WHERE OysterID = 'ABEC1802-17'

UPDATE hsdb.ConditionIndex
SET ShellHeight = 44.98
WHERE OysterID = 'ABEC1802-22'

UPDATE hsdb.ConditionIndex
SET ShellLength = 47.77
WHERE OysterID = 'ABCC1803-21'

UPDATE hsdb.ConditionIndex
SET ShellLength = 65.12
WHERE OysterID = 'ABEC1803-06'

UPDATE hsdb.ConditionIndex
SET ShellWidth = 35.34
WHERE OysterID = 'ABWC1806-03'

UPDATE hsdb.ConditionIndex
SET ShellHeight = 95.68
WHERE OysterID = 'ABCC1806-19'

UPDATE hsdb.ConditionIndex
SET ShellHeight = 57.72
WHERE OysterID = 'ABEC1807-14'

UPDATE hsdb.ConditionIndex
SET ShellHeight = 82.15
WHERE OysterID = 'ABCC1809-05'

UPDATE hsdb.ConditionIndex
SET ShellWidth = 31.56
WHERE OysterID = 'ABCC2012-22'

UPDATE hsdb.ConditionIndex
SET ShellWidth = 34.69
WHERE OysterID = 'ABEC2012-03'

-- Out of Range # 2
UPDATE hsdb.ConditionIndex
SET TotalWeight = 12.39
WHERE OysterID = 'ABEC1603-08'

UPDATE hsdb.ConditionIndex
SET TotalWeight = 14.67
WHERE OysterID = 'ABEC1603-09'

UPDATE hsdb.ConditionIndex
SET TotalWeight = 9.94
WHERE OysterID = 'ABEC1603-23'

UPDATE hsdb.ConditionIndex
SET TotalWeight = 8.18
WHERE OysterID = 'ABEC1603-24'

UPDATE hsdb.ConditionIndex
SET TotalWeight = 9.09
WHERE OysterID = 'ABWC1604-24'

UPDATE hsdb.ConditionIndex
SET TotalWeight = 121.96
WHERE OysterID = 'ABCC1605-14'

UPDATE hsdb.ConditionIndex
SET ShellWetWeight = 18.53
WHERE OysterID = 'ABEC1607-17'

UPDATE hsdb.ConditionIndex
SET TotalWeight = 27.55
WHERE OysterID = 'ABWC1608-09'

UPDATE hsdb.ConditionIndex
SET TotalWeight = NULL, Comments = 'TotalWeight recorded incorrectly'
WHERE OysterID = 'ABWC1608-12' OR
OysterID = 'ABEC1612-07' OR
OysterID = 'ABEC1803-08' OR
OysterID = 'ABCC1806-04' OR
OysterID = 'ABCC1811-09' OR
OysterID = 'ABEC1901-07' OR
OysterID = 'ABEC1901-12' OR
OysterID = 'ABEC1901-15' OR
OysterID = 'ABEC1902-16' OR
OysterID = 'ABEC1902-17';

UPDATE hsdb.ConditionIndex
SET TotalWeight = NULL, ShellWetWeight = NULL, ShellDryWeight = NULL, Comments = 'TotalWeight, ShellWetWeight, and ShellDryWeight recorded incorrectly'
WHERE OysterID = 'ABCC1811-13'

UPDATE hsdb.ConditionIndex
SET ShellDryWeight = NULL, Comments = 'ShellDryWeight recorded incorrectly'
WHERE OysterID = 'ABEC1702-18' OR
OysterID = 'ABEC1708-01';

UPDATE hsdb.ConditionIndex
SET TotalWeight = NULL, TissueWetWeight = NULL, Comments = 'TotalWeight and TissueWetWeight recorded incorrectly'
WHERE OysterID = 'ABEC1901-14';

UPDATE hsdb.ConditionIndex
SET ShellDryWeight = 24.43 
WHERE OysterID = 'ABCC1609-19'

UPDATE hsdb.ConditionIndex
SET ShellWetWeight = 85.86
WHERE OysterID = 'ABWC1702-25'

UPDATE hsdb.ConditionIndex
SET ShellWetWeight = 64.29
WHERE OysterID = 'ABEC1702-04'

UPDATE hsdb.ConditionIndex
SET TotalWeight = 55.95
WHERE OysterID = 'ABEC1704-23'

UPDATE hsdb.ConditionIndex
SET TissueWetWeight = 8.51
WHERE OysterID = 'ABEC1705-22'

UPDATE hsdb.ConditionIndex
SET TissueWetWeight = 11.22
WHERE OysterID = 'ABWC1709-03'

UPDATE hsdb.ConditionIndex
SET ShellWetWeight = 115.89
WHERE OysterID = 'ABWC1710-14'

UPDATE hsdb.ConditionIndex
SET ShellWetWeight = 51.21
WHERE OysterID = 'ABWC1804-23'

UPDATE hsdb.ConditionIndex
SET TotalWeight = 42.53
WHERE OysterID = 'ABEC1810-13'

UPDATE hsdb.ConditionIndex
SET TotalWeight = 233.57
WHERE OysterID = 'ABCC1811-07'

UPDATE hsdb.ConditionIndex
SET TotalWeight = 96.91
WHERE OysterID = 'ABCC1811-08'

UPDATE hsdb.ConditionIndex
SET TotalWeight = 53.33
WHERE OysterID = 'ABCC1812-14'

UPDATE hsdb.ConditionIndex
SET TotalWeight = 159.87
WHERE OysterID = 'ABEC1901-11'

UPDATE hsdb.ConditionIndex
SET TotalWeight = 67.03
WHERE OysterID = 'ABCC2002-23'

UPDATE hsdb.ConditionIndex
SET TotalWeight = 48.05
WHERE OysterID = 'ABCC2009-02'

UPDATE hsdb.ConditionIndex
SET TarePanWeight = 1.08
WHERE OysterID = 'ABEC2011-16'

UPDATE hsdb.ConditionIndex
SET TotalWeight = 47.65
WHERE OysterID = 'ABCC2105-16'

-- Fix Dermo Errors

UPDATE hsdb.Dermo
SET TotalWeight = 111.81
WHERE OysterID = 'ABED1602-24'

UPDATE hsdb.Dermo
SET TotalWeight = 6.44
WHERE OysterID = 'ABED1603-23'

UPDATE hsdb.Dermo
SET ShellWetWeight = 136.84
WHERE OysterID = 'ABWD1606-04'

UPDATE hsdb.Dermo
SET ShellWetWeight = 76.82
WHERE OysterID = 'ABWD1606-05'

UPDATE hsdb.Dermo
SET ShellWetWeight = 46.47
WHERE OysterID = 'ABCD1611-06'

UPDATE hsdb.Dermo
SET ShellWetWeight = 53.25
WHERE OysterID = 'ABCD1611-07'

UPDATE hsdb.Dermo
SET ShellHeight = 62.1, ShellLength = 48.4, ShellWidth = 30.7, TotalWeight = 62.82
WHERE OysterID = 'ABWD1612-12'

UPDATE hsdb.Dermo
SET ShellWidth = NULL, Comments = 'ShellWidth not recorded'
WHERE OysterID = 'ABED1702-25' OR
OysterID = 'ABCD1801-18'

UPDATE hsdb.Dermo
SET ShellWetWeight = NULL, Comments = 'ShellWetWeight not recorded'
WHERE OysterID = 'ABWD1704-01' OR
OysterID = 'ABWD1705-14' OR
OysterID = 'ABCD1904-19'

UPDATE hsdb.Dermo SET ShellHeight = 59.05, ShellLength = 55.93, ShellWidth = NULL, Comments = 'ShellWidth not recorded' 
WHERE OysterID = 'ABED1804-03'
UPDATE hsdb.Dermo SET ShellHeight = 52.87, ShellLength = 60.28, ShellWidth = 21.57 
WHERE OysterID = 'ABED1804-04'
UPDATE hsdb.Dermo SET ShellHeight = 67.38, ShellLength = 59.82, ShellWidth = 31.87 
WHERE OysterID = 'ABED1804-05'
UPDATE hsdb.Dermo SET ShellHeight = 78.55, ShellLength = 56.62, ShellWidth = 27.11 
WHERE OysterID = 'ABED1804-06'
UPDATE hsdb.Dermo SET ShellHeight = 59.29, ShellLength = 45.62, ShellWidth = 19.31 
WHERE OysterID = 'ABED1804-07'
UPDATE hsdb.Dermo SET ShellHeight = 56.52, ShellLength = 57.67, ShellWidth = 26.87 
WHERE OysterID = 'ABED1804-08'
UPDATE hsdb.Dermo SET ShellHeight = 67.58, ShellLength = 54.53, ShellWidth = 27.97 
WHERE OysterID = 'ABED1804-09'
UPDATE hsdb.Dermo SET ShellHeight = 80.22, ShellLength = 63, ShellWidth = NULL, Comments = 'ShellWidth not recorded' 
WHERE OysterID = 'ABED1804-10'
UPDATE hsdb.Dermo SET ShellHeight = NULL, ShellLength = NULL, ShellWidth = NULL, Comments = 'ShellHeight, ShellLength, and ShellWidth not recorded' 
WHERE OysterID = 'ABED1804-11'
UPDATE hsdb.Dermo SET ShellHeight = NULL, ShellLength = NULL, ShellWidth = NULL, Comments = 'ShellHeight, ShellLength, and ShellWidth not recorded' 
WHERE OysterID = 'ABED1804-12'
UPDATE hsdb.Dermo SET ShellHeight = NULL, ShellLength = NULL, ShellWidth = NULL, Comments = 'ShellHeight, ShellLength, and ShellWidth not recorded' 
WHERE OysterID = 'ABED1804-13'
UPDATE hsdb.Dermo SET ShellHeight = NULL, ShellLength = NULL, ShellWidth = NULL, Comments = 'ShellHeight, ShellLength, and ShellWidth not recorded' 
WHERE OysterID = 'ABED1804-14'
UPDATE hsdb.Dermo SET ShellHeight = NULL, ShellLength = NULL, ShellWidth = NULL, Comments = 'ShellHeight, ShellLength, and ShellWidth not recorded' 
WHERE OysterID = 'ABED1804-15'
UPDATE hsdb.Dermo SET ShellHeight = NULL, ShellLength = NULL, ShellWidth = NULL, Comments = 'ShellHeight, ShellLength, and ShellWidth not recorded' 
WHERE OysterID = 'ABED1804-16'
UPDATE hsdb.Dermo SET ShellHeight = 57.26, ShellLength = NULL, ShellWidth = 26.53, Comments = 'ShellLength not recorded' 
WHERE OysterID = 'ABED1804-17'

UPDATE hsdb.Dermo
SET ShellLength = 43.4
WHERE OysterID = 'ABWD1705-25'

UPDATE hsdb.Dermo
SET ShellWetWeight = 103.36
WHERE OysterID = 'ABCD1808-19'

UPDATE hsdb.Dermo
SET ShellHeight = NULL, Comments = 'ShellHeight not recorded'
WHERE OysterID = 'ABED1808-22'

UPDATE hsdb.Dermo
SET TotalWeight = 90.9
WHERE OysterID = 'ABCD1811-02'

UPDATE hsdb.Dermo 
SET ShellHeight = NULL, ShellLength = NULL, ShellWidth = NULL, Comments = 'ShellHeight, ShellLength, and ShellWidth not recorded' 
WHERE OysterID = 'ABED2103-22'

-- Fix Repro Errors

UPDATE hsdb.Repro 
SET ReproStage = NULL 
WHERE OysterID = 'ABED1603-02' OR
OysterID = 'ABED1603-14'

UPDATE hsdb.Repro 
SET Parasite = 'No' 
WHERE OysterID = 'ABED1701-19'

UPDATE hsdb.Repro 
SET Parasite = 'Buceph' 
WHERE OysterID = 'ABED1701-17'

UPDATE hsdb.Repro 
SET Sex = 'Z' 
WHERE OysterID = 'ABED1712-08'

END TRY

BEGIN CATCH
SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH

-- Add CI comments

UPDATE hsdb.ConditionIndex
SET Comments =
	CASE
WHEN OysterID = 'ABCC2002-23' THEN 'ShellDryWeight outside expected range'
WHEN OysterID = 'ABCC1704-14' THEN 'ShellWetWeight outside expected range'
WHEN OysterID = 'ABCC1703-24' THEN 'ShellWetWeight outside expected range'
WHEN OysterID = 'ABEC1604-22' THEN 'ShellWetWeight outside expected range'
WHEN OysterID = 'ABEC1604-13' THEN 'ShellWetWeight outside expected range'
WHEN OysterID = 'ABEC1705-13' THEN 'ShellWetWeight outside expected range'
WHEN OysterID = 'ABEC1705-25' THEN 'ShellWetWeight outside expected range'
WHEN OysterID = 'ABEC1704-22' THEN 'ShellWetWeight outside expected range'
WHEN OysterID = 'ABCC1707-10' THEN 'ShellWetWeight outside expected range'
WHEN OysterID = 'ABEC1903-06' THEN 'TarePanWeight outside expected range'
WHEN OysterID = 'ABEC1903-02' THEN 'TarePanWeight outside expected range'
WHEN OysterID = 'ABCC1903-02' THEN 'TarePanWeight outside expected range'
WHEN OysterID = 'ABEC1903-11' THEN 'TarePanWeight outside expected range'
WHEN OysterID = 'ABEC1903-21' THEN 'TarePanWeight outside expected range'
WHEN OysterID = 'ABCC1903-18' THEN 'TarePanWeight outside expected range'
WHEN OysterID = 'ABCC1903-20' THEN 'TarePanWeight outside expected range'
WHEN OysterID = 'ABEC1901-02' THEN 'TissueWetWeight outside expected range'
WHEN OysterID = 'ABCC1610-03' THEN 'TissueWetWeight outside expected range'
WHEN OysterID = 'ABCC1811-09' THEN 'TotalWeight recorded incorrectly, ShellDryWeight outside expected range'
WHEN OysterID = 'ABEC1707-19' THEN 'TotalWeight sums and ShellWetWeight outside expected range'
WHEN OysterID = 'ABEC1706-13' THEN 'TotalWeight sums and ShellWetWeight outside expected range'
WHEN OysterID = 'ABWC1606-20' THEN 'TotalWeight sums outside expected range'
WHEN OysterID = 'ABEC1707-17' THEN 'TotalWeight sums outside expected range'
WHEN OysterID = 'ABEC1705-22' THEN 'TotalWeight sums outside expected range'
WHEN OysterID = 'ABWC1606-15' THEN 'TotalWeight sums outside expected range'
WHEN OysterID = 'ABEC1707-24' THEN 'TotalWeight sums outside expected range'
WHEN OysterID = 'ABCC1806-10' THEN 'ShellHeight and TotalWeight outside expected range'
WHEN OysterID = 'ABWC1712-10' THEN 'ShellHeight and TotalWeight outside expected range'
WHEN OysterID = 'ABEC1603-01' THEN 'ShellLength and ShellWidth outside expected range'
WHEN OysterID = 'ABEC1601-10' THEN 'ShellLength and TotalWeight and TissueWetWeight outside expected range'
WHEN OysterID = 'ABCC1601-15' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABCC1601-18' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABEC1601-14' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABEC1601-19' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABEC1602-06' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABEC1602-20' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABEC1602-25' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABEC1911-16' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABWC1602-15' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABWC1607-25' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABWC1805-05' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABCC1601-03' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1601-25' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1603-19' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1604-11' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1604-22' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1606-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1608-05' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1701-02' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1701-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1703-09' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1704-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1705-05' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1705-06' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1705-10' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1705-22' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1706-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1706-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1708-25' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1710-11' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1801-12' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1801-14' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1803-21' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1804-03' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1804-14' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1804-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1804-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1804-23' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1805-20' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1807-06' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1807-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1807-20' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1807-23' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1905-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1905-20' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1907-12' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1907-22' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1909-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1909-24' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC1912-06' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC2002-13' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC2006-06' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC2006-13' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC2006-19' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC2006-25' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC2007-20' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC2008-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC2008-23' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC2101-03' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC2101-04' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC2102-13' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC2104-03' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC2105-07' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC2105-14' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC2106-20' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCC2106-22' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1601-06' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1604-19' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1606-01' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1609-12' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1701-03' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1710-11' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1710-13' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1712-24' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1801-07' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1801-12' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1801-22' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1801-24' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1802-04' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1802-07' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1802-14' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1802-16' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1802-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1802-22' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1802-23' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1802-25' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1805-04' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1805-08' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1805-10' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1806-09' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1809-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1810-11' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1812-08' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1902-03' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1903-23' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1904-02' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1904-14' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1904-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1905-10' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1905-21' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1906-04' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1906-12' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1906-20' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC1907-23' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2001-23' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2002-13' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2002-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2002-24' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2008-07' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2008-08' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2101-09' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2102-24' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2103-02' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2103-03' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2103-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2104-06' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2105-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2105-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2106-12' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2106-16' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABEC2106-22' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1606-07' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1606-09' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1607-09' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1608-02' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1701-07' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1701-22' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1702-05' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1705-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1705-16' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1705-20' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1705-25' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1706-03' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1706-04' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1706-09' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1706-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1706-21' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1706-25' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1711-13' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1803-25' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1804-01' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1805-21' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1807-09' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1807-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1807-20' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2104-01' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2104-02' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2104-03' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2104-13' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2104-24' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2105-10' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2105-21' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2106-04' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2106-09' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2106-11' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2106-14' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2106-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2106-23' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC2106-24' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWC1607-01' THEN 'ShellLength, ShellWidth, and TotalWeight outside expected range'
WHEN OysterID = 'ABWC1607-04' THEN 'ShellLength, ShellWidth, and TotalWeight outside expected range'
WHEN OysterID = 'ABCC1903-06' THEN 'ShellWidth and TotalWeight and TarePanWeight outside expected range'
WHEN OysterID = 'ABCC1903-15' THEN 'ShellWidth and TotalWeight and TarePanWeight outside expected range'
WHEN OysterID = 'ABCC1604-19' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABCC1710-02' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABCC1803-02' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABCC1805-02' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABCC1808-01' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABCC1808-03' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABCC1901-06' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABCC1902-07' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABCC1903-19' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABCC1904-02' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABEC1601-25' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABEC1909-04' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC1605-10' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC1609-04' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC1706-12' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC1806-25' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC1807-11' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWC1808-02' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABCC1703-02' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCC1705-02' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCC1707-02' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCC1707-20' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCC1711-08' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCC1808-19' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCC1902-02' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCC2102-25' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCC2106-05' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABEC1902-02' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC1607-20' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC1707-17' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC1712-18' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWC1712-24' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCC1902-20' THEN 'TotalWeight and TarePanWeight outside expected range'
WHEN OysterID = 'ABCC1902-22' THEN 'TotalWeight and TarePanWeight outside expected range'
WHEN OysterID = 'ABCC1903-09' THEN 'TotalWeight and TarePanWeight outside expected range'
WHEN OysterID = 'ABCC1903-17' THEN 'TotalWeight and TarePanWeight outside expected range'
WHEN OysterID = 'ABCC1601-24' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1602-12' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1602-21' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1603-12' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1708-02' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1708-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1708-08' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1709-02' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1711-01' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1712-11' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1804-10' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1808-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1808-16' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1811-16' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1812-12' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1902-08' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1903-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1904-23' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1906-10' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1906-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCC1907-13' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1601-01' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1601-03' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1601-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1601-07' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1601-08' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1601-13' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1601-15' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1601-20' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1601-23' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1602-07' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1602-10' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1602-13' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1602-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1603-02' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1603-21' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1603-23' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1603-24' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1606-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1909-11' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1909-23' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1910-25' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1911-25' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC2102-11' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1601-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1601-19' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1601-23' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1601-24' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1601-25' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1602-04' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1602-06' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1602-07' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1602-10' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1602-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1602-17' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1602-19' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1602-21' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1602-23' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1602-24' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1602-25' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1603-13' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1603-20' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1603-23' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1604-17' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1604-24' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1606-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1606-12' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1607-06' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1608-15' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1609-07' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1701-16' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1703-01' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1704-11' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1801-01' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1804-13' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1805-15' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1805-17' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWC1807-03' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABEC1901-15' THEN 'TotalWeight recorded incorrectly, ShellLength outside expected range'
WHEN OysterID = 'ABCC1811-13' THEN 'TotalWeight recorded incorrectly, ShellWidth outside expected range'

ELSE Comments
END;

-- Add Dermo comments

UPDATE hsdb.Dermo
SET Comments =
	CASE
WHEN OysterID = 'ABCD1801-18' THEN 'ShellWidth not recorded, ShellLength outside expected range'
WHEN OysterID = 'ABED1603-10' THEN 'slide unreadable; ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABCD1611-12' THEN 'slide unreadable; TotalWeight outside expected range'
WHEN OysterID = 'ABCD1601-14' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1601-23' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1601-04' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1601-16' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1603-22' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1604-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1604-23' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1606-10' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1606-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1606-19' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1606-04' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1606-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1607-14' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1607-07' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1611-04' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1611-05' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1701-06' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1702-09' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1702-10' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1702-02' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1703-12' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1703-13' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1703-16' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1703-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1703-24' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1704-16' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1704-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1704-20' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1704-01' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1705-13' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1705-23' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1705-24' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1705-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1706-22' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1706-24' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1709-09' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1709-12' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1709-09' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1709-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1711-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1711-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1712-05' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1801-13' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1801-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1802-12' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1802-16' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1802-06' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1803-12' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1803-19' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1803-02' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1803-09' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1803-16' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1803-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1803-19' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1803-23' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1804-20' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1804-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1804-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1804-04' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1804-08' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1804-22' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1805-01' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1805-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1805-10' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1805-25' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1806-11' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD1806-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1806-07' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1806-14' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1806-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1806-20' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1806-21' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1807-10' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1807-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1807-20' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1807-23' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1812-09' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1812-12' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1902-08' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1902-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1902-22' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1903-22' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1903-25' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1904-04' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1904-05' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1905-16' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1905-25' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1906-10' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1906-12' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1906-22' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1907-11' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1908-22' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1908-24' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1909-21' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED1909-16' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1911-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2001-13' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED2001-04' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2002-24' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED2002-05' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED2003-19' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2006-03' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2006-10' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED2006-01' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED2006-24' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2008-09' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2008-13' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2008-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2009-10' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2102-09' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2102-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED2104-18' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED2104-08' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED2104-09' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2105-07' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2105-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2105-16' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2105-11' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2105-15' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2105-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED2105-14' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABED2105-17' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2106-01' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2106-06' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2106-11' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2106-13' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABWD2106-23' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2106-02' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2106-08' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2106-09' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2106-13' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD2106-21' THEN 'ShellLength outside expected range'
WHEN OysterID = 'ABCD1805-01' THEN 'ShellLength, ShellWidth, and TotalWeight outside expected range'
WHEN OysterID = 'ABWD1601-05' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABWD1601-16' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABWD1601-20' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABWD1601-22' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABCD1601-17' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABED1601-24' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABED1602-20' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABWD1803-23' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABCD1805-08' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABED1901-02' THEN 'ShellLength and TotalWeight outside expected range'
WHEN OysterID = 'ABWD1602-18' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD1604-05' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD1604-14' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD1605-25' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD1607-03' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCD1607-03' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD1608-06' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD1608-11' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABED1611-11' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCD1703-01' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCD1707-02' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCD1708-07' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABED1709-18' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD1801-05' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCD1803-04' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD1804-21' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD1805-25' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCD1805-12' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCD1806-22' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD1807-10' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD1807-11' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCD1808-04' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCD1810-25' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCD1903-17' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABCD1905-09' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABED1911-20' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABED1911-21' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABED2011-21' THEN 'ShellWidth outside expected range'
WHEN OysterID = 'ABWD1604-03' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD1606-17' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD1608-05' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD1608-09' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD1608-19' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD1711-02' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD1712-15' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD1802-05' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABCD1802-08' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD1806-10' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD1807-04' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABCD1809-04' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABCD1810-21' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABCD1810-24' THEN 'ShellWidth and TotalWeight outside expected range'
WHEN OysterID = 'ABWD1601-03' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1601-18' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1601-19' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1601-21' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1601-23' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1601-24' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1601-25' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1601-15' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1601-25' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1601-08' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1601-09' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1601-10' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1601-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1601-15' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1601-23' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1602-07' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1602-13' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1602-17' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1602-24' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1602-04' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1603-07' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1603-12' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1603-19' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1603-20' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1603-23' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1603-24' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1603-06' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1603-23' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1603-24' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1604-01' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1605-20' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1606-06' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1606-16' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1606-22' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1612-01' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1612-02' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1701-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1701-11' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1701-21' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1702-17' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1704-19' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1704-07' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1705-10' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1706-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1707-10' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1707-25' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1708-15' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1709-03' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1711-11' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1804-11' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1806-10' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1806-13' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1807-12' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1807-01' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1808-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1808-03' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1808-08' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1808-11' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABWD1809-04' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1809-01' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1810-03' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1811-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1811-17' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1811-20' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1901-15' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1902-23' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1903-15' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1903-06' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1904-01' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1906-15' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1908-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1910-05' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1910-06' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1910-19' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1911-06' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1911-13' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1911-14' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED1911-24' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD2102-24' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABED2103-17' THEN 'TotalWeight outside expected range'
WHEN OysterID = 'ABCD1604-17' THEN 'ShellWetWeight outside expected range'
WHEN OysterID = 'ABCD1611-11' THEN 'ShellWetWeight outside expected range'
WHEN OysterID = 'ABED1706-17' THEN 'ShellWetWeight outside expected range'
WHEN OysterID = 'ABWD1709-21' THEN 'ShellWetWeight outside expected range'
WHEN OysterID = 'ABED1711-24' THEN 'ShellWetWeight outside expected range'
WHEN OysterID = 'ABCD1809-25' THEN 'ShellWetWeight outside expected range'
WHEN OysterID = 'ABCD1812-05' THEN 'ShellWetWeight outside expected range'
WHEN OysterID = 'ABED1904-03' THEN 'ShellWetWeight outside expected range'
WHEN OysterID = 'ABCD2105-22' THEN 'ShellWetWeight outside expected range'


ELSE Comments
END;