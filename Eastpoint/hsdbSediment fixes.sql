-- Add comments for nulls and out of range values in WQ

GO
UPDATE hsdb.SampleEventWQ
SET Comments =
	CASE

	WHEN SampleEventWQID = 'ABSDTP_20180625_1_0008_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20180625_1_0097_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20180625_1_0099_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20180625_1_0157_1_01' THEN 'Salinity and DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20180625_1_0164_1_01' THEN 'Salinity and DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20180724_1_0008_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20180724_1_0020_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20180724_1_0097_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20180724_1_0099_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20180724_1_0157_1_01' THEN 'Salinity and pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20180724_1_0164_1_01' THEN 'Salinity and pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20180823_1_0164_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20180824_1_0008_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20180824_1_0020_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20180824_1_0097_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20180824_1_0099_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20180824_1_0157_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20180926_1_0157_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20181129_1_0157_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20181218_1_0008_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20190116_1_0008_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20190212_1_0008_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20190212_1_0157_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20190212_1_0164_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20190423_1_0164_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20190521_1_0008_1_01' THEN 'DO and pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20190521_1_0097_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20190521_1_0164_1_01' THEN 'DO and pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20190618_1_0157_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20190717_1_0020_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20190717_1_0097_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20190717_1_0157_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20190717_1_0164_1_01' THEN 'DO and pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20191014_1_0008_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20191014_1_0157_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20191014_1_0164_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20191118_1_0157_1_01' THEN 'DO and pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20200114_1_0008_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20200114_1_0157_1_01' THEN 'DO and pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20200217_1_0008_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20200323_1_0008_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20200323_1_0020_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20200323_1_0157_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20200421_1_0020_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20200421_1_0097_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20200421_1_0157_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20200421_1_0164_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20200720_1_0157_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20201016_1_0164_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20201115_1_0008_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20201115_1_0020_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20201115_1_0097_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20201115_1_0099_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20201115_1_0157_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20201215_1_0097_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20201215_1_0157_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20210119_1_0157_1_01' THEN 'DO and pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20210119_1_0164_1_01' THEN 'DO and pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20210224_1_0008_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20210224_1_0157_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20210322_1_0157_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20210322_1_0164_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20210420_1_0008_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210420_1_0097_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20210420_1_0099_1_01' THEN 'pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20210420_1_0157_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210420_1_0164_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210524_1_0008_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210524_1_0097_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210524_1_0099_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210524_1_0157_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210524_1_0164_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210614_1_0008_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210614_1_0020_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210614_1_0097_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210614_1_0099_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210614_1_0157_1_01' THEN 'pH and DO not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210614_1_0164_1_01' THEN 'pH and DO not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210722_1_0008_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210722_1_0020_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210722_1_0097_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210722_1_0099_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210722_1_0157_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210722_1_0164_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210818_1_0007_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210818_1_0019_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210818_1_0096_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210818_1_0098_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210818_1_0156_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20210818_1_0162_1_01' THEN 'pH not recorded'
WHEN SampleEventWQID = 'ABSDTP_20211118_1_0007_1_02' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20211118_1_0162_1_02' THEN 'DO and pH outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20211217_1_0162_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20211217_1_0162_1_02' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20220118_1_0007_1_01' THEN 'Salinity outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20220214_1_0007_1_01' THEN 'Salinity and Turbidity outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20220214_1_0007_1_02' THEN 'Turbidity outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20220616_1_0156_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20220616_1_0156_1_02' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20220722_1_0019_1_01' THEN 'Turbidity outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20220722_1_0019_1_02' THEN 'Turbidity outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20220722_1_0096_1_01' THEN 'Turbidity outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20220722_1_0098_1_01' THEN 'Turbidity outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20220722_1_0156_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20220722_1_0156_1_02' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20220722_1_0162_1_01' THEN 'Turbidity outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20220913_1_0156_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20220913_1_0156_1_02' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20221209_1_0156_1_01' THEN 'DO outside expected range'
WHEN SampleEventWQID = 'ABSDTP_20221209_1_0162_1_02' THEN 'DO outside expected range'

ELSE Comments
END;
GO


-- Fix out of range Sediment data
GO

update hsdb.SedimentTrap set Comments = 'Biota not recorded; 3 filters used' 
where CupSampleID = 'ABE1804-13-3';

update hsdb.SedimentTrap set Comments = 'Biota not recorded; No pans used, high filter weight' 
where CupSampleID = 'ABE1808-13-4' 
or CupSampleID = 'ABC1811-09-1'
or CupSampleID = 'ABE1901-13-2'
or CupSampleID = 'ABE1901-13-3';

update hsdb.SedimentTrap set FilterTareWeight = 2.2 
where CupSampleID = 'ABC1901-06-3';

update hsdb.SedimentTrap set FilterTareWeight = 6.29,
PanTareWeight = NULL,
Comments = 'Biota not recorded; No pan used, multiple filters used'
where CupSampleID = 'ABE1901-13-1';

update hsdb.SedimentTrap set FilterTareWeight = 1.57
where CupSampleID = 'ABW1907-01-2';

update hsdb.SedimentTrap set FilterDryWeight = 1.48
where CupSampleID = 'ABE2003-12-1';

update hsdb.SedimentTrap set FilterDryWeight = 1.46
where CupSampleID = 'ABE2003-12-5';

update hsdb.SedimentTrap set FilterDryWeight = 1.44
where CupSampleID = 'ABC2208-06-1';

update hsdb.SedimentTrap set Comments = 'Lots of mud'
where CupSampleID = 'ABC2201-09-3';

GO