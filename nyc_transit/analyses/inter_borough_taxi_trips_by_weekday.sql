/* by weekday, find out 
(1) count of total taxi trips 
(2) count of trips that start and end in a different borough  
(3) percentage of (2)/(1) 
 */
 
with trips as (
    select
        weekday(pickup_datetime) as weekday,
        count(*) as total_trips,
        sum(case when p.borough != d.borough then 1 else 0 end) as different_borough_trips
    from {{ ref('mart__fact_all_taxi_trips') }} t
    join {{ ref('mart__dim_locations') }} p on cast(t.PUlocationID as int) = p.locationid
    join {{ ref('mart__dim_locations') }} d on cast(t.DOlocationID as int) = d.locationid
    group by weekday(pickup_datetime)
)

select 
    weekday,
    total_trips,
    different_borough_trips,
    (different_borough_trips::float / total_trips::float) * 100 as percentage_different_borough
from trips
order by weekday;
