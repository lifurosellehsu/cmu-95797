with source as (
	select * from {{ source('main','green_tripdata')}}
),

renamed as (
	select 
		vendorid::int as vendorid,
        lpep_pickup_datetime::timestamp as lpep_pickup_datetime,
        lpep_dropoff_datetime::timestamp as lpep_dropoff_datetime,
        store_and_fwd_flag,
        ratecodeid::double as ratecodeid, 
        pulocationid::bigint as pulocationid, 
        dolocationid::bigint as dolocationid, 
        passenger_count::double as passenger_count, 
        trip_distance::double as trip_distance, 
        fare_amount::double as fare_amount, 
        extra::double as extra, 
        mta_tax::double as mta_tax, 
        tip_amount::double as tip_amount, 
        tolls_amount::double as tolls_amount, 
        ehail_fee::int as ehail_fee, 
        improvement_surcharge::double as improvement_surcharge, 
        total_amount::double as total_amount, 
        payment_type::double as payment_type, 
        trip_type::double as trip_type, 
        congestion_surcharge::double as congestion_surcharge, 
		filename
	from source
)

select * from renamed 