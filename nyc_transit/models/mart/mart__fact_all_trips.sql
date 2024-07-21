-- aggregate all trips including bikes and taxis with duration

with trips_renamed as 
(
    select 'bike' as type, started_at_ts, ended_at_ts from {{ ref('stg__bike_data') }}
    UNION ALL
    select 'fhv' as type, pickup_datetime as started_at_ts, dropoff_datetime as ended_at_ts from {{ ref('stg__fhv_tripdata') }}
    UNION ALL
    select 'fhvhv' as type, pickup_datetime as started_at_ts, dropoff_datetime as ended_at_ts from {{ ref('stg__fhvhv_tripdata') }}
    UNION ALL
    select 'green' as type, lpep_pickup_datetime as started_at_ts, lpep_dropoff_datetime as ended_at_ts from {{ ref('stg__green_tripdata') }}
    UNION ALL
    select 'yellow' as type, tpep_pickup_datetime as started_at_ts, tpep_dropoff_datetime as ended_at_ts from {{ ref('stg__yellow_tripdata') }}
)

SELECT
    type,
    started_at_ts,
    ended_at_ts,
    datediff('minute', started_at_ts, ended_at_ts) as duration_min,
    datediff('second', started_at_ts, ended_at_ts) as duration_sec
from trips_renamed
