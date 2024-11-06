-- Adding the second line of water quality to a single SampleEvent

INSERT INTO dbo.SampleEventWQ (
	SampleEventWQID,
	SampleEventID,
	Depth,
	Secchi,
	SampleDepth,
	Temperature,
	Salinity,
	DissolvedOxygen,
	pH,
	TurbidityYSI,
	Comments,
	DateEntered,
	EnteredBy,
	DataStatus)

VALUES (
	'XXRCRT_20240507_1_XXXX_1_02', -- SampleEventWQID
	'XXRCRT_20240507_1_XXXX_1', -- SampleEventID
	0.00, -- Depth
	0.00, -- Secchi
	0.00, -- SampleDepth
	0.0, -- Temperature
	0.00, -- Salinity
	0.0, -- DissolvedOxygen
	0.0, -- pH
	0.00, -- TurbidityYSI
	NULL, -- Comments
	'2024-11-06', -- DateEntered
	'NAME', -- EnteredBy
	'Entered' -- DataStatus
	);

select * from SampleEventWQ where SampleEventWQID like 'XXRCRT_20240507_1_0389%'