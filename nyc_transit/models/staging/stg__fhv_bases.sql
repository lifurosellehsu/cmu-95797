with source as (
	select * from {{ source('main','fhv_bases')}}
),

renamed as (  
	select -- not doing any transformation here, keeping original varchar
		base_number,
		base_name,
		dba,
		dba_category,
		filename
	from source
)

select * from renamed 