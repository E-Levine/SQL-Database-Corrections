-- Create all the Checks Stored Procedures
-- Recruitment
CREATE PROCEDURE [dbo].[spChecksRecruitment](
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
	WHERE TripDate > @CheckStart AND TripDate < @CheckEnd
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

	DELETE FROM dbo.TripInfo WHERE DataStatus = 'Completed';

	INSERT INTO hsdb.SampleEvent SELECT * FROM SampleEvent WHERE DataStatus = 'Completed';

	DELETE FROM dbo.SampleEvent WHERE DataStatus = 'Completed';

	INSERT INTO hsdb.SampleEventWQ SELECT * FROM SampleEventWQ WHERE DataStatus = 'Completed';

	DELETE FROM dbo.SampleEventWQ WHERE DataStatus = 'Completed';

	INSERT INTO hsdb.Recruitment SELECT * FROM Recruitment WHERE DataStatus = 'Completed';

	DELETE FROM dbo.Recruitment WHERE DataStatus = 'Completed';

END

GO

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
	FROM hsdb.TripInfo
	WHERE TripDate > @CheckStart AND TripDate < @CheckEnd
	AND DataStatus = 'Proofed' AND TripID like CONCAT(@EstuaryCode, 'RCRT%');

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

	-- Query the Recruitment table using the temporary table
	UPDATE hsdb.Recruitment 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));

END

GO


-- Sediment

CREATE PROCEDURE [dbo].[spChecksSediment](
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
	WHERE TripDate > @CheckStart AND TripDate < @CheckEnd
	AND DataStatus = 'Proofed' AND TripID like CONCAT(@EstuaryCode, 'SDTP%');

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

	-- Query the SedimentTrap table using the temporary table
	UPDATE SedimentTrap 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));

	-- Insert the Completed data into hsdb, and DELETE FROM dbo
	INSERT INTO hsdb.TripInfo SELECT * FROM TripInfo WHERE DataStatus = 'Completed';

	DELETE FROM dbo.TripInfo WHERE DataStatus = 'Completed';

	INSERT INTO hsdb.SampleEvent SELECT * FROM SampleEvent WHERE DataStatus = 'Completed';

	DELETE FROM dbo.SampleEvent WHERE DataStatus = 'Completed';

	INSERT INTO hsdb.SampleEventWQ SELECT * FROM SampleEventWQ WHERE DataStatus = 'Completed';

	DELETE FROM dbo.SampleEventWQ WHERE DataStatus = 'Completed';

	INSERT INTO hsdb.SedimentTrap SELECT * FROM SedimentTrap WHERE DataStatus = 'Completed';

	DELETE FROM dbo.SedimentTrap WHERE DataStatus = 'Completed';

END	
	
GO

CREATE PROCEDURE [hsdb].[spChecksSediment](
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
	WHERE TripDate > @CheckStart AND TripDate < @CheckEnd
	AND DataStatus = 'Proofed' AND TripID like CONCAT(@EstuaryCode, 'SDTP%');

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

	-- Query the SedimentTrap table using the temporary table
	UPDATE hsdb.SedimentTrap 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));

END

GO

-- Survey

CREATE PROCEDURE [dbo].[spChecksSurvey](
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
	WHERE TripDate > @CheckStart AND TripDate < @CheckEnd
	AND DataStatus = 'Proofed' AND TripID like CONCAT(@EstuaryCode, 'SRVY%');

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

  -- Query the SurveyQuadrat table using the temporary table
  UPDATE hsdb.SurveyQuadrat 
  SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
  WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));
  
  -- Query the SurveySH table using the temporary table
  UPDATE hsdb.SurveySH 
  SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
  WHERE QuadratID IN (SELECT QuadratID FROM SurveyQuadrat WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips)));

  -- Insert the Completed data into hsdb, and DELETE FROM dbo
  INSERT INTO hsdb.TripInfo SELECT * FROM TripInfo WHERE DataStatus = 'Completed';
  
  DELETE FROM dbo.TripInfo WHERE DataStatus = 'Completed';
  
  INSERT INTO hsdb.SampleEvent SELECT * FROM SampleEvent WHERE DataStatus = 'Completed';
  
  DELETE FROM dbo.SampleEvent WHERE DataStatus = 'Completed';
  
  INSERT INTO hsdb.SampleEventWQ SELECT * FROM SampleEventWQ WHERE DataStatus = 'Completed';
  
  DELETE FROM dbo.SampleEventWQ WHERE DataStatus = 'Completed';
  
  INSERT INTO hsdb.SurveyQuadrat SELECT * FROM SurveyQuadrat WHERE DataStatus = 'Completed';
  
  DELETE FROM dbo.SurveyQuadrat WHERE DataStatus = 'Completed';
  
  INSERT INTO hsdb.SurveySH SELECT * FROM SurveySH WHERE DataStatus = 'Completed';
  
  DELETE FROM dbo.SurveySH WHERE DataStatus = 'Completed';

