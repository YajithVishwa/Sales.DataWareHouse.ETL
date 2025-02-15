create schema gold;

CREATE TABLE gold.Fact_Sales_Transactions (
    transaction_id UNIQUEIDENTIFIER,
    order_id UNIQUEIDENTIFIER,
    customer_id UNIQUEIDENTIFIER,
    product_id UNIQUEIDENTIFIER,
    transaction_date DATE NOT NULL,
    total_quantity INT NOT NULL,
    total_revenue DECIMAL(12,2) NOT NULL,
    total_discount DECIMAL(12,2) NOT NULL,
    total_tax DECIMAL(12,2) NOT NULL,
    total_refund DECIMAL(12,2) NOT NULL,
    net_sales AS (total_revenue - total_discount + total_tax - total_refund) PERSISTED
);

CREATE TABLE gold.Dim_Customers (
    customer_id UNIQUEIDENTIFIER PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    email NVARCHAR(150),
    age INT,
    gender NVARCHAR(10),
    signup_date DATE,
    total_orders INT DEFAULT 0,
    total_spent DECIMAL(12,2) DEFAULT 0,
    lifetime_value AS (NULLIF(total_spent, 0) / NULLIF(total_orders, 0))
);

CREATE TABLE gold.Dim_Products (
    product_id UNIQUEIDENTIFIER PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    category NVARCHAR(50) NOT NULL,
    brand NVARCHAR(100),
    cost_price DECIMAL(10,2),
    selling_price DECIMAL(10,2),
    total_units_sold INT DEFAULT 0,
    total_revenue DECIMAL(12,2) DEFAULT 0,
    profit_margin AS 
        ((NULLIF(total_revenue, 0) - (total_units_sold * cost_price)) / NULLIF(total_revenue, 0) * 100)
);

CREATE TABLE gold.Dim_Orders (
    order_id UNIQUEIDENTIFIER,
    order_date DATE NOT NULL,
    customer_id UNIQUEIDENTIFIER,
    total_order_value DECIMAL(12,2) DEFAULT 0,
    total_items INT DEFAULT 0
);
