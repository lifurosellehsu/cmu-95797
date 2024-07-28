-- This query finds taxi trips which don’t have a pick up location_id in the locations table. 
-- Return the count(..) of total # of such trips
-- Using Anti-joins
-- Tables used: mart__fact_all_taxi_trips, mart__dim_locations


SELECT 
	COUNT(t.pickup_datetime) AS total_trips_without_pickup_location
FROM 
	{{ ref('mart__fact_all_taxi_trips') }} t
LEFT JOIN
	{{ ref('mart__dim_locations') }} l
ON
	t.pulocationid = l.locationid
WHERE
	l.locationid IS NULL; 