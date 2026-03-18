show databases;
use my_demo_db;
-- 3.1 STAR_SCHEMA DESIGN:

-- 1. Creation of Dimension Tables
CREATE TABLE dim_date (
    date_key DATE PRIMARY KEY,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL,
    quarter INT NOT NULL
);
CREATE TABLE dim_store (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);
CREATE TABLE dim_product (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);
-- 2. Creation of central Fact Table

CREATE TABLE fact_sales (
    transaction_id VARCHAR(50) PRIMARY KEY,
    date_key DATE REFERENCES dim_date(date_key),
    store_id INT REFERENCES dim_store(store_id),
    product_id INT REFERENCES dim_product(product_id),
    units_sold INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    total_revenue DECIMAL(12, 2) NOT NULL
);

-- 3. Inserting Cleaned Sample Data into respective tables (Reflecting fixes for Casing and Missing City)
-- Fixes: 'electronics' -> 'Electronics', 'Groceries' -> 'Grocery'
-- Missing store cities filled based on store name context

INSERT INTO dim_store (store_name, city) VALUES 
('Chennai Anna', 'Chennai'),
('Delhi South', 'Delhi'),
('Bangalore MG', 'Bangalore'),
('Pune FC Road', 'Pune'),
('Mumbai Central', 'Mumbai');

INSERT INTO dim_product (product_name, category) VALUES 
('Speaker', 'Electronics'),
('Tablet', 'Electronics'),
('Phone', 'Electronics'),
('Atta 10kg', 'Grocery'),
('Biscuits', 'Grocery'),
('Jeans', 'Clothing'),
('Saree', 'Clothing');

INSERT INTO dim_date (date_key, day, month, year, quarter) VALUES 
('2023-08-29', 29, 8, 2023, 3),
('2023-12-12', 12, 12, 2023, 4),
('2023-02-05', 5, 2, 2023, 1),
('2023-02-20', 20, 2, 2023, 1),
('2023-12-08', 8, 12, 2023, 4),
('2023-08-09', 9, 8, 2023, 3),
('2023-10-26', 26, 10, 2023, 4),
('2023-08-01', 1, 8, 2023, 3),
('2023-10-29', 29, 10, 2023, 4),
('2023-03-31', 31, 3, 2023, 1);

-- Standardization of Fact Data (10 Rows)
-- Note: total_revenue is pre-calculated (units_sold * unit_price)

INSERT INTO fact_sales (transaction_id, date_key, store_id, product_id, units_sold, unit_price, total_revenue) VALUES
('TXN5000', '2023-08-29', 1, 1, 3, 49262.78, 147788.34),
('TXN5001', '2023-12-12', 1, 2, 11, 23226.12, 255487.32),
('TXN5002', '2023-02-05', 1, 3, 20, 48703.39, 974067.80),
('TXN5003', '2023-02-20', 2, 2, 14, 23226.12, 325165.68),
('TXN5005', '2023-08-09', 3, 4, 12, 52464.00, 629568.00),
('TXN5006', '2023-03-31', 4, 3, 6, 58851.01, 353106.06),
('TXN5007', '2023-10-26', 4, 6, 16, 2317.47, 37079.52),
('TXN5008', '2023-12-08', 3, 5, 9, 27469.99, 247229.91),
('TXN5016', '2023-08-01', 5, 7, 11, 35451.81, 389969.91),
('TXN5033', '2023-10-29', 5, 4, 8, 52464.00, 419712.00);

