-- This query removes duplicate rows (aka. combo of event_id + user_id) from events.csv
-- prefer rows with a later time stamp (event_timestamp)
-- Tables used: events.csv

SELECT
    insert_timestamp,
    event_id,
    event_type,
    user_id,
    event_timestamp
FROM
    {{ ref('events') }}
QUALIFY
    ROW_NUMBER() OVER (PARTITION BY event_id, user_id ORDER BY event_timestamp DESC) = 1;