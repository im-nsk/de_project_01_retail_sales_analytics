
-- 2. Load the data from file to table, using copy command
-- To use the copy command, connect the psql  shell with the db. Write the copy command on shell

\COPY staging_table FROM 'C:\Desktop\retail_sales_data.csv' DELIMITER ',' CSV HEADER;

-- `Note`: file path is irrespective of the slash

-- Column name data type modification string into date type:
ALTER TABLE staging_table
ALTER COLUMN transaction_date TYPE DATE
USING TO_DATE(transaction_date, 'MM/DD/YYYY');
