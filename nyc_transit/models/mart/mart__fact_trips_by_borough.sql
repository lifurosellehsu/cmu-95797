-- this table aggregates number of trips grouped by pickup borough

select 
    l.Borough AS pickup_borough,
    COUNT(t.type) AS number_of_trips
from 
    {{ ref('mart__fact_all_taxi_trips') }} AS t
join 
    {{ ref('mart__dim_locations') }} AS l
on 
    t.PULocationID = l.LocationID
group by 
    l.Borough