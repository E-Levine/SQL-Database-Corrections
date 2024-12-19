--HSDB checks

--hsdb.Recruitment
CREATE PROCEDURE [hsdb].[spChecksRecruitment](
	@CheckStart AS DATE,
	@CheckEnd AS DATE,
	@EstuaryCode AS VARCHAR(2),
	@DataManager AS VARCHAR(max)
	)
AS
BEGIN
	DECLARE @CompletedDate DATE;
	SET @CompletedDate = cast(getDate() as date);

	IF OBJECT_ID('tempdb..#ValidTrips') IS NOT NULL
	BEGIN
		DROP TABLE #ValidTrips;
	END

	CREATE TABLE #ValidTrips (
		TripID VARCHAR(50)
	);

	INSERT INTO #ValidTrips (TripID)
	SELECT TripID
	FROM TripInfo
	WHERE TripDate >= @CheckStart AND TripDate <= @CheckEnd
	AND DataStatus = 'Proofed' AND TripID like CONCAT(@EstuaryCode, 'RCRT%');

	-- Query the TripInfo table using the temporary table
	UPDATE TripInfo 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE TripID IN (SELECT TripID FROM #ValidTrips);

	-- Query the SampleEvent table using the temporary table
	UPDATE SampleEvent 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE TripID IN (SELECT TripID FROM #ValidTrips);

	-- Query the SampleEventWQ table using the temporary table
	UPDATE SampleEventWQ 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));

	-- Query the Recruitment table using the temporary table
	UPDATE Recruitment 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));

	-- Insert the Completed data into hsdb, and DELETE FROM dbo
	INSERT INTO hsdb.TripInfo SELECT * FROM TripInfo WHERE DataStatus = 'Completed';

	INSERT INTO hsdb.SampleEvent SELECT * FROM SampleEvent WHERE DataStatus = 'Completed';

	INSERT INTO hsdb.SampleEventWQ SELECT * FROM SampleEventWQ WHERE DataStatus = 'Completed';

	INSERT INTO hsdb.Recruitment SELECT * FROM Recruitment WHERE DataStatus = 'Completed';

END

--hsdb.Collections
CREATE PROCEDURE [hsdb].[spChecksCollections](
	@CheckStart AS DATE,
	@CheckEnd AS DATE,
	@EstuaryCode AS VARCHAR(2),
	@DataManager AS VARCHAR(max)
	)
AS
BEGIN
	DECLARE @CompletedDate DATE;
	SET @CompletedDate = cast(getDate() as date);

	IF OBJECT_ID('tempdb..#ValidTrips') IS NOT NULL
	BEGIN
    DROP TABLE #ValidTrips;
  END

	CREATE TABLE #ValidTrips (
		TripID VARCHAR(50)
	);

	INSERT INTO #ValidTrips (TripID)
	SELECT TripID
	FROM hsdb.TripInfo
	WHERE TripDate >= @CheckStart AND TripDate <= @CheckEnd
	AND DataStatus = 'Proofed' AND TripID like CONCAT(@EstuaryCode, 'COLL%');

	-- Query the TripInfo table using the temporary table
	UPDATE hsdb.TripInfo 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE TripID IN (SELECT TripID FROM #ValidTrips);

	-- Query the SampleEvent table using the temporary table
	UPDATE hsdb.SampleEvent 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE TripID IN (SELECT TripID FROM #ValidTrips);

	-- Query the SampleEventWQ table using the temporary table
	UPDATE hsdb.SampleEventWQ 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));

  -- Query the ConditionIndex table using the temporary table
  UPDATE hsdb.ConditionIndex 
  SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
  WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));
  
  -- Query the Dermo table using the temporary table
  UPDATE hsdb.Dermo 
  SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
  WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));
  
  -- Query the Repro table using the temporary table
  UPDATE hsdb.Repro 
  SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
  WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));

END