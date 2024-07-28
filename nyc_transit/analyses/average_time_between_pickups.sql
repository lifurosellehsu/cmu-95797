-- This query finds the average time between taxi pick ups per zone 
-- Tables used: mart__fact_all_taxi_trips, mart__dim_locations


WITH pickup_times AS (
    SELECT
        l.Zone,
        t.pickup_datetime,
        LEAD(t.pickup_datetime) OVER (PARTITION BY l.Zone ORDER BY t.pickup_datetime) AS next_pickup_datetime
    FROM
        {{ ref('mart__fact_all_taxi_trips') }} t
    JOIN
        {{ ref('mart__dim_locations') }} l
    ON
        t.PULocationID = l.LocationID
),

time_differences AS (
    SELECT
        Zone,
        EXTRACT(epoch FROM (next_pickup_datetime - pickup_datetime)) / 60 AS time_diff_minutes
    FROM
        pickup_times
    WHERE
        next_pickup_datetime IS NOT NULL
)

SELECT
    Zone,
    ROUND(AVG(time_diff_minutes),2) AS average_time_between_pickups
FROM
    time_differences
GROUP BY
    Zone
ORDER BY
    Zone;