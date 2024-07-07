with source as (
	select * from {{ source('main','yellow_tripdata')}}
),

renamed as (
	select 
		vendorid::bigint as vendorid,
		tpep_pickup_datetime::timestamp as tpep_pickup_datetime,
		tpep_dropoff_datetime::timestamp as tpep_dropoff_datetime,
		passenger_count::double as passenger_count,
		trip_distance::double as trip_distance,
		ratecodeid::double as ratecodeid,
		store_and_fwd_flag,
		pulocationid::bigint as pulocationid,
		dolocationid::bigint as dolocationid,
		payment_type::bigint as payment_type,
		fare_amount::double as fare_amount,
		extra::double as extra,
		mta_tax::double as mta_tax,
		tip_amount::double as tip_amount,
		tolls_amount::double as tolls_amount,
		improvement_surcharge::double as improvement_surcharge,
		total_amount::double as total_amount,
		congestion_surcharge::double as congestion_surcharge,
		airport_fee::double as airport_fee,
		filename
	from source
)

select * from renamed