-- total number of taxi trips ending in service_zones 'Airports' or 'EWR' 

select count(*) as total_trips
from {{ ref('mart__fact_all_taxi_trips') }} t
join {{ ref('mart__dim_locations') }} l
on cast(t.dolocationid as int) = l.locationid
where l.service_zone in ('Airport', 'EWR')