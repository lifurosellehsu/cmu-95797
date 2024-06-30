# print out table_name + row counts for each of 4 tables: yellow_tripdata, green_tripdata, fhvhv_tripdata, fhv_tripdata

import duckdb

# connect to the DuckDB database
con = duckdb.connect('main.db')

# list of tables to check
tables = ['yellow_tripdata', 'green_tripdata', 'fhvhv_tripdata', 'fhv_tripdata','citibike_tripdata','central_park_weather','fhv_bases']

# open the output file
with open('answers/raw_counts.txt', 'w') as f:
    # a function to print table name and row count
    def print_table_counts(con, table):
        result = con.execute(f'SELECT COUNT(*) FROM {table}').fetchall()
        f.write(f'Table: {table}, Row Count: {result[0][0]}\n')

    # iterate over the tables and print row counts
    for table in tables:
        print_table_counts(con, table)

# close the connection
con.close()