END

GO

CREATE PROCEDURE [hsdb].[spChecksSurvey](
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
	WHERE TripDate > @CheckStart AND TripDate < @CheckEnd
	AND DataStatus = 'Proofed' AND TripID like CONCAT(@EstuaryCode, 'SRVY%');

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

  -- Query the SurveyQuadrat table using the temporary table
  UPDATE hsdb.SurveyQuadrat 
  SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
  WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));
  
  -- Query the SurveySH table using the temporary table
  UPDATE hsdb.SurveySH 
  SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
  WHERE QuadratID IN (SELECT QuadratID FROM SurveyQuadrat WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips)));

END

GO

-- Shell Budget

CREATE PROCEDURE [dbo].[spChecksShellBudget](
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
	WHERE TripDate > @CheckStart AND TripDate < @CheckEnd
	AND DataStatus = 'Proofed' AND TripID like CONCAT(@EstuaryCode, 'SHBG%');

	-- Query the TripInfo table using the temporary table
	UPDATE hsdb.TripInfo 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE TripID IN (SELECT TripID FROM #ValidTrips);

	-- Query the SampleEvent table using the temporary table
	UPDATE hsdb.SampleEvent 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE TripID IN (SELECT TripID FROM #ValidTrips);

  -- Query the ShellBudgetQuadrat table using the temporary table
  UPDATE hsdb.ShellBudgetQuadrat 
  SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
  WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));
  
  -- Query the ShellBudgetSH table using the temporary table
  UPDATE hsdb.ShellBudgetSH 
  SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
  WHERE QuadratID IN (SELECT QuadratID FROM ShellBudgetQuadrat WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips)));
  
  -- Insert the Completed data into hsdb, and DELETE FROM dbo
  INSERT INTO hsdb.TripInfo SELECT * FROM TripInfo WHERE DataStatus = 'Completed';
  
  DELETE FROM dbo.TripInfo WHERE DataStatus = 'Completed';
  
  INSERT INTO hsdb.SampleEvent SELECT * FROM SampleEvent WHERE DataStatus = 'Completed';
  
  DELETE FROM dbo.SampleEvent WHERE DataStatus = 'Completed';
  
  INSERT INTO hsdb.SampleEventWQ SELECT * FROM SampleEventWQ WHERE DataStatus = 'Completed';
  
  DELETE FROM dbo.SampleEventWQ WHERE DataStatus = 'Completed';
  
  INSERT INTO hsdb.ShellBudgetQuadrat SELECT * FROM ShellBudgetQuadrat WHERE DataStatus = 'Completed';
  
  DELETE FROM dbo.ShellBudgetQuadrat WHERE DataStatus = 'Completed';
  
  INSERT INTO hsdb.ShellBudgetSH SELECT * FROM ShellBudgetSH WHERE DataStatus = 'Completed';
  
  DELETE FROM dbo.ShellBudgetSH WHERE DataStatus = 'Completed';

END
 
GO

