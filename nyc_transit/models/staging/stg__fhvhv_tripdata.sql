with source as (
	select * from {{ source('main','fhvhv_tripdata')}}
),

renamed as (
	select 
		hvfhs_license_num,
		dispatching_base_num,
		originating_base_num,
		request_datetime::timestamp as request_datetime,
		on_scene_datetime::timestamp as on_scene_datetime,
		pickup_datetime::timestamp as pickup_datetime,
		dropoff_datetime::timestamp as dropoff_datetime,
		pulocationid::int as pulocationid,
		dolocationid::int as dolocationid,
		trip_miles::double as trip_miles,
		trip_time::int as trip_time,
		base_passenger_fare::double as base_passenger_fare,
		tolls::double as tolls,
		bcf::double as bcf,
		sales_tax::double as sales_tax,
		congestion_surcharge::double as congestion_surcharge,
	/*	airport_fee,*/ -- remove, all empty
		tips::double as tips,
		driver_pay::double as driver_pay,
		shared_request_flag,
	/*	shared_match_flag
		access_a_ride_flag
		wav_request_flag
		wav_match_flag */ -- remove, all empty
		filename
	from source
)

select * from renamed 