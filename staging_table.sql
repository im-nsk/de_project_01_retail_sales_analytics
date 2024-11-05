-- 1. Create `staging_table` table in the database, here I'm using `postgresql` db. 

CREATE TABLE staging_table (
    transaction_id VARCHAR(25) PRIMARY KEY,
    transaction_date VARCHAR(15),
    payment_method VARCHAR(20),
    shipping_cost NUMERIC(10, 2),
    order_status VARCHAR(20),
    order_type VARCHAR(20),
    product_id INTEGER,
    product_name VARCHAR(100),
    price NUMERIC(10, 2),
    customer_id INTEGER,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    gender VARCHAR(10),
    city VARCHAR(50),
    state VARCHAR(50)
);
