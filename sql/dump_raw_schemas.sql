.echo on -- Ensures that the SQL commands being executed are printed to the output

-- Show all the tables in the current database
SHOW TABLES;

-- Describe all schemas
SELECT 'bike_data';
DESCRIBE "bike_data";

SELECT 'central_park_weather';
DESCRIBE "central_park_weather";

SELECT 'fhv_bases';
DESCRIBE "fhv_bases";

SELECT 'fhv_tripdata';
DESCRIBE "fhv_tripdata";

SELECT 'fhvhv_tripdata';
DESCRIBE "fhvhv_tripdata";

SELECT 'green_tripdata';
DESCRIBE "green_tripdata";

SELECT 'yellow_tripdata';
DESCRIBE "yellow_tripdata";