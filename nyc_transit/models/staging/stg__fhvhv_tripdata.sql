with source as (

    select * from {{ source('main', 'fhvhv_tripdata') }}
	
),

renamed as (

    select
        hvfhs_license_num,
        trim(upper(dispatching_base_num)) as dispatching_base_num,
        trim(upper(originating_base_num)) as originating_base_num,
        request_datetime,
        on_scene_datetime,
        pickup_datetime,
        dropoff_datetime,
        pulocationid,
        dolocationid,
        trip_miles,
        trip_time,
        base_passenger_fare,
        tolls,
        bcf,
        sales_tax,
        congestion_surcharge,
        airport_fee,
        tips,
        driver_pay,
        {{ flag_to_bool('shared_request_flag', 'Y', 'N', ' ') }} as shared_request_flag,
        {{ flag_to_bool('shared_match_flag', 'Y', 'N', ' ') }} as shared_match_flag,
        {{ flag_to_bool('access_a_ride_flag', 'Y', 'N', ' ') }} as access_a_ride_flag,
        {{ flag_to_bool('wav_request_flag', 'Y', 'N', ' ') }} as wav_request_flag,
        {{ flag_to_bool('wav_match_flag', 'Y', 'N', ' ') }} as wav_match_flag,
        filename
		
    from source
	
)

select * from renamed
