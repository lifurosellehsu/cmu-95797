-- This query determine if days immediately preceding precipitation or snow had more bike trips on average than the days with precipitation or snow.
-- Tables used: mart__fact_all_bike_trips, stg__central_park_weather

WITH days_with_prcp_snow AS (
    SELECT
        date
    FROM
        {{ ref('stg__central_park_weather') }}
    WHERE
        prcp > 0 OR snow > 0
),

preceding_days AS (
    SELECT
        date - INTERVAL '1 DAY' AS date
    FROM
        days_with_prcp_snow
),

bike_trips_per_day AS (
    SELECT
        CAST(started_at_ts AS DATE) AS trip_date,
        COUNT(*) AS num_trips
    FROM
        {{ ref('mart__fact_all_bike_trips') }}
    GROUP BY
        CAST(started_at_ts AS DATE)
),

avg_trips AS (
    SELECT
        'day_of_prcp_and_snow' AS timing,
        CAST(AVG(bt.num_trips) AS INTEGER) AS avg_bike_trips_per_day
    FROM
        bike_trips_per_day bt
    JOIN
        days_with_prcp_snow dps ON bt.trip_date = dps.date

    UNION ALL
    
    SELECT
        'day_before_prcp_or_snow' AS timing,
        CAST(AVG(bt.num_trips) AS INTEGER) AS avg_bike_trips_per_day
    FROM
        bike_trips_per_day bt
    JOIN
        preceding_days pd ON bt.trip_date = pd.date
)
SELECT * FROM avg_trips;