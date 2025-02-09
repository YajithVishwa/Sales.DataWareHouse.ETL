CREATE Schema silver;

CREATE TABLE [silver].[Dim_Products] (
    product_id UNIQUEIDENTIFIER PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    category NVARCHAR(50) NOT NULL,
    brand NVARCHAR(100),
    cost_price DECIMAL(10,2) CHECK (cost_price >= 0),
    selling_price DECIMAL(10,2),
    markup_percentage AS ((selling_price - cost_price) / cost_price * 100) PERSISTED,
    profit_margin AS ((selling_price - cost_price) / selling_price * 100) PERSISTED,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE [silver].[Dim_Customers] (
    customer_id UNIQUEIDENTIFIER PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    email NVARCHAR(150),
    address NVARCHAR(255),
    age INT,
    gender NVARCHAR(10),
    signup_date DATETIME NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE [silver].[Dim_Orders] (
    order_id UNIQUEIDENTIFIER PRIMARY KEY,
    order_date DATETIME NOT NULL,
    shipping_address NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE [silver].[Fact_Sales_Transactions] (
    transaction_id UNIQUEIDENTIFIER PRIMARY KEY,
    order_id UNIQUEIDENTIFIER,
    customer_id UNIQUEIDENTIFIER,
    product_id UNIQUEIDENTIFIER,
    transaction_date DATETIME NOT NULL,
    discount DECIMAL(10,2) DEFAULT 0 CHECK (discount >= 0),
    tax DECIMAL(10,2) DEFAULT 0 CHECK (tax >= 0),
    refund_amount DECIMAL(10,2) DEFAULT 0 CHECK (refund_amount >= 0),
    total_amount DECIMAL(10,2),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);