CREATE PROCEDURE [hsdb].[spChecksShellBudget](
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
	WHERE TripDate > @CheckStart AND TripDate < @CheckEnd
	AND DataStatus = 'Proofed' AND TripID like CONCAT(@EstuaryCode, 'SHBG%');

	-- Query the TripInfo table using the temporary table
	UPDATE hsdb.TripInfo 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE TripID IN (SELECT TripID FROM #ValidTrips);

	-- Query the SampleEvent table using the temporary table
	UPDATE hsdb.SampleEvent 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE TripID IN (SELECT TripID FROM #ValidTrips);

  -- Query the ShellBudgetQuadrat table using the temporary table
  UPDATE hsdb.ShellBudgetQuadrat 
  SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
  WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));
  
  -- Query the ShellBudgetSH table using the temporary table
  UPDATE hsdb.ShellBudgetSH 
  SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
  WHERE QuadratID IN (SELECT QuadratID FROM ShellBudgetQuadrat WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips)));

END

GO

-- Collections

CREATE PROCEDURE [dbo].[spChecksCollections](
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
	WHERE TripDate > @CheckStart AND TripDate < @CheckEnd
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

  -- Insert the Completed data into hsdb, and DELETE FROM dbo
  INSERT INTO hsdb.TripInfo SELECT * FROM TripInfo WHERE DataStatus = 'Completed';
  
  DELETE FROM dbo.TripInfo WHERE DataStatus = 'Completed';
  
  INSERT INTO hsdb.SampleEvent SELECT * FROM SampleEvent WHERE DataStatus = 'Completed';
  
  DELETE FROM dbo.SampleEvent WHERE DataStatus = 'Completed';
  
  INSERT INTO hsdb.SampleEventWQ SELECT * FROM SampleEventWQ WHERE DataStatus = 'Completed';
  
  DELETE FROM dbo.SampleEventWQ WHERE DataStatus = 'Completed';
  
  INSERT INTO hsdb.ConditionIndex 
  (OysterID, SampleEventID, ShellHeight, ShellLength, ShellWidth, TotalWeight, TarePanWeight, TissueWetWeight, ShellWetWeight, TissueDryWeight, ShellDryWeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes)
  SELECT 
  OysterID, SampleEventID, ShellHeight, ShellLength, ShellWidth, TotalWeight, TarePanWeight, TissueWetWeight, ShellWetWeight, TissueDryWeight, ShellDryWeight, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes
  FROM ConditionIndex WHERE DataStatus = 'Completed';
  
  DELETE FROM dbo.ConditionIndex WHERE DataStatus = 'Completed';
  
  INSERT INTO hsdb.Dermo 
  (OysterID, SampleEventID, ShellHeight, ShellLength, ShellWidth, TotalWeight, ShellWetWeight, DermoMantle, DermoGill, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments,	AdminNotes)
  SELECT 
  OysterID, SampleEventID, ShellHeight, ShellLength, ShellWidth, TotalWeight, ShellWetWeight, DermoMantle, DermoGill, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes
  FROM Dermo WHERE DataStatus = 'Completed';
  
  DELETE FROM dbo.Dermo WHERE DataStatus = 'Completed';
  
  INSERT INTO hsdb.Repro 
  (OysterID, SampleEventID, Sex, ReproStage, Parasite, BadSlide, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes)
  SELECT OysterID, SampleEventID, Sex, ReproStage, Parasite, BadSlide, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes
  FROM Repro WHERE DataStatus = 'Completed';
  
  DELETE FROM dbo.Repro WHERE DataStatus = 'Completed';
  
END

GO

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
	WHERE TripDate > @CheckStart AND TripDate < @CheckEnd
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

GO

CREATE PROCEDURE [dbo].[spChecksWave](
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
	WHERE TripDate > @CheckStart AND TripDate < @CheckEnd
	AND DataStatus = 'Proofed' AND TripID like CONCAT(@EstuaryCode, 'WAVE%');

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

	-- Query the Wave table using the temporary table
	UPDATE Wave 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));

	-- Insert the Completed data into hsdb, and DELETE FROM dbo
	INSERT INTO hsdb.TripInfo SELECT * FROM TripInfo WHERE DataStatus = 'Completed';

	DELETE FROM dbo.TripInfo WHERE DataStatus = 'Completed';

	INSERT INTO hsdb.SampleEvent SELECT * FROM SampleEvent WHERE DataStatus = 'Completed';

	DELETE FROM dbo.SampleEvent WHERE DataStatus = 'Completed';

	INSERT INTO hsdb.SampleEventWQ SELECT * FROM SampleEventWQ WHERE DataStatus = 'Completed';

	DELETE FROM dbo.SampleEventWQ WHERE DataStatus = 'Completed';

	INSERT INTO hsdb.Wave SELECT * FROM Wave WHERE DataStatus = 'Completed';

	DELETE FROM dbo.Wave WHERE DataStatus = 'Completed';

END

GO

-- Cage

CREATE PROCEDURE [dbo].[spChecksCage](
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
	AND DataStatus = 'Proofed' AND TripID like CONCAT(@EstuaryCode, 'CAGE%');

	-- Query the TripInfo table using the temporary table
	UPDATE dbo.TripInfo 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE TripID IN (SELECT TripID FROM #ValidTrips);

	-- Query the SampleEvent table using the temporary table
	UPDATE dbo.SampleEvent 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE TripID IN (SELECT TripID FROM #ValidTrips);

	-- Query the SampleEventWQ table using the temporary table
	UPDATE dbo.SampleEventWQ 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));

	-- Query the CageCounts table using the temporary table
	UPDATE dbo.CageCounts 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips));
	
	-- Query the CageSH table using the temporary table
	UPDATE dbo.CageSH 
	SET DataStatus = 'Completed', CompletedBy = @DataManager, DateCompleted = @CompletedDate
	WHERE CageCountID IN (SELECT CageCountID FROM CageCount WHERE SampleEventID IN (SELECT SampleEventID FROM SampleEvent WHERE TripID IN (SELECT TripID FROM #ValidTrips)));

	-- Insert the Completed data into hsdb, and DELETE FROM dbo
	INSERT INTO hsdb.TripInfo SELECT * FROM TripInfo WHERE DataStatus = 'Completed';

	DELETE FROM dbo.TripInfo WHERE DataStatus = 'Completed';

	INSERT INTO hsdb.SampleEvent SELECT * FROM SampleEvent WHERE DataStatus = 'Completed';

	DELETE FROM dbo.SampleEvent WHERE DataStatus = 'Completed';

	INSERT INTO hsdb.SampleEventWQ SELECT * FROM SampleEventWQ WHERE DataStatus = 'Completed';

	DELETE FROM dbo.SampleEventWQ WHERE DataStatus = 'Completed';

	INSERT INTO hsdb.CageCount SELECT * FROM CageCount WHERE DataStatus = 'Completed';

	DELETE FROM dbo.CageCount WHERE DataStatus = 'Completed';

  INSERT INTO hsdb.CageSH SELECT * FROM CageSH WHERE DataStatus = 'Completed';
  
  DELETE FROM dbo.CageSH WHERE DataStatus = 'Completed';

END

GO


-- Give permission to use for OysterReader
GRANT EXECUTE ON dbo.spChecksCollections to OysterReader
GO
GRANT EXECUTE ON dbo.spChecksRecruitment to OysterReader
GO
GRANT EXECUTE ON dbo.spChecksSediment to OysterReader
GO
GRANT EXECUTE ON dbo.spChecksShellBudget to OysterReader
GO
GRANT EXECUTE ON dbo.spChecksSurvey to OysterReader
GO
GRANT EXECUTE ON dbo.spChecksWave to OysterReader
GO
GRANT EXECUTE ON hsdb.spChecksCollections to OysterReader
GO
GRANT EXECUTE ON hsdb.spChecksRecruitment to OysterReader
GO
GRANT EXECUTE ON hsdb.spChecksSediment to OysterReader
GO
GRANT EXECUTE ON hsdb.spChecksShellBudget to OysterReader
GO
GRANT EXECUTE ON hsdb.spChecksSurvey to OysterReader
GO
GRANT EXECUTE ON name to OysterReader
GO
