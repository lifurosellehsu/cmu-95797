-- this table aggregates all trips including bikes and taxis, grouped by day, with averaged trip duration

select 
	type,
	date_trunc('day', started_at_ts)::date as date,
	count(*) as trips,
	avg(duration_min) as average_trip_duration_min
from {{ ref('mart__fact_all_trips') }}
group by all