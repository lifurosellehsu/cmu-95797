select 
  {{ dbt_utils.star(ref('taxi+_zone_lookup')) }}  -- select all columns from the referenced table taxi+_zone_lookup.
from {{ ref('taxi+_zone_lookup') }}