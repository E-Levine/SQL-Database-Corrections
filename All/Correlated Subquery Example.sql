--- Author: Matt Davis
--- Date 03/21/2023
--- Using correlated subqueries to ensure AB Baywide Survey data is properly linked. This may be useful if you need to make sure data is connected with proper PK/FK combos.

--- The AB Baywide FixedLocations were only active in this time window
select * from hsdb.TripInfo where TripType = 'Survey' and TripDate > '2016-05-01' and TripDate < '2016-07-31';

--- After viewing TripInfo, it was determined that these trips were the only ones with values in Comments. This is no longer true.
select * from hsdb.TripInfo where TripType = 'Survey' and Comments is not null;

--- Correlated subquery to check that those TripIDs occur as FKs in SampleEvent table
select * from hsdb.SampleEvent where TripID in
(select TripID from hsdb.TripInfo where TripType = 'Survey' and Comments is not null);

select * from hsdb.SurveyQuadrat where SampleEventID in
(select SampleEventID from hsdb.SampleEvent where TripID in
(select TripID from hsdb.TripInfo where TripType = 'Survey' and Comments is not null));

select * from hsdb.SurveySH where QuadratID in
(select QuadratID from hsdb.SurveyQuadrat where SampleEventID in
(select SampleEventID from hsdb.SampleEvent where TripID in
(select TripID from hsdb.TripInfo where TripType = 'Survey' and Comments is not null)));