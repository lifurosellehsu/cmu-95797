-- This query compare an individual fare to the zone, borough and overall avg fare using the fare_amount in yellow taxi trip data.
-- Tables used: mart__dim_locations, stg__yellow_tripdata

SELECT 
	l.zone,
	l.borough,
	y.fare_amount AS individual_fare,
	ROUND(AVG(y.fare_amount) OVER (PARTITION BY l.zone) ,2) AS avg_fare_zone,
	ROUND(AVG(y.fare_amount) OVER (PARTITION BY l.borough) ,2) AS avg_fare_borough,
	ROUND(AVG(y.fare_amount) OVER () ,2) AS avg_overall_fare
FROM 
	{{ ref('stg__yellow_tripdata') }} y
JOIN 
	{{ ref('mart__dim_locations') }} l
ON 
	y.pulocationid = l.locationid;