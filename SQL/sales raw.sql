CREATE Schema raw;

CREATE TABLE [raw].[orders]
(
order_id VARCHAR(50),
quantity INT,
price DECIMAL(10,2),
order_date DATETIME,
shipping_address VARCHAR(100),
raw_data_source VARCHAR(50),
ingestion_timestamp DATETIME DEFAULT GETDATE()
PRIMARY KEY (order_id)
);

CREATE TABLE [raw].[customer]
(
customer_id VARCHAR(50),
name VARCHAR(50),
email VARCHAR(50),
address VARCHAR(100),
age INT,
gender VARCHAR(10),
signup_date DATETIME,
raw_data_source VARCHAR(50),
ingestion_timestamp DATETIME DEFAULT GETDATE()
PRIMARY KEY (customer_id)
);

CREATE TABLE [raw].[products]
(
product_id VARCHAR(50),
name VARCHAR(50),
category VARCHAR(50),
brand VARCHAR(50),
cost_price DECIMAL(10,2),
selling_price DECIMAL(10,2),
raw_data_source VARCHAR(50),
ingestion_timestamp DATETIME DEFAULT GETDATE()
PRIMARY KEY (product_id)
);

CREATE TABLE [raw].[sales_transaction]
(
transaction_id VARCHAR(50),
order_id VARCHAR(50),
customer_id VARCHAR(50),
product_id VARCHAR(50),
total_amount DECIMAL(10,2),
discount DECIMAL(10,2),
tax DECIMAL(10,2),
refund_amount DECIMAL(10,2),
transaction_date DATETIME,
raw_data_source VARCHAR(50),
ingestion_timestamp DATETIME DEFAULT GETDATE()
PRIMARY KEY (transaction_id)
);

