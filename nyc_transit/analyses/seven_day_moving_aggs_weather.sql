-- This query calculate the 7 day moving min, max, avg, sum for precipitation and snow for every day in the weather data
-- defining the window only once 
-- Tables used: stg__central_park_weather

SELECT
    date,
    prcp,
    snow,
    ROUND(MIN(prcp) OVER seven_day_window, 2) AS moving_min_prcp,
    ROUND(MAX(prcp) OVER seven_day_window, 2) AS moving_max_prcp,
    ROUND(AVG(prcp) OVER seven_day_window, 2) AS moving_avg_prcp,
    ROUND(SUM(prcp) OVER seven_day_window, 2) AS moving_sum_prcp,
    ROUND(MIN(snow) OVER seven_day_window, 2) AS moving_min_snow,
    ROUND(MAX(snow) OVER seven_day_window, 2) AS moving_max_snow,
    ROUND(AVG(snow) OVER seven_day_window, 2) AS moving_avg_snow,
    ROUND(SUM(snow) OVER seven_day_window, 2) AS moving_sum_snow
FROM
    {{ ref('stg__central_park_weather') }}
WINDOW
    seven_day_window AS (ORDER BY date ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING)
ORDER BY
    date;