with source as (

  select * from {{ source('main', 'bike_data') }}

),

renamed as (

  select
    tripduration::int as tripduration,
    starttime::timestamp as starttime,
    stoptime::timestamp as stoptime,
    "start station id"::int as start_station_id,
    "start station name",
    "start station latitude"::double as start_station_latitude,
    "start station longitude"::double as start_station_longitude,
    "end station id"::int as end_station_id,
    "end station name",
    "end station latitude"::double as end_station_latitude,
    "end station longitude"::double as end_station_longitude,
    bikeid::int as bikeid,
    usertype,
    "birth year"::int as birth_year,
    gender::int as gender,
    filename
  from source
  
)

select * from renamed