-- This query calculates the number of trips and average duration by borough and zone
-- Tables used: mart__fact_all_trips in & mart__dim_locations in "mart" directory 

SELECT 
	l.borough,
	l.zone,
	COUNT(t.pickup_datetime) AS num_trips,
	ROUND(AVG(t.duration_min),2) AS avg_duration_min
FROM 
    {{ ref('mart__fact_all_taxi_trips') }} t
JOIN 
    {{ ref('mart__dim_locations') }} l
ON 
    t.PUlocationID = l.LocationID
GROUP BY 
    l.borough, 
    l.zone;