/* creating 4 tables using tables from /data/data/taxi */

create table yellow_tripdata as select * from 
read_parquet('./data/data/taxi/yellow_tripdata*.parquet',  -- extracting all records from tables in data/taxi that have table names like yellow_tripdata...
filename=True); --adds a column in the newly created table to indicate where each row of record is extracted from 

create table green_tripdata as select * from read_parquet('./data/data/taxi/green_tripdata*.parquet', filename=True); 

create table fhvhv_tripdata as select * from read_parquet('./data/data/taxi/fhvhv_tripdata*.parquet', filename=True); 

create table fhv_tripdata as select * from read_parquet('./data/data/taxi/fhv_tripdata*.parquet', filename=True); 

/* creating 2 tables using tables from /data/data */

create table central_park_weather as select * from read_csv('data/data/central_park_weather.csv', filename = true);

create table fhv_bases as select * from read_csv('data/data/fhv_bases.csv', filename = true);

/* creating 1 tables using table from /data/data/citibike-tripdata.csv.gz */

create table citibike_tripdata as select * from read_csv_auto('data/data/citibike-tripdata.csv.gz'); 