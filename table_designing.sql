-- based on star-schema

-- Dimension Table
CREATE TABLE pre_customer_detail (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    gender VARCHAR(10),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE pre_product_detail (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price NUMERIC(10, 2)
);

--- Fact Table
CREATE TABLE transaction_table (
    transaction_id VARCHAR(25) PRIMARY KEY,  
    transaction_date DATE,                   
    payment_method VARCHAR(20),              
    shipping_cost NUMERIC(10, 2),            
    order_status VARCHAR(20),                
    order_type VARCHAR(20),                 
    product_id INTEGER,           -- Foreign key linking to the Product table
    customer_id INTEGER           -- Foreign key linking to the Customer table
);

  -- FOREIGN KEY (product_id) REFERENCES products(product_id),
  -- FOREIGN KEY (customer_id) REFERENCES customers(customer_id),

-- Dimension table loading
INSERT INTO pre_product_detail(product_id, product_name, price)
SELECT product_id, product_name, price
FROM pre_staging_table;

INSERT INTO pre_customer_detail(customer_id, first_name, last_name, email, gender, city, state)
SELECT customer_id, first_name, last_name, email, gender, city, state
FROM pre_staging_table;

-- Fact table loading
INSERT INTO transaction_table (transaction_id, transaction_date, product_id, customer_id, payment_method, shipping_cost, order_status, order_type)
SELECT 
	transaction_id, 
	transaction_date, 
	p.product_id, 
	c.customer_id, 
	payment_method, 
	shipping_cost, 
	order_status, 
	order_type
FROM pre_staging_table stg
JOIN pre_product_detail p ON stg.product_id = p.product_id
JOIN pre_customer_detail c ON stg.customer_id = c.customer_id