-- This query finds all the Zones where there are less than 100000 trips
-- Tables used: mart__fact_all_taxi_trips, mart__dim_locations

SELECT 
	l.zone,
	COUNT(t.pulocationid) AS num_trips
FROM 
	{{ ref('mart__fact_all_taxi_trips') }} t
JOIN 
	{{ ref('mart__dim_locations') }} l
ON 
	t.pulocationid = l.locationid
GROUP BY 
	l.zone
HAVING 
	COUNT(t.pulocationid) < 100000;