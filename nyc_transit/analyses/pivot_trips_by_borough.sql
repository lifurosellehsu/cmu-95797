-- This query sums trips by borough
-- Tables used: mart__fact_trips_by_borough

PIVOT {{ ref('mart__fact_trips_by_borough')}}
ON pickup_borough
USING SUM(number_of_trips